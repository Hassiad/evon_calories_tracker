const path = require('path');
const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const AppError = require('./utils/appError');
// const globalErrorHandler = require('./controllers/errorController');
const globalErrorHandler = require('./utils/errorHandler');
const userRouter = require('./routes/userRoutes');
const caloriesRouter = require('./routes/caloriesTrackerRoutes');

const app = express();

app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'views'));

// 1) GLOBAL MIDDLEWARES
// Serving static files
app.use(express.static(path.join(__dirname, 'public')));

// Development logging
if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}

// enabling cors for all requests by using cors middleware
app.use(cors());
// Enable pre-flight
app.options('*', cors());

// Body parser, reading data from body into req.body
app.use(express.json({ limit: '10kb' }));
app.use(express.urlencoded({ extended: true, limit: '10kb' }));
app.use(cookieParser());

// 3) ROUTES

app.get('/', (req, res) => {
  res.json({ message: 'Welcome to Evon Calories Tracker API application.' });
});
app.use('/api/v1/users', userRouter);
app.use('/api/v1/calories', caloriesRouter);

app.all('*', (req, res, next) => {
  next(new AppError(`Can't find ${req.originalUrl} on this server!`, 404));
});

app.use(globalErrorHandler);

module.exports = app;
