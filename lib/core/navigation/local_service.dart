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
  }

  void setToken(String? val) async {
    if (val == null) {
      return;
    }
    await prefs?.setString('token', val);
  }

  void remove(String? params) async {
    if (params == null) {
      return;
    }
    await prefs?.remove(params);
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
