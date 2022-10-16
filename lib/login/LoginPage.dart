import 'package:chat/login/RegisterPage.dart';
import 'package:chat/core/constant/size.dart';
import 'package:chat/product/widgets/sized_box/box_space.dart';
import 'package:chat/product/widgets/checkbox.dart';
import 'package:chat/product/widgets/text_fields.dart';
import 'package:chat/product/widgets/title.dart';
import 'package:flutter/material.dart';
import '../core/constant/edge_insets.dart';
import '../product/constant/colors.dart';
import '../product/constant/icons.dart';
import '../product/constant/string_data.dart';
import '../product/constant/weight.dart';
import '../product/widgets/button/elevated_icon.dart';
import '../product/widgets/button/text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic> users = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            titles(),
            BoxSpace(
              height: ProjectSize.bigHeight().height,
            ),
            Padding(
              padding: const ProjectPadding.allEightteen(),
              child: Column(
                children: [
                  forms(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CheckboxText(
                        Weight.midium,
                        StringData.rememberMe,
                      ),
                      //TODO: Widget olarak ayarla
                      const TextButtonIcon(
                        Weight.midium,
                        StringData.resetPassword,
                      ),
                    ],
                  ),
                  Divider(
                    height: ProjectSize.veryBigHeight().height,
                    color: MyColor.veryLightBlack,
                  ),
                  ElevatedIcons(
                    onPressed,
                    StringData.singin,
                    IconsData.loginIcon,
                  ),
                  Padding(
                    padding: const ProjectPadding.topTwenty(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //TODO font size ayarlanacak
                        const Text(
                          StringData.doYouHaveAnAccount,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: (() {}),
                          child: const Text(
                            StringData.registerHere,
                            style: TextStyle(
                              fontSize: 17,
                              color: MyColor.purplishBlue,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align titles() {
    return const Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(18, 30, 0, 8),
        child: Titles(
          title: StringData.singin,
          subtitle: StringData.welcome,
        ),
      ),
    );
  }

  Form forms() {
    return Form(
        child: Column(
      children: [
        TextFields(
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: IconsData.mail,
            suffixIcon: IconsData.visibilityOn,
            fontWeight: Weight.midium,
            info: StringData.email,
            users: users),
        const BoxSpace(
          height: 10,
        ),
        TextFields(
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: IconsData.password,
            suffixIcon: IconsData.visibilityOn,
            fontWeight: Weight.midium,
            info: StringData.password,
            users: users),
      ],
    ));
  }

  onPressed() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const Register(),
    ));
  }
}
