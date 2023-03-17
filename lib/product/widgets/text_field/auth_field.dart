import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/product/widgets/decoration/custom_decoration.dart';

import '../../constant/font_size.dart';

//! FIXME const costructor
class AuthField extends StatelessWidget {
  final TextEditingController? controller;
  final String? info;
  final TextInputType textType;
  Widget? suffixButton;
  final Function()? onTap;
  final FontWeight? fontWeight;
  final Widget? icon;
  final EdgeInsets? titlePadding;
  final String? Function(String?)? validation;
  final void Function(String?)? listener;
  final bool? secure;

  AuthField({
    Key? key,
    this.controller,
    this.info,
    this.textType = TextInputType.text,
    this.suffixButton,
    this.onTap,
    this.fontWeight,
    this.icon,
    this.titlePadding,
    this.validation,
    required this.listener,
    this.secure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    suffixButton ??= const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: titlePadding!,
          child: Text(
            info!,
            textScaleFactor: ProjectFontSize.oneToOne,
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
      onTap: onTap,
      keyboardType: textType,
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
      padding: const ProjectPadding.allFive(),
      child: Container(
        decoration: CustomPrefixDecoration(),
        child: icon,
      ),
    );
  }
}
