import 'package:flutter/material.dart';
import 'package:hrapp/Product/Constant/colors.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/core/navigation/navigator_key.dart';

import 'feature/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigatonKey.instance.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'IK App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: MyColor.fuchsiaBlueLight, size: 27),
        ),
        primarySwatch: Colors.purple,
        backgroundColor: const Color(0xFF6711fe),
      ),
      home: const Splash(),
    );
  }
}
