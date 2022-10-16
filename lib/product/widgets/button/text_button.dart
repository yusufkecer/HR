import 'package:chat/Product/Constant/colors.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String? named;
  final Function? onPressed;

  const MyTextButton({this.onPressed, this.named = "aa", super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () => onPressed!(),
      child: Text(
        named!,
        style: const TextStyle(
          fontSize: 16,
          color: MyColor.purplishBlue,
        ),
      ),
    );
  }
}
