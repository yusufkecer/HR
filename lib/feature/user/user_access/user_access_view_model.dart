import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/local_service.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/user/user_access/user_access_view.dart';

import '../../../product/constant/string_data.dart';
import '../../../product/data/auth.dart';
import '../../auth/chose_auth.dart';

abstract class UserAccessViewModel extends State<UserAccess> {
  NavigationService nav = NavigationService();
  void logOut() async {
    bool? check = await nav.checkDialog(StringData.logout, StringData.checkOut);
    if (check == true) {
      LocalStorage storage = LocalStorage.instance;
      Auth auth = Auth.instance;

      storage.remove("token");
      auth.token = {};
      auth.userToken = "";
      Future(
        () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const ChoseAuth(),
          ),
          (route) => false,
        ),
      );
    }
  }
}
