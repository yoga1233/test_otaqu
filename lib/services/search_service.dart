import 'dart:convert';

import 'package:test_otaqu/model/destination_model.dart';
import 'package:test_otaqu/services/shared_preferences.dart';

class SearchService {
  Future<int> getId(String name) async {
    String data = await SharedPrefService().getDestination();
    List aku = jsonDecode(data);
    List<DestinationModel> des =
        aku.map((e) => DestinationModel.fromJson(e)).toList();

    final item = des.firstWhere((e) => e.name == name);
    int id = item.destinationId;
    return id;
  }

  static Future<List<String>> sugges() async {
    try {
      String data = await SharedPrefService().getDestination();
      List<String> hasil = [];
      List aku = jsonDecode(data);
      for (var i = 0; i < aku.length; i++) {
        Map<String, dynamic> agus = aku[i];
        hasil.add(agus['name']);
      }
      return hasil;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<String>> getSuggestions(String query) async {
    try {
      List<String> matches = <String>[];
      List<String> data = await sugges();
      matches.addAll(data);
      matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
      return matches;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
