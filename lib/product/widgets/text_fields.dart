import 'package:chat/Core/Constant/edge_insets.dart';
import 'package:flutter/material.dart';
import '../../Core/Constant/radius.dart';
import '../Constant/colors.dart';

class TextFields extends StatelessWidget {
  final String? info;
  final Icon? suffixIcon;
  final FontWeight? fontWeight;
  final Map<String, dynamic>? users;
  final Icon? icon;
  final EdgeInsets? titlePadding;
  const TextFields({
    this.titlePadding,
    this.suffixIcon,
    this.fontWeight,
    this.info,
    this.users,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    final TextEditingController controller = TextEditingController();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller.selection =
            TextSelection(baseOffset: 0, extentOffset: controller.text.length);
      }
    });

    controller.addListener(() {
      if (controller.value.text != "") {
        users?[info!] = controller.value.text;
      }
    });
    if (info == null ||
        suffixIcon == null ||
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
              padding: const ProjectPadding.allEight(),
              child: textfField(controller, focusNode),
            )),
      ],
    );
  }

  TextFormField textfField(controller, focusNode) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: info,
        prefixIcon: icon,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: suffixIcon!,
        ),
      ),
    );
  }
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
