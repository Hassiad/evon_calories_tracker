const dotenv = require('dotenv');
// eslint-disable-next-line no-unused-vars
const { Sequelize, Op, Model, DataTypes } = require('sequelize');

dotenv.config({ path: './config.env' });

const sequelize = new Sequelize(
  process.env.DATABASE_NAME,
  process.env.DATABASE_USERNAME,
  process.env.DATABASE_PASSWORD,
  {
    host: process.env.DATABASE_HOST,
    dialect: process.env.DATABASE_DIALECT,
    // logging: false,

    pool: {
      max: 5,
      min: 0,
      acquire: process.env.POOL_ACQUIRE,
      idle: process.env.POOL_IDLE
    }
  }
);

module.exports = sequelize;
