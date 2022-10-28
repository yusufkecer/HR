import 'package:hrapp/core/constant/size.dart';
import 'package:hrapp/feature/auth/reset_password/reset_password.dart';
import 'package:hrapp/product/widgets/button/text_button.dart';
import 'package:hrapp/product/widgets/checkbox_text.dart';
import 'package:hrapp/product/widgets/text_fields.dart';
import 'package:hrapp/product/widgets/title.dart';
import 'package:flutter/material.dart';
import '../../../../Product/widgets/sized_box/box_space.dart';
import '../../../../core/constant/edge_insets.dart';
import '../../../../product/constant/colors.dart';
import '../../../../product/constant/font_size.dart';
import '../../../../product/constant/icons.dart';
import '../../../../product/constant/string_data.dart';
import '../../../../product/constant/weight.dart';
import '../../../../product/widgets/button/elevated_icon.dart';
import '../../../../product/widgets/button/text_button_icon.dart';
import '../login_view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  // bool isVisible = false;
  List value2 = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const ProjectPadding.allEightteen(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  titles(),
                  BoxSpace(
                    height: ProjectSize.veryBigHeight().height,
                  ),
                  Column(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CheckboxText checkText() {
    return CheckboxText(
      onChanged: (value) {
        setState(() {
          value = !value;
        });
      },
      Weight.midium,
      StringData.rememberMe,
    );
  }

  TextButtonIcon resetPassword() {
    return TextButtonIcon(
      weight: Weight.midium,
      buttonName: StringData.resetPassword,
      onPressed: navigateResetPassword,
    );
  }

  void navigateResetPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ResetPassword(),
      ),
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
              fontSize: ProjectFontSize.mainSize,
            ),
          ),
          MyTextButton(
            named: StringData.registerHere,
            onPressed: navigateApp,
          ),
        ],
      ),
    );
  }

  MyElevatedIcons loginButton() {
    return MyElevatedIcons(
      onPressed: navigateApp,
      buttonName: StringData.singin,
      icons: const Icon(
        MyIcons.loginIcon,
      ),
    );
  }

  Align titles() {
    return const Align(
      alignment: Alignment.topLeft,
      child: Titles(
        title: StringData.singin,
        subtitle: StringData.welcome,
      ),
    );
  }

  Form forms() {
    return Form(
      child: Column(
        children: [
          TextFields(
            listener: (value) {
              print(value);
            },
            validator: (value) {
              return null;
            },
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: const Icon(
              MyIcons.mail,
              color: Colors.black,
            ),
            fontWeight: Weight.midium,
            info: StringData.email,
          ),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          TextFields(
            listener: (value) {
              print("object");
              return;
            },
            validator: (value) {
              return null;
            },
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: const Icon(
              MyIcons.password,
              color: Colors.black,
            ),
            suffixButton: IconButton(
              onPressed: () {
                changeVisibility();
              },
              icon: isVisible
                  ? const Icon(MyIcons.visibilityOn)
                  : const Icon(MyIcons.visibilityOff),
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

  void navigateApp() {
    print(value2.length);
  }
}
