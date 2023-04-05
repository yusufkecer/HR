import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/user/user_main_page/user_main_view.dart';

abstract class UserMainViewModel extends State<UserMainView> {
  NavigationService nav = NavigationService();
}
