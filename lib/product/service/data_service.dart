import 'dart:convert';
import 'package:http/http.dart' as http;

class DataService {
  dynamic fetchData(String api) async {
    final String url = api;
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {}
  }

  Future authLogin(String email, String password, String endPoint) async {
    try {
      final response = await http.post(
        Uri.parse(endPoint),
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
      // throw "Hata var ama nerede söylemem";
    }
  }
}
//  class DataService {
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