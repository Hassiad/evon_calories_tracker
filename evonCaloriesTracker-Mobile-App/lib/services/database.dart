// import 'dart:convert';
//
// import 'package:evon_calories_tracker/models/food_track_task.dart';
// import 'package:http/http.dart' as http;
//
// class DatabaseService {
//   final String uid;
//   final DateTime currentDate;
//   DatabaseService({required this.uid, required this.currentDate});
//
//   Future<void> addFoodTrackEntry(FoodTrackTask food) async {
//     const url = 'https://9880-102-89-23-181.ngrok-free.app/api/v1/foodTracks';
//     final response = await http.post(
//       Uri.parse(url),
//       body: json.encode({
//         'food_name': food.food_name,
//         'calories': food.calories,
//         'carbs': food.carbs,
//         'fat': food.fat,
//         'protein': food.protein,
//         'mealTime': food.mealTime,
//         'createdOn': food.createdOn.toIso8601String(),
//         'grams': food.grams,
//       }),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode != 201) {
//       throw Exception('Failed to add food track entry');
//     }
//   }
//
//   Future<void> deleteFoodTrackEntry(FoodTrackTask deleteEntry) async {
//     final url =
//         'http://your-backend-api.com/foodTracks/${deleteEntry.createdOn.millisecondsSinceEpoch}';
//     final response = await http.delete(Uri.parse(url));
//
//     if (response.statusCode != 200) {
//       throw Exception('Failed to delete food track entry');
//     }
//   }
//
//   Future<List<FoodTrackTask>> getAllFoodTrackData() async {
//     final url = 'http://your-backend-api.com/foodTracks';
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode != 200) {
//       throw Exception('Failed to retrieve food track entries');
//     }
//
//     final List<dynamic> data = json.decode(response.body);
//     return data.map((item) {
//       return FoodTrackTask(
//         food_name: item['food_name'],
//         calories: item['calories'],
//         carbs: item['carbs'],
//         fat: item['fat'],
//         protein: item['protein'],
//         mealTime: item['mealTime'],
//         createdOn: DateTime.parse(item['createdOn']),
//         grams: item['grams'],
//       );
//     }).toList();
//   }
// }

import 'dart:convert';

import 'package:evon_calories_tracker/models/food_track_task.dart';
import 'package:http/http.dart' as http;

class DatabaseService {
  final String uid;
  final DateTime currentDate;
  DatabaseService({required this.uid, required this.currentDate});

  final DateTime today =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final DateTime weekStart = DateTime(2020, 09, 07);

  final String baseUrl =
      'https://9880-102-89-23-181.ngrok-free.app/api/v1/foodTracks'; // Replace with your backend server URL

  Future addFoodTrackEntry(FoodTrackTask food) async {
    final response = await http.post(Uri.parse('$baseUrl/foodTrack'),
        body: jsonEncode(food.toJson()),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to add food track entry');
    }
  }

  Future deleteFoodTrackEntry(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/foodTrack/$id'));

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete food track entry');
    }
  }

  Future<List<FoodTrackTask>> getAllFoodTrackData() async {
    final response = await http.get(Uri.parse('$baseUrl/foodTracks'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((item) => FoodTrackTask.fromJson(item)).toList();
    } else {
      throw Exception('Failed to get food track entries');
    }
  }

  List<FoodTrackTask> _foodTrackListFromSnapshot(List<dynamic> snapshot) {
    return snapshot.map((doc) {
      return FoodTrackTask(
        id: doc['id'],
        food_name: doc['food_name'] ?? '',
        calories: doc['calories'] ?? 0,
        carbs: doc['carbs'] ?? 0,
        fat: doc['fat'] ?? 0,
        protein: doc['protein'] ?? 0,
        mealTime: doc['mealTime'] ?? "",
        createdOn: DateTime.parse(doc['createdOn']) ?? DateTime.now(),
        grams: doc['grams'] ?? 0,
      );
    }).toList();
  }

  Stream<List<FoodTrackTask>> get foodTracks {
    return http
        .get(Uri.parse('$baseUrl/foodTracks'))
        .asStream()
        .map((response) {
      final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
      return _foodTrackListFromSnapshot(data);
    });
  }

  Future<String> getFoodTrackData(String uid) async {
    final response = await http.get(Uri.parse('$baseUrl/foodTrack/$uid'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get food track data');
    }
  }

  Future<FoodTrackTask> loadFoodTrackEntryToDatabase() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return FoodTrackTask(
          food_name: "Oatmeal",
          calories: 20,
          carbs: 20,
          protein: 20,
          fat: 20,
          mealTime: "Lunch",
          createdOn: DateTime.now(),
          grams: 20);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
