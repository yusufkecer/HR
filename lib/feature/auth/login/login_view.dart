import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/size.dart';
import 'package:hrapp/product/widgets/checkbox_text.dart';
import 'package:hrapp/product/widgets/text_field/auth_field.dart';
import 'package:hrapp/product/widgets/title.dart';
import '../../../Product/Constant/colors.dart';
import '../../../Product/widgets/sized_box/box_space.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/constant/weight.dart';
import '../../../product/widgets/button/elevated_icon.dart';
import '../../../product/widgets/button/text_button_icon.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  final String? endpoint;
  const LoginView({
    Key? key,
    this.endpoint,
  }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const ProjectPadding.allEightTeen(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                        onTap: () {
                          nav.navigteToCompany(context);
                        },
                        child: titles()),
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
      ),
    );
  }

  CheckboxText checkText() {
    return CheckboxText(
      onChange: (value) {
        changeCheck();
      },
      value: check,
      Weight.midium,
      StringData.rememberMe,
    );
  }

  TextButtonIcon resetPassword() {
    return TextButtonIcon(
      weight: Weight.midium,
      buttonName: StringData.resetPassword,
      onPressed: navigateResetPassword,
      myIcons: MyIcons.lock,
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
          TextButton(
            style: TextButton.styleFrom(
              padding: const ProjectPadding.edgeZero(),
            ),
            onPressed: () => nav.navigateToRegister(context),
            child: const Text(
              StringData.registerHere,
              style: TextStyle(
                fontSize: ProjectFontSize.mainSize,
                color: MyColor.purplishBlue,
              ),
            ),
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
      key: formKey,
      child: Column(
        children: [
          emailForm(),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          passwordForm(),
        ],
      ),
    );
  }

  AuthField passwordForm() {
    return AuthField(
      controller: passwordController,
      listener: (value) {
        return;
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
        icon: isVisible ? const Icon(MyIcons.visibilityOn) : const Icon(MyIcons.visibilityOff),
        color: Colors.black,
      ),
      fontWeight: Weight.midium,
      secure: !isVisible,
      info: StringData.password,
    );
  }

  AuthField emailForm() {
    return AuthField(
      textType: TextInputType.emailAddress,
      controller: emailController,
      listener: (value) {},
      titlePadding: const ProjectPadding.textFieldTitle(),
      icon: const Icon(
        MyIcons.mail,
        color: Colors.black,
      ),
      fontWeight: Weight.midium,
      info: StringData.email,
    );
  }
}
