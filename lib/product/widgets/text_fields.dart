// ignore_for_file: must_be_immutable

import 'package:hrapp/core/constant/edge_insets.dart';
import 'package:hrapp/product/widgets/decoration/custom_decoration.dart';
import 'package:flutter/material.dart';

import '../constant/font_size.dart';

class TextFields extends StatelessWidget {
  final TextEditingController? controller;
  final String? info;
  Widget? suffixButton;
  final FontWeight? fontWeight;
  final Widget? icon;
  final EdgeInsets? titlePadding;
  final String? Function(String?)? validation;
  final void Function(String?)? listener;

  bool? secure;
  TextFields({
    this.controller,
    required this.validation,
    required this.listener,
    this.titlePadding,
    this.suffixButton,
    this.fontWeight,
    this.info,
    this.icon,
    this.secure = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    suffixButton ??= const SizedBox();

    // final TextEditingController controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: titlePadding!,
          child: Text(
            info!,
            textScaleFactor: ProjectFontSize.fieldTitle,
            style: TextStyle(fontWeight: fontWeight),
          ),
        ),
        Container(
          decoration: CustomDecoration(),
          child: Padding(
            padding: const ProjectPadding.allEight(),
            child: textField(),
          ),
        ),
      ],
    );
  }

  TextFormField textField() {
    return TextFormField(
      controller: controller,
      validator: validation,
      obscureText: secure!,
      autocorrect: secure!,
      onChanged: listener,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding: const ProjectPadding.textFieldContent(14.8),
        border: InputBorder.none,
        hintText: info,
        prefixIcon: prefixButton(),
        suffixIcon: suffixButton,
      ),
    );
  }

  Padding prefixButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: CustomPrefixDecoration(),
        child: icon,
      ),
    );
  }
}
