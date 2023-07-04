const { DataTypes } = require('sequelize');
const sequelize = require('../db/database');

const TokenManager = sequelize.define('token_managers', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  accountId: { type: DataTypes.STRING(100), allowNull: false },
  Token: { type: DataTypes.STRING(500), allowNull: true },
  tokenExpires: { type: DataTypes.DATE, allowNull: true },
  operationType: { type: DataTypes.STRING(100), allowNull: true },
  status: { type: DataTypes.STRING(20), defaultValue: '1', allowNull: true }
});

TokenManager.prototype.createToken = function() {
  const generatedToken = Math.floor(100000 + Math.random() * 987654);

  // eslint-disable-next-line radix
  this.Token = parseInt(generatedToken);

  this.tokenExpires = Date.now() + 10 * 60 * 1000;

  return generatedToken;
};

module.exports = TokenManager;
