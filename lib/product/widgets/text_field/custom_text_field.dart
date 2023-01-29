import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';

import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final int? maxLine;
  final TextEditingController? textEditingController;
  final IconData? icon;
  final String? hint;

  const CustomTextField({
    Key? key,
    this.title,
    this.maxLine,
    this.textEditingController,
    this.icon,
    this.hint,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(colorScheme: ThemeData().colorScheme.copyWith(primary: MyColor.fuchsiaBlueLight)),
      child: TextField(
        maxLines: widget.maxLine,
        controller: widget.textEditingController,
        cursorColor: MyColor.black,
        decoration: InputDecoration(
          contentPadding: const ProjectPadding.allTwenty().copyWith(left: 23),
          hintText: widget.hint,
          label: Text(
            widget.title!,
            textScaleFactor: ProjectFontSize.oneToOne,
          ),
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          hoverColor: MyColor.black,
          border: const OutlineInputBorder(
            borderRadius: ProjectRadius.mediumAll(),
          ),
        ),
      ),
    );
  }
}
