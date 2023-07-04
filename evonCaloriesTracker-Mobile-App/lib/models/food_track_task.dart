import 'package:evon_calories_tracker/utils/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FoodTrackTask {
  String id;
  String food_name;
  num calories;
  num carbs;
  num fat;
  num protein;
  String mealTime;
  DateTime createdOn;
  num grams;

  FoodTrackTask({
    required this.food_name,
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.mealTime,
    required this.createdOn,
    required this.grams,
    String? id,
  }) : this.id = id ?? Uuid().generateV4();

  factory FoodTrackTask.fromJson(Map<String, dynamic> json) {
    return FoodTrackTask(
      id: json['id'],
      food_name: json['food_name'],
      calories: json['calories'],
      carbs: json['carbs'],
      fat: json['fat'],
      protein: json['protein'],
      mealTime: json['mealTime'],
      createdOn: DateTime.parse(json['createdOn']),
      grams: json['grams'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food_name': food_name,
      'calories': calories,
      'carbs': carbs,
      'fat': fat,
      'protein': protein,
      'mealTime': mealTime,
      'createdOn': createdOn.toIso8601String(),
      'grams': grams,
    };
  }
}
