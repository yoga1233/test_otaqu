import 'dart:convert';

import 'package:test_otaqu/services/shared_preferences.dart';

class LastSearchService {
  void save(String data) async {
    String lastSearch = await SharedPrefService().getLastSearch();
    List result = jsonDecode(lastSearch);
    if (result.contains(data)) {
    } else {
      result.add(data);
    }
  }
}
