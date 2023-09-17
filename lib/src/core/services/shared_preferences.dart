import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  // Private constructor
  SharedPreferencesService._internal();

  // Singleton instance getter
  static Future<SharedPreferencesService> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  // Method to save a value to SharedPreferences
  Future<bool> saveValue(String key, dynamic value) async {
    debugPrint("saveValue: $value");
    if (value is int) {
      return await _preferences!.setInt(key, value);
    } else if (value is double) {
      return await _preferences!.setDouble(key, value);
    } else if (value is bool) {
      return await _preferences!.setBool(key, value);
    } else if (value is String) {
      return await _preferences!.setString(key, value);
    }else if (value is List<String>) {
      return await _preferences!.setStringList(key, value);
    } else {
      throw Exception("Unsupported value type");
    }
  }

  // Method to get a value from SharedPreferences
  dynamic getValue(String key) {
    return _preferences!.get(key);
  }

  // Method to clear all values in SharedPreferences
  Future<void> clear() async {
    await _preferences!.clear();
  }

  Future<void> remove(String key) async {
    await _preferences!.remove(key);
  }
}
