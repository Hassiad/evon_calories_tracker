// eslint-disable-next-line no-unused-vars
const { Sequelize, Op, Model, DataTypes } = require('sequelize');
const sequelize = require('../db/database');

const CaloriesTracker = sequelize.define('foodTrack', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  food_name: { type: DataTypes.STRING(100), allowNull: true },
  calories: { type: DataTypes.INTEGER, allowNull: true },
  carbs: { type: DataTypes.INTEGER, allowNull: true },
  fat: { type: DataTypes.INTEGER, allowNull: true },
  protein: { type: DataTypes.INTEGER, allowNull: true },
  mealTime: { type: DataTypes.STRING(100), allowNull: true },
  createdOn: {
    type: DataTypes.DATE,
    allowNull: true,
    defaultValue: DataTypes.NOW
  },
  grams: { type: DataTypes.INTEGER, allowNull: true },
  accountId: { type: DataTypes.STRING(50), allowNull: false }
});

module.exports = CaloriesTracker;
