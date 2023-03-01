import 'package:jwt_decoder/jwt_decoder.dart';

import '../service/data_service.dart';

class Auth {
  static final Auth _singleton = Auth._internal();
  static Auth get instance {
    return _singleton;
  }

  Auth._internal();

  DataService ds = DataService();
  Map<String, dynamic>? token;
  String? status;
  Future login(String email, String password) async {
    var response = await ds.authLogin(email, password);
    if (response != null) {
      if (response["isSuccess"]) {
        String getToken = response["data"]["token"];
        token = JwtDecoder.decode(getToken);
      }
      return response["isSuccess"];
    }
  }

  Map<String, dynamic>? getToken() {
    return token;
  }
}
