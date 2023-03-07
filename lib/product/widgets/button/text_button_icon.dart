import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class TextButtonIcon extends StatelessWidget {
  final FontWeight? weight;
  final String? buttonName;
  final IconData? myIcons;
  final Color? colors;
  final void Function()? onPressed;
  const TextButtonIcon({
    Key? key,
    @required this.buttonName,
    @required this.myIcons,
    @required this.onPressed,
    this.weight,
    this.colors = MyColor.lightBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(foregroundColor: colors),
      onPressed: () => onPressed!(),
      icon: Icon(myIcons!),
      label: Text(
        buttonName!,
        textAlign: TextAlign.right,
        style: TextStyle(fontWeight: weight),
      ),
    );
  }
}
