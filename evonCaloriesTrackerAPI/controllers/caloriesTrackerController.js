/* eslint-disable camelcase */
const CaloriesTracker = require('../models/caloriesTrackerModel');
const catchAsync = require('./../utils/catchAsync');

exports.createCalories = catchAsync(async (req, res, next) => {
  const {
    food_name,
    calories,
    carbs,
    fat,
    protein,
    mealTime,
    createdOn,
    grams
  } = req.body;

  const caloriesEntry = await CaloriesTracker.create({
    food_name,
    calories,
    carbs,
    fat,
    protein,
    mealTime,
    createdOn,
    grams
  });

  res.status(200).json({
    status: 'success',
    message: 'Calories entry created successfully',
    data: caloriesEntry
  });
});

exports.deleteCaloriesbyID = catchAsync(async (req, res, next) => {
  const { accountId } = req.params;

  await CaloriesTracker.destroy({ where: { accountId } });

  res.status(200).json({
    status: 'success',
    message: 'Calories entry deleted successfully'
  });
});

exports.getCaloriesbyID = catchAsync(async (req, res, next) => {
  await CaloriesTracker.findOne({ where: { accountId: req.user.accountId } });

  res.status(200).json({
    status: 'success',
    message: 'Calories entry deleted successfully'
  });
});

exports.getAllCalories = catchAsync(async (req, res, next) => {
  await CaloriesTracker.findAll();

  res.status(200).json({
    status: 'success',
    message: 'Calories entry deleted successfully'
  });
});
