const { DataTypes } = require('sequelize');
const bcrypt = require('bcryptjs');
const sequelize = require('../db/database');

const UserAccount = sequelize.define('user_accounts', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  userName: {
    type: DataTypes.STRING(100),
    allowNull: false,
    validate: {
      notNull: { msg: 'User name cannot be blank' }
    }
  },
  email: {
    type: DataTypes.STRING(200),
    allowNull: false,
    unique: true,
    // lowercase: true,
    validate: {
      notNull: { msg: 'Email field is required' },
      isEmail: { msg: 'Please provide a valid email' }
    }
  },
  password: {
    type: DataTypes.STRING(500),
    allowNull: false,
    validate: {
      notNull: { msg: 'Please provide a password' }
    }
  },
  accountId: { type: DataTypes.STRING(50), allowNull: false, unique: true },
  profileImageURL: { type: DataTypes.STRING(200), allowNull: true }
});

UserAccount.prototype.correctPassword = async function(
  candidatePassword,
  userPassword
) {
  return await bcrypt.compare(candidatePassword, userPassword);
};

module.exports = UserAccount;
