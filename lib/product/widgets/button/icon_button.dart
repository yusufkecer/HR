import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProjectIconButton extends StatelessWidget {
  final void Function()? pressButton;
  final IconData? buttonIcon;
  final IconData? changeIcon;
  final bool? change;
  final String? buttonTooltip;
  const ProjectIconButton({
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
      icon: Icon(change == false ? buttonIcon : changeIcon),
      onPressed: pressButton,
      tooltip: buttonTooltip,
    );
  }
}
