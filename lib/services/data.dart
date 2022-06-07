import 'dart:convert';

import 'package:test_otaqu/services/shared_preferences.dart';

class Sugestion {
  static Future<List<String>> sugges() async {
    String data = await SharedPrefService().getDestination();
    List<String> hasil = [];
    List aku = jsonDecode(data);
    for (var i = 0; i < aku.length; i++) {
      Map<String, dynamic> agus = aku[i];
      hasil.add(agus['name']);
    }
    return hasil;
  }

  static Future<List<String>> getSuggestions(String query) async {
    List<String> matches = <String>[];
    List<String> data = await sugges();
    matches.addAll(data);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
