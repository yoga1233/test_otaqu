import 'dart:convert';

import 'package:test_otaqu/services/shared_preferences.dart';

class SearchService {
  Future<int> getId(String name) async {
    String data = await SharedPrefService().getDestination();
    List aku = jsonDecode(data);
    print(aku);

    // final item = aku.firstWhere((e) => e['name'] == name);
    // int destId = item['destination_id'];
    return 0;
  }
}
