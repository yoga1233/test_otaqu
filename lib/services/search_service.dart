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
    int id = item.destinationId!;
    return id;
  }
}
