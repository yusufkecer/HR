import 'package:jwt_decoder/jwt_decoder.dart';
import '../service/data_service.dart';

class Auth {
  static final Auth _singleton = Auth._internal();

  String? companyToken;
  String? get rawToken {
    return companyToken;
  }

  static Auth get instance {
    return _singleton;
  }

  Auth._internal();

  DataService ds = DataService();
  Map<String, dynamic>? token;
  String? status;

  Future login(String email, String password, String endpoint) async {
    var response = await ds.authLogin(email, password, endpoint);
    print(response);
    if (response != null) {
      if (response.runtimeType == List) {
        List data = response[0]["value"];
        print(data);
        return data;
      } else if (!(response["isSuccess"])) {
        return response["message"];
      } else if (response["isSuccess"]) {
        companyToken = response["data"]["token"];
        token = JwtDecoder.decode(companyToken!);
        return response["isSuccess"];
      }
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
