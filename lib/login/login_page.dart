import 'package:chat/core/constant/size.dart';
import 'package:chat/login/register_page.dart';
import 'package:chat/product/mixin/password_visible.dart';
import 'package:chat/product/widgets/button/text_button.dart';
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
import '../product/widgets/button/text_button_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with PasswordVisibilityMixin {
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
                      checkText(),
                      resetPassword(),
                    ],
                  ),
                  Divider(
                    height: ProjectSize.veryBigHeight().height,
                    color: MyColor.veryLightBlack,
                  ),
                  loginButton(),
                  registerNavigate()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CheckboxText checkText() {
    return CheckboxText(
      Weight.midium,
      StringData.rememberMe,
    );
  }

  TextButtonIcon resetPassword() {
    return TextButtonIcon(
      weight: Weight.midium,
      buttonName: StringData.resetPassword,
      onPressed: onPressed,
    );
  }

  Padding registerNavigate() {
    return Padding(
      padding: const ProjectPadding.topTwenty(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            StringData.doYouHaveAnAccount,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          MyTextButton(
            named: StringData.registerHere,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  MyElevatedIcons loginButton() {
    return MyElevatedIcons(
      onPressed: onPressed,
      buttonName: StringData.singin,
      icons: const Icon(
        ProjectIcons.loginIcon,
      ),
    );
  }

  Titles titles() {
    return const Titles(
      title: StringData.singin,
      subtitle: StringData.welcome,
    );
  }

  Form forms() {
    return Form(
      child: Column(
        children: [
          TextFields(
            onchange: (value) {},
            validator: (value) {},
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: const Icon(
              ProjectIcons.mail,
              color: Colors.black,
            ),
            fontWeight: Weight.midium,
            info: StringData.email,
          ),
          TextFields(
            onchange: (value) {
              print("object");
            },
            validator: (value) {},
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: const Icon(
              ProjectIcons.password,
              color: Colors.black,
            ),
            suffixButton: IconButton(
              onPressed: () {
                changeVisibility();
              },
              icon: isVisible
                  ? const Icon(ProjectIcons.visibilityOn)
                  : const Icon(ProjectIcons.visibilityOff),
              color: Colors.black,
            ),
            fontWeight: Weight.midium,
            secure: !isVisible,
            info: StringData.password,
          ),
        ],
      ),
    );
  }

  onPressed() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const Register(),
    ));
  }
}
