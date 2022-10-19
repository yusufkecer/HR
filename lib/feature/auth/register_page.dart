import 'package:chat/core/constant/edge_insets.dart';
import 'package:chat/product/constant/colors.dart';
import 'package:chat/product/mixin/password_visible.dart';
import 'package:chat/product/widgets/button/elevated_icon.dart';
import 'package:chat/product/widgets/button/text_button.dart';
import 'package:chat/product/widgets/checkbox.dart';
import 'package:chat/product/widgets/text_fields.dart';
import 'package:chat/product/widgets/title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/constant/size.dart';
import '../../product/constant/font_Size.dart';
import '../../product/constant/icons.dart';
import '../../product/constant/string_data.dart';
import '../../product/constant/weight.dart';
import '../../product/widgets/sized_box/box_space.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with PasswordVisibilityMixin {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const ProjectPadding.allEightteen(),
                child: Column(
                  children: [
                    apptitle(),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          forms(),
                          Divider(
                            color: MyColor.veryLightBlack,
                            height: ProjectSize.bigHeight().height,
                          ),
                          termsAndConditions(context),
                          BoxSpace(
                            height: ProjectSize.normalHeight().height,
                          ),
                          registerButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container termsAndConditions(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Text.rich(
          TextSpan(
            text: StringData.termsText,
            style: const TextStyle(
              fontSize: ProjectFontSize.mainSize,
              color: MyColor.black,
            ),
            children: [
              TextSpan(
                text: StringData.terms,
                style: const TextStyle(
                  fontSize: ProjectFontSize.mainSize,
                  color: MyColor.purplishBlue,
                  fontWeight: Weight.bold,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
              ),
              TextSpan(
                text: StringData.and,
                style: const TextStyle(
                  fontSize: ProjectFontSize.mainSize,
                  color: MyColor.black,
                ),
                children: [
                  TextSpan(
                    text: StringData.condition,
                    style: const TextStyle(
                      fontSize: ProjectFontSize.mainSize,
                      color: MyColor.purplishBlue,
                      fontWeight: Weight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // code to open / launch privacy policy link here
                      },
                  ),
                ],
              ),
              const TextSpan(text: StringData.termsTextEnd)
            ],
          ),
        ),
      ),
    );
  }

  Align apptitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: title(),
    );
  }

  Titles title() {
    return const Titles(
        title: StringData.registerHere, subtitle: StringData.registerNow);
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
              ProjectIcons.user,
              color: MyColor.black,
            ),
            fontWeight: Weight.midium,
            info: StringData.name,
          ),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          TextFields(
            onchange: (value) {},
            validator: (value) {},
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: const Icon(
              ProjectIcons.mail,
              color: MyColor.black,
            ),
            fontWeight: Weight.midium,
            info: StringData.email,
          ),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          TextFields(
            validator: (value) {
              return null;
            },
            onchange: (value) {
              return null;
            },
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: const Icon(
              ProjectIcons.password,
              color: MyColor.black,
            ),
            secure: !isVisible,
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
            info: StringData.password,
          ),
        ],
      ),
    );
  }

  MyElevatedIcons registerButton() {
    return MyElevatedIcons(
      buttonName: StringData.register,
      icons: const Icon(ProjectIcons.addPerson),
      onPressed: onpressed,
    );
  }

  onpressed() {
    Navigator.pop(context);
  }
}
