import 'package:flutter/material.dart';

class NavigationKey {
  static final NavigationKey _instance = NavigationKey._internal();
  static NavigationKey get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory NavigationKey() {
    return _instance;
  }

  NavigationKey._internal();
}
