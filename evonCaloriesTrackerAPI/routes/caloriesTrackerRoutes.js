const express = require('express');
const CaloriesTrackerController = require('./../controllers/caloriesTrackerController');
const authController = require('./../controllers/authController');

const router = express.Router();

// Protect all routes after this middleware
router.use(authController.protect);
router.post('/caloriesEntry', CaloriesTrackerController.createCalories);
router.get('/calories/:id', CaloriesTrackerController.getCaloriesbyID);
router.get('/caloriesEntry', CaloriesTrackerController.getAllCalories);
router.delete(
  '/deleteCalories/:id',
  CaloriesTrackerController.deleteCaloriesbyID
);

module.exports = router;
