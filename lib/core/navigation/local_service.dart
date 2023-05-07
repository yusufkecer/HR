import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? prefs;

  static final LocalStorage _instance = LocalStorage._internal();
  LocalStorage._internal();
  factory LocalStorage() {
    return _instance;
  }
  static LocalStorage get instance => _instance;
  Future<void> initLocalStorage() async {
    prefs = await SharedPreferences.getInstance();
    print("started");
  }

  void setString(String? val) async {
    if (val == null) {
      return;
    }
    await prefs?.setString('token', val);
  }

  void setbool(String? val) async {
    if (val == null) {
      return;
    }
    await prefs?.setString('token', val);
  }

  String? get getToken {
    return prefs?.getString("token");
  }
}
