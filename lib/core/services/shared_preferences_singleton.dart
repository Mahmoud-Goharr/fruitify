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

  static Future<void> saveUserData(UserModel user) async {
    await _instance.setString(_userDataKey, jsonEncode(user.toMap()));
  }

  static UserModel? getUserData() {
    final userData = _instance.getString(_userDataKey);
    if (userData == null) {
      return null;
    }

    return UserModel.fromMap(
      Map<String, dynamic>.from(jsonDecode(userData) as Map),
    );
  }

  static Future<void> clearUserData() async {
    await _instance.remove(_userDataKey);
  }
}
