import 'dart:convert';
//import 'package:flutter/foundation.dart';
import 'package:hrapp/product/service/api.dart';
import 'package:http/http.dart' as http;

class DataService {
  dynamic fetchData() async {
    const url = ApiUri.workerApi;
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      // throw "Data yok knk...";
      //404 505 403
    }
  }
}
// class DataService {
//   Future<Iterable> fetchData() async {
//     const url = "https://63c70d76d307b76967462d8b.mockapi.io/workers";
//     final data = await compute(getWorkers, url);
//     return data;
//   }

//   Future getWorkers(url) async {
//     final http.Response response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       return jsonDecode(response.body);
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//   }
// }
