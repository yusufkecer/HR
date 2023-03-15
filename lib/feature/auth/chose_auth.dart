import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/feature/auth/login/login_view.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/button/elevated_icon.dart';
import '../../product/widgets/title.dart';

class ChoseAuth extends StatefulWidget {
  const ChoseAuth({super.key});

  @override
  State<ChoseAuth> createState() => _ChoseAuthState();
}

class _ChoseAuthState extends State<ChoseAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            title(),
            buttons(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 210,
                width: context.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagePath.auth),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align title() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: const ProjectPadding.allEightTeen().copyWith(top: 50),
          child: const Titles(
            title: StringData.welcome,
            subtitle: StringData.authChoise,
          )),
    );
  }

  Expanded buttons() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          button(() {
            navigate(true);
          }, StringData.institutional, MyIcons.company),
          const SizedBox(
            height: 10,
          ),
          button(() {
            navigate(false);
          }, StringData.individual, MyIcons.user),
        ],
      ),
    );
  }

  Widget button(Function() onTap, String type, IconData icon) {
    return Align(
      alignment: Alignment.center,
      child: MyElevatedIcons(
        onPressed: onTap,
        buttonName: type,
        icons: Icon(icon),
      ),
    );
  }

  void navigate(isCompany) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginView(isCompany: isCompany),
      ),
    );
  }
}
