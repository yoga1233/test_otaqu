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
    final bool? des = pref.getBool('intro');
    return des ?? false;
  }

  void setLastSearch(List search) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('search', jsonEncode(search));
  }

  Future<String> getLastSearch() async {
    final prefs = await SharedPreferences.getInstance();
    String? lastSearch = prefs.getString('search');
    return lastSearch.toString();
  }
}
