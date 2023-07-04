const dotenv = require('dotenv');
const sequelize = require('./db/database');

dotenv.config({ path: './config.env' });
const app = require('./app');

sequelize.sync().then(async () => {
  try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
});

const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log(`App running on port ${port}...`);
});
