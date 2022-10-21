import 'package:chat/core/constant/size.dart';
import 'package:chat/core/extensions/context_extension.dart';
import 'package:chat/feature/auth/register_page.dart';
import 'package:chat/feature/auth/reset_password.dart';
import 'package:chat/feature/splash_screen/loading_screen.dart';
import 'package:chat/product/widgets/button/text_button.dart';
import 'package:chat/product/widgets/checkbox.dart';
import 'package:chat/product/widgets/text_fields.dart';
import 'package:chat/product/widgets/title.dart';
import 'package:flutter/material.dart';
import '../../Product/widgets/sized_box/box_space.dart';
import '../../core/constant/edge_insets.dart';
import '../../product/constant/colors.dart';
import '../../product/constant/font_Size.dart';
import '../../product/constant/icons.dart';
import '../../product/constant/string_data.dart';
import '../../product/constant/weight.dart';
import '../../product/widgets/button/elevated_icon.dart';
import '../../product/widgets/button/text_button_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool splash = true;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      setState(() {
        splash = false;
      });
    });
    super.initState();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return splash
        ? const Splash()
        : Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: context.height,
                child: SafeArea(
                  child: Padding(
                    padding: const ProjectPadding.allEightteen(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: titles(),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              forms(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                ),
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
      onPressed: navigateResetPassword,
    );
  }

  navigateResetPassword() {
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
            onchange: (value) {
              return null;
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
            onchange: (value) {
              // print("object");
              return null;
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
                //   changeVisibility();
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

  navigateApp() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const Register(),
    ));
  }
}
