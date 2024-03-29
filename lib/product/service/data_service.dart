import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/auth.dart';

class DataService {
  dynamic fetchData(String api) async {
    final String url = api;
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {}
  }

  dynamic fetchDataWithToken(
    String api, [
    String? id,
    String? status,
  ]) async {
    late String url = "$api/$id/$status";
    final http.Response response = await http.get(
      headers: {"Authorization": "Bearer ${Auth.instance.rawToken}"},
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("error");
    }
  }

  Future authLogin(String email, String password, String endpoint) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      var getToken = await jsonDecode(response.body);
      return getToken;
    } catch (e) {
      throw "Hata var ama nerede söylemem";
    }
  }

  Future post(String endPoint, String json) async {
    try {
      final response = await http.post(
        Uri.parse(endPoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json,
      );

      var res = await jsonDecode(response.body);

      return res;
    } catch (e) {
      //  print(e);
    }
  }

  Future upteAdvert(String endPoint, String json) async {
    try {
      final response = await http.put(
        Uri.parse(endPoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json,
      );

      var res = await jsonDecode(response.body);

      return res;
    } catch (e) {
      //  print(e);
    }
  }

  Future delete(String endPoint, String id) async {
    try {
      final response = await http.delete(
        Uri.parse(endPoint + id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      var res = await jsonDecode(response.body);

      return res;
    } catch (e) {
      //  print(e);
    }
  }
}
