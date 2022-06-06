import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:test_otaqu/model/avail_model.dart';
import 'package:test_otaqu/services/shared_preferences.dart';

class ApiService {
  String baseUrl = 'http://115.85.80.34:4100/';

  Future auth() async {
    String url = '${baseUrl}utilization/api/auth/login';
    var body = {
      "username": "otaqu",
      "password": "qwerty",
    };
    var header = {
      'Content-Type': 'application/json',
    };
    try {
      var result = await http.post(Uri.parse(url), body: body, headers: header);

      if (result.statusCode == 200) {
        String data = jsonDecode(result.body)['data']['access_token'];
        SharedPrefService().setToken(data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<AvailModel>> getDataAvail(int destinationId, String token) async {
    String url = '${baseUrl}avail';
    var bodyjson = jsonEncode({
      "type_source": "location",
      "type_id": 3,
      "destination_id": destinationId,
      "min_price": 0,
      "max_price": 10000000000,
      "page": 1,
      "order_by": "lowest",
      "reference": "search"
    });
    var header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      var result =
          await http.post(Uri.parse(url), body: bodyjson, headers: header);
      if (result.statusCode == 200) {
        List data = jsonDecode(result.body)['data']['packages'];
        List<AvailModel> avail =
            data.map((e) => AvailModel.fromJson(e)).toList();

        return avail;
      }
      return <AvailModel>[];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> getDestination(String token) async {
    String url = '${baseUrl}destination';
    var header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final result = await http.get(Uri.parse(url), headers: header);
      if (result.statusCode == 200) {
        var data = jsonDecode(result.body)['data'];
        SharedPrefService().setDestination(data);
        print(data);
      }
    } catch (e) {
      print(e);
    }
  }
}