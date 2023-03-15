import 'package:hrapp/product/service/api.dart';
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

  Future login(String email, String password, String endpoint) async {
    var response = await ds.authLogin(email, password, ApiUri.loginCompnay);
    if (response != null) {
      if (response["isSuccess"]) {
        String getToken = response["data"]["token"];
        token = JwtDecoder.decode(getToken);
      }
      return response["isSuccess"];
    }
  }

  set resetToken(Map<String, dynamic> value) {
    token = value;
  }

  String? get getName {
    return token?["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"];
  }

  String? get getId {
    return token?["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"];
  }

  String? get getEmail {
    return token?["email"];
  }

  Map<String, dynamic>? get getToken {
    return token;
  }
}
