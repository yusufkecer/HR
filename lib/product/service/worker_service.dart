import 'dart:convert';

import 'package:hrapp/product/models/worker_model/worker_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<Iterable> getWorkers() async {
    const url = "https://63c70d76d307b76967462d8b.mockapi.io/workers";
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
