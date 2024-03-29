import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final bool selectionCursor;
  final int? maxLine;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final IconData? icon;
  final void Function()? tap;
  final String? hint;
  final String? Function(String?)? validation;

  const CustomTextField({
    Key? key,
    this.title,
    this.selectionCursor = true,
    this.maxLine,
    this.textInputType,
    this.textEditingController,
    this.icon,
    this.tap,
    this.hint,
    this.validation,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(primary: MyColor.fuchsiaBlueLight),
      ),
      child: TextFormField(
        validator: widget.validation,
        enableInteractiveSelection: widget.selectionCursor,
        keyboardType: widget.textInputType ?? TextInputType.text,
        maxLines: widget.maxLine,
        controller: widget.textEditingController,
        cursorColor: MyColor.black,
        onTap: widget.tap,
        decoration: InputDecoration(
          contentPadding: const ProjectPadding.allTwenty().copyWith(left: 23),
          hintText: widget.hint,
          label: Text(
            widget.title ?? "",
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
