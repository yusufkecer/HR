import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/size.dart';
import 'package:hrapp/feature/splash/splash_screen.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/widgets/button/elevated_icon.dart';
import 'package:hrapp/product/widgets/sized_box/box_space.dart';
import 'package:hrapp/product/widgets/text_field/auth_field.dart';
import 'package:hrapp/product/widgets/title.dart';
import 'package:flutter/material.dart';
import '../../../Product/Constant/colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const ProjectPadding.allEightTeen(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title(),
              BoxSpace(
                height: ProjectSize.veryBigHeight().height,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    child: textFields(),
                  ),
                  Divider(
                    height: ProjectSize.veryBigHeight().height,
                    color: MyColor.veryLightBlack,
                  ),
                  resetPasswordButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AuthField textFields() {
    return AuthField(
      fontWeight: Weight.midium,
      icon: const Icon(
        MyIcons.mail,
        color: MyColor.black,
      ),
      info: StringData.email,
      titlePadding: const ProjectPadding.textFieldTitle(),
      validation: (value) {
        return null;
      },
      listener: (value) {},
    );
  }

  MyElevatedIcons resetPasswordButton(BuildContext context) {
    return MyElevatedIcons(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Splash(),
          ),
        );
      },
      buttonName: StringData.changePassword,
      icons: const Icon(
        MyIcons.resetPassword,
      ),
    );
  }

  Align title() {
    return const Align(
      alignment: Alignment.topLeft,
      child: Titles(
        title: StringData.resetPassword,
        subtitle: StringData.changePassword,
      ),
    );
  }
}
