const dbConfig = require("./db.config.js");

const { Sequelize, DataTypes, Model } = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
  host: dbConfig.HOST,
  dialect: dbConfig.dialect,
  port: dbConfig.port,

  pool: {
    max: dbConfig.pool.max,
    min: dbConfig.pool.min,
    acquire: dbConfig.pool.acquire,
    idle: dbConfig.pool.idle
  }
});

class Wallet extends Model {}

Wallet.init({
  address: {
    type: DataTypes.STRING,
    primaryKey: true,
    autoIncrement: false,
    allowNull: false
  }
}, {
  sequelize,
  modelName: 'Wallet',
  tableName: 'Wallet',
  timestamps: false
});

const getWalletByAddress = async (address = null) => {
  if(address.length !== 42) {
    return false;
  }
  const wallet = await Wallet.findByPk(address);
  return await wallet === null ? false : true;
};

module.exports = {
  getWalletByAddress
};