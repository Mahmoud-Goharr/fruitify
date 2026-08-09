import 'dart:convert';

import 'package:fruitify/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class prehs {
  static late SharedPreferences _instance;

  static const String _userDataKey = 'user_data';

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static void setbool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static bool getbool(String key) {
    return _instance.getBool(key) ?? false;
  }

  // =========================
  // User Data
  // =========================

  static Future<void> saveUserData(UserModel user) async {
    final userData = jsonEncode(user.toMap());

    await _instance.setString(_userDataKey, userData);
  }

  static UserModel? getUserData() {
    final userData = _instance.getString(_userDataKey);

    if (userData == null || userData.isEmpty) {
      return null;
    }

    try {
      final decodedData = jsonDecode(userData);

      return UserModel.fromJson(Map<String, dynamic>.from(decodedData));
    } catch (e) {
      return null;
    }
  }

  static Future<void> clearUserData() async {
    await _instance.remove(_userDataKey);
  }

  // =========================
  // String
  // =========================

  static Future<void> setString(String key, String value) async {
    await _instance.setString(key, value);
  }

  static String getString(String key) {
    return _instance.getString(key) ?? '';
  }
}
