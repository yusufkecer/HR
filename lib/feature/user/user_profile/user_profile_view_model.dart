import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_profile/user_profile_view.dart';

import '../../../product/data/auth.dart';

abstract class UserProfileViewModel extends State<UserProfileView> {
  late String userName;
  @override
  void initState() {
    List<String> user = Auth.instance.getName!.split(" ");
    userName = "${user[0][0].toUpperCase()}${user[0].substring(1)} ${user[1][0].toUpperCase()}${user[1].substring(1)}";
    super.initState();
  }
}
