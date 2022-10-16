import 'package:chat/core/constant/edge_insets.dart';
import 'package:chat/product/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import '../core/constant/size.dart';
import '../product/constant/icons.dart';
import '../product/constant/string_data.dart';
import '../product/constant/weight.dart';
import '../product/widgets/sized_box/box_space.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Map<String, dynamic> users = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const ProjectPadding.allEightteen(),
              child: forms(),
            ),
          ],
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
            users: users,
          ),
          BoxSpace(
            height: ProjectSize.normalHeight().height,
          ),
          TextFields(
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: IconsData.user,
            suffixIcon: IconsData.visibilityOn,
            fontWeight: Weight.midium,
            info: StringData.name,
            users: users,
          ),
          BoxSpace(
            height: ProjectSize.normalHeight().height,
          ),
          TextFields(
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: IconsData.password,
            suffixIcon: IconsData.visibilityOn,
            fontWeight: Weight.midium,
            info: StringData.password,
            users: users,
          ),
        ],
      ),
    );
  }
}
