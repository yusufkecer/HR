import 'package:hrapp/core/navigation/local_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../service/data_service.dart';

class Auth {
  static final Auth _singleton = Auth._internal();

  String? userToken;
  String? get rawToken {
    return userToken;
  }

  static Auth get instance {
    return _singleton;
  }

  Auth._internal();

  DataService ds = DataService();
  Map<String, dynamic>? token;
  String? status;

  Future login([String? email, String? password, String? endpoint]) async {
    LocalStorage storage = LocalStorage.instance;
    storage.initLocalStorage();
    if (storage.getToken == null) {
      print("new token-> ${storage.getToken}");
      var response = await ds.authLogin(email!, password!, endpoint!);
      if (response != null) {
        if (response.runtimeType == List) {
          List data = response[0]["value"];
          return data;
        } else if (!(response["isSuccess"])) {
          return response["message"];
        } else if (response["isSuccess"]) {
          print("yess");
          userToken = response["data"]["token"];
          storage.setString(userToken);
          token = JwtDecoder.decode(userToken!);
          print(token);
          return response["isSuccess"];
        }
      }
    } else {
      print("local api");
      String? userToken = storage.getToken;
      token = JwtDecoder.decode(userToken!);
      print(token);
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

  String? get getRole {
    return token?["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"];
  }

  String? get getEmail {
    return token?["email"];
  }

  Map<String, dynamic>? get getToken {
    return token;
  }
}
