import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/local_service.dart';
import 'package:hrapp/feature/intro/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../auth/chose_auth.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).whenComplete(
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LocalStorage.instance.getBool("isFirstTime") == false ||
                  LocalStorage.instance.getBool("isFirstTime") == null
              ? const Introduction()
              : const ChoseAuth(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/splash.json"),
      ),
    );
  }
}
