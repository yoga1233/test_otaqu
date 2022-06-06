import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  void setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return token.toString();
  }

  void deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  void setDestination(var destination) async {
    final prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('destination', jsonEncode(destination));
    print('save destination to shared pref $result');
  }
}
