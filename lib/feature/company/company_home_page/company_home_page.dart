import 'package:flutter/material.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/navBarView.dart';

class CompanyHomePage extends StatefulWidget {
  const CompanyHomePage({super.key});

  @override
  State<CompanyHomePage> createState() => _CompanyHomePageState();
}

class _CompanyHomePageState extends State<CompanyHomePage> {
  Map bottomBar = {
    StringData.homePage: MyIcons.home,
    StringData.postings: MyIcons.list,
    StringData.profile: Icons.person,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: Text("Beklemede kalll 🤩"),
        ),
      ),
      bottomNavigationBar: NavBar(
        navBarItem: bottomBar,
      ),
    );
  }
}
