import 'package:chat/core/constant/edge_insets.dart';
import 'package:chat/core/constant/size.dart';
import 'package:chat/core/extensions/context_extension.dart';
import 'package:chat/feature/splash_screen/loading_screen.dart';
import 'package:chat/product/constant/colors.dart';
import 'package:chat/product/constant/icons.dart';
import 'package:chat/product/constant/string_data.dart';
import 'package:chat/product/constant/weight.dart';
import 'package:chat/product/widgets/button/elevated_icon.dart';
import 'package:chat/product/widgets/sized_box/box_space.dart';
import 'package:chat/product/widgets/text_fields.dart';
import 'package:chat/product/widgets/title.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const ProjectPadding.allEightteen(),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Titles(
                  title: StringData.resetPassword,
                  subtitle: StringData.changePassword,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      child: Column(
                        children: [
                          TextFields(
                            fontWeight: Weight.midium,
                            icon: const Icon(
                              MyIcons.mail,
                              color: MyColor.black,
                            ),
                            info: StringData.email,
                            titlePadding: const ProjectPadding.textFieldTitle(),
                            validator: (value) {
                              return null;
                            },
                            onchange: (value) {
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: ProjectSize.veryBigHeight().height,
                    ),
                    MyElevatedIcons(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
