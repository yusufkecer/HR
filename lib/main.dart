import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:hrapp/Product/Constant/colors.dart';
import 'package:hrapp/core/navigation/navigator_key.dart';
import 'package:hrapp/feature/auth/chose_auth.dart';
import 'package:hrapp/feature/company/company_main_page/company_main_view.dart';
import 'package:hrapp/feature/user/user_main_page/user_main_view.dart';
import 'package:hrapp/product/data/auth.dart';

import 'core/navigation/local_service.dart';
import 'feature/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String path = "splash";

  LocalStorage storage = LocalStorage.instance;
  await storage.initLocalStorage();

  if (storage.getToken != null) {
    Auth instance = Auth.instance;
    await Auth.instance.login();
    if (instance.getRole == "jobseeker") {
      path = "user";
    } else {
      path = "company";
    }
  }

  runApp(MyApp(
    path: path,
  ));
}

class MyApp extends StatelessWidget {
  final String path;
  const MyApp({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: path,
      routes: {
        "splash": (context) => const Splash(),
        "company": (context) => const CompanyMainView(),
        "user": (context) => const UserMainView(),
        "auth": (context) => const ChoseAuth(),
      },
      navigatorKey: NavigationKey.instance.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'HRMS',
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
