import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class ChangeIconButton extends StatelessWidget {
  final void Function()? pressButton;
  final IconData? buttonIcon;
  final IconData? changeIcon;
  final bool? change;
  final String? buttonTooltip;
  const ChangeIconButton({
    Key? key,
    this.pressButton,
    this.buttonIcon,
    this.changeIcon,
    this.change,
    this.buttonTooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      splashColor: MyColor.fuchsiaBlue,
      iconSize: 30,
      icon: Icon(
        change == false ? buttonIcon : changeIcon,
      ),
      onPressed: pressButton,
      tooltip: buttonTooltip,
    );
  }
}
