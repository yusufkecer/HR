import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final TextEditingController? textEditingController;
  final IconData? icon;
  final String? hint;
  const CustomTextField({
    Key? key,
    this.title,
    this.textEditingController,
    this.icon,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(colorScheme: ThemeData().colorScheme.copyWith(primary: MyColor.fuchsiaBlueLight)),
      child: TextField(
        controller: textEditingController,
        cursorColor: MyColor.black,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(
            title!,
            textScaleFactor: ProjectFontSize.oneToOne,
          ),
          prefixIcon: Icon(icon),
          hoverColor: MyColor.black,
          border: const OutlineInputBorder(
            borderRadius: ProjectRadius.mediumAll(),
          ),
        ),
      ),
    );
  }
}
