import 'package:flutter/material.dart';

class NavigatonKey {
  static final NavigatonKey _instance = NavigatonKey._internal();
  static NavigatonKey get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory NavigatonKey() {
    return _instance;
  }

  NavigatonKey._internal();
}
