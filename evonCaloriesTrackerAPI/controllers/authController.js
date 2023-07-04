/* eslint-disable camelcase */
const { Op } = require('sequelize');
const bcrypt = require('bcryptjs');
const { promisify } = require('util');
const jwt = require('jsonwebtoken');
const validator = require('validator');
const sequelize = require('../db/database');
const User = require('./../models/userAccountModel');
const catchAsync = require('./../utils/catchAsync');
const AppError = require('./../utils/appError');
const Email = require('./../utils/email');
const TokenManager = require('./../models/tokenManagerModel');

const signToken = id => {
  return jwt.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRES_IN
  });
};

const createSendToken = (data, message, statusCode, res) => {
  const token = signToken(data.id);
  const cookieOptions = {
    expires: new Date(
      Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * 24 * 60 * 60 * 1000
    ),
    httpOnly: true
  };
  if (process.env.NODE_ENV === 'production') cookieOptions.secure = true;

  res.cookie('jwt', token, cookieOptions);

  // Remove password from output
  data.password = undefined;

  res.status(statusCode).json({
    status: 'success',
    token,
    message,
    data
  });
};

exports.signup = catchAsync(async (req, res, next) => {
  let accountId = Math.floor(100000 + Math.random() * 9876543210);
  // eslint-disable-next-line radix
  accountId = parseInt(accountId);

  // eslint-disable-next-line no-use-before-define
  await hashPassword(req);

  const user = await User.create({
    userName: req.body.userName,
    email: req.body.email,
    password: req.body.password,
    accountId: accountId,
    profileImageURL:
      'https://kycdocumentsuploads.s3.us-east-2.amazonaws.com/default.jpg'
  });

  createSendToken(
    user,
    `Dear ${req.body.userName} you have successfuly SignUp`,
    201,
    res
  );
});

exports.login = catchAsync(async (req, res, next) => {
  const { email, password } = req.body;

  // 1) Check if email and password exist
  if (!email || !password) {
    return next(
      new AppError('Please provide email or phone number and password!', 200)
    );
  }
  // 2) Check if user exists && password is correct
  const user = await User.findOne({
    where: {
      email: email
    }
  });

  // eslint-disable-next-line no-use-before-define
  if (!user || !(await user.correctPassword(password, user.password))) {
    return next(
      new AppError('Incorrect email or phone number or password', 200)
    );
  }
  // 3) If everything ok, send token to client
  createSendToken(
    user,
    `Dear ${user.userName} you have successfuly Login`,
    200,
    res
  );
});

exports.logout = (req, res) => {
  res.cookie('jwt', 'loggedout', {
    expires: new Date(Date.now() + 10 * 1000),
    httpOnly: true
  });
  res.status(200).json({
    status: 'success',
    message: 'Logged out successfully.'
  });
};

exports.protect = catchAsync(async (req, res, next) => {
  // 1) Getting token and check of it's there
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    token = req.headers.authorization.split(' ')[1];
  } else if (req.cookies.jwt) {
    token = req.cookies.jwt;
  }
  if (!token) {
    return next(
      new AppError('You are not logged in! Please log in to get access.', 401)
    );
  }

  // 2) Verification token
  const decoded = await promisify(jwt.verify)(token, process.env.JWT_SECRET);
  // 3) Check if user still exists
  const currentUser = await User.findByPk(decoded.id);
  if (!currentUser) {
    return next(
      new AppError(
        'The user belonging to this token does no longer exist.',
        401
      )
    );
  }

  // GRANT ACCESS TO PROTECTED ROUTE
  req.user = currentUser;
  // console.log(req.user);
  res.locals.user = currentUser;
  next();
});

exports.forgotPassword = catchAsync(async (req, res, next) => {
  // 1) Get user based on POSTed email
  const user = await User.findOne({ where: { email: req.body.email } });
  if (!user) {
    return next(new AppError('There is no user with email address.', 200));
  }

  const userPasswordReset = await TokenManager.create({
    accountId: user.accountId
    // status: status
  });

  // 2) Generate the random reset token
  const resetToken = userPasswordReset.createToken();

  userPasswordReset.operationType = 'Password Reset';
  await userPasswordReset.save();

  // 3) Send it to user's email

  try {
    await new Email(
      user.email,
      resetToken,
      user.firstName
    ).sendForgotPassword();

    res.status(200).json({
      status: 'success',
      message: 'Token sent to email!'
    });
  } catch (err) {
    console.log(err);
    return next(
      new AppError('There was an error sending the email. Try again later!'),
      500
    );
  }
});

exports.resetPassword = catchAsync(async (req, res, next) => {
  // 1) Get user based on the token
  // eslint-disable-next-line no-use-before-define
  await hashPassword(req);

  const { token } = req.body;

  const userPasswordReset = await TokenManager.findOne({
    where: {
      Token: token,
      tokenExpires: { [Op.gt]: Date.now() },
      // accountId: req.user.accountId,
      operationType: 'Password Reset'
    }
  });

  // 2) If token has not expired, and there is user, set the new password
  if (!userPasswordReset) {
    return next(new AppError('Token is invalid or has expired', 200));
  }

  const user = await User.findOne({
    where: {
      accountId: userPasswordReset.accountId
    }
  });

  user.password = req.body.password;
  await user.save();

  try {
    await new Email(
      user.email,
      `resetToken`,
      user.firstName
    ).sendPasswordReset();
    console.log('Token sent to email!');

    createSendToken(user, `Password Successfully Reset`, 200, res);
  } catch (err) {
    console.log(err);
    console.log('There was an error sending the email. Try again later!');

    createSendToken(user, `Password Successfully Reset`, 200, res);
  }
});

exports.updatepassword = catchAsync(async (req, res, next) => {
  // 1) Get user from collection
  // eslint-disable-next-line no-use-before-define
  await hashPassword(req);

  const user = await User.findByPk(req.user.id);

  // 2) Check if POSTed current password is correct
  if (!(await user.correctPassword(req.body.passwordCurrent, user.password))) {
    return next(new AppError('Your current password is wrong.', 200));
  }

  // 3) If so, update password
  user.password = req.body.password;
  await user.save();

  // 4) Log user in, send JWT
  createSendToken(
    user,
    `Dear ${user.firstName} ${user.lastName} your password have been successfuly updated`,
    200,
    res
  );
});

// hash password if it exists
const hashPassword = async req => {
  if (req.body.password) {
    req.body.password = await bcrypt.hash(req.body.password, 12);
  }
};
