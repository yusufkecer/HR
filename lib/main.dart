import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hrapp/Product/Constant/colors.dart';
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
      navigatorKey: NavigationKey.instance.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'IK App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr', 'TR'),
      ],
      locale: const Locale("tr", "TR"),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: MyColor.fuchsiaBlueLight, size: 27),
        ),
        primaryColor: MyColor.discovreyPurplishBlue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(background: const Color(0xFF6711fe)),
      ),
      home: const Splash(),
    );
  }
}
