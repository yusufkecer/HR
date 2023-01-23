import 'package:flutter/material.dart';
import 'feature/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IK App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        primarySwatch: Colors.purple,
        backgroundColor: const Color(0xFF6711fe),
      ),
      home: const Splash(),
    );
  }
}
