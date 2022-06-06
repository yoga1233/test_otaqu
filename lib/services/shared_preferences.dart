import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  void setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token').toString();
    return token.toString();
  }

  Future<bool> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    bool delete = await prefs.remove('token');
    return delete;
  }

  void setDestination(var destination) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('destination', jsonEncode(destination));
  }

  Future<String> getDestination() async {
    final pref = await SharedPreferences.getInstance();
    String? destination = pref.getString('destination');
    return destination.toString();
  }

  Future<bool> saveIntro() async {
    final pref = await SharedPreferences.getInstance();
    bool intro = await pref.setBool('intro', true);
    return intro;
  }

  Future<bool> getIntro() async {
    final pref = await SharedPreferences.getInstance();
    bool? intro = pref.getBool('intro');
    return intro!;
  }
}
