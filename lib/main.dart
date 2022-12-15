import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/data/company_repo/company_repo.dart';
import 'feature/company/company_home_page/company_home_page.dart';
import 'feature/intro/introduction_screen.dart';
import 'feature/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        primarySwatch: Colors.blue,
        backgroundColor: const Color(0xFF6711fe),
      ),
      home: const Splash(),
      // Splash(),
    );
  }
}
