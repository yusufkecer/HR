import 'package:chat/Core/Constant/edge_insets.dart';
import 'package:chat/core/constant/size.dart';
import 'package:flutter/material.dart';
import '../../Core/Constant/radius.dart';
import '../Constant/colors.dart';
import 'package:chat/product/widgets/sized_box/box_space.dart';

class TextFields extends StatelessWidget {
  final String? info;
  Widget? suffixButton;
  final FontWeight? fontWeight;
  final Widget? icon;
  final EdgeInsets? titlePadding;
  Function? validator;
  Function? onchange;

  bool? secure;
  TextFields({
    required String? Function(String? value) validator,
    required String? Function(String? value) onchange,
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

    final TextEditingController controller = TextEditingController();

    if (info == null ||
        suffixButton == null ||
        fontWeight == null ||
        titlePadding == null ||
        icon == null) {
      throw "null değer döndü";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: titlePadding!,
          child: Text(
            info!,
            textScaleFactor: 1.1,
            style: TextStyle(fontWeight: fontWeight),
          ),
        ),
        Container(
          decoration: CustomDecoration(),
          child: Padding(
              padding: const ProjectPadding.allEight(), child: textfField()),
        ),
        BoxSpace(
          height: ProjectSize.normalHeight().height,
        )
      ],
    );
  }

  TextFormField textfField() {
    return TextFormField(
      obscureText: secure!,
      autocorrect: secure!,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: info,
        prefixIcon: icon,
        suffixIcon: suffixButton,
      ),
    );
  }

  void showPassword() {}
}

class CustomDecoration extends BoxDecoration {
  CustomDecoration({Color backgroundColor = MyColor.desertStorm})
      : super(
          borderRadius: const ProjectBorders.smallAll(),
          color: backgroundColor,
          boxShadow: [
            const BoxShadow(
              color: MyColor.boxShadowColor,
              offset: Offset(
                0,
                0,
              ),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        );
}
