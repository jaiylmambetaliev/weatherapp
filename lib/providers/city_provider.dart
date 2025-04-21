import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class CityProvider extends ChangeNotifier {
  final List<String> _cities = [];

  final FirebaseApp app = Firebase.app();

  final _db = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: "https://mainorweatherapp-default-rtdb.europe-west1.firebasedatabase.app"
  ).ref('cities');

  bool _isLoading = true;

  List<String> get cities => List.unmodifiable(_cities);
  bool get isLoading => _isLoading;

  Future<void> loadCitiesFromFirebase() async {
    try {
      final snapshot = await _db.get();
      _cities.clear();

      if (snapshot.exists) {
        final data = snapshot.value as List<dynamic>;
        _cities.addAll(data.map((e) => e.toString()));
      }
    } catch (e) {
      print("Error loading cities: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addCity(String city) async {
    final trimmedCity = city.trim();
    if (trimmedCity.isEmpty || _cities.contains(trimmedCity)) return;

    _cities.add(trimmedCity);
    await _db.set(_cities);
    notifyListeners();
  }

  Future<void> removeCity(String city) async {
    _cities.remove(city);
    await _db.set(_cities);
    notifyListeners();
  }
}