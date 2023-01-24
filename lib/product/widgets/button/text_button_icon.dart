import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class TextButtonWeight extends StatelessWidget {
  final FontWeight? weight;
  final String? buttonName;
  final Function? onPressed;
  const TextButtonWeight({this.weight = FontWeight.normal, this.buttonName = "", this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(foregroundColor: MyColor.lightBlack),
      onPressed: () => onPressed!(),
      icon: const Icon(Icons.lock_person_outlined),
      label: Text(
        buttonName!,
        textAlign: TextAlign.right,
        style: TextStyle(fontWeight: weight),
      ),
    );
  }
}
