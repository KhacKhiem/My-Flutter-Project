import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_application_1/view/global.dart';

class HttpService {
  final postsURL =
      Uri.parse("https://sampleapiproject.azurewebsites.net/stations/list");

  Future<List<Stations>> getStations(String token) async {
    final res = await http.get(postsURL, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (res.statusCode == 200) {
      Global.tokenn = token;
      List<dynamic> body = jsonDecode(res.body);
      List<Stations> stations = body
          .map(
            (dynamic item) => Stations.fromJson(item),
          )
          .toList();

      return stations;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<ChlorineInjections>> gethistory(int processingsystemsid) async {
    String token = Global.tokenn;
    final response = await http.get(
        Uri.parse(
            "https://sampleapiproject.azurewebsites.net/processingsystems/$processingsystemsid/chlorineinjections/history"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<ChlorineInjections> history = body
          .map((dynamic item) => ChlorineInjections.fromJson(item))
          .toList();
      return history;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
