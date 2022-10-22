import 'package:flutter/material.dart';
import '../../../Core/Constant/radius.dart';
import '../../../Core/Constant/size.dart';
import '../../constant/font_size.dart';

class MyElevatedIcons extends StatelessWidget {
  final Function? onPressed;
  final String? buttonName;
  final Icon? icons;
  const MyElevatedIcons({
    Key? key,
    this.onPressed,
    this.buttonName,
    this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ProjectSize.authSize(context).height,
      width: ProjectSize.authSize(context).width,
      child: elevatedButton(context),
    );
  }

  ElevatedButton elevatedButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: buttonShape(),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      onPressed: () => onPressed!(),
      icon: icons!,
      label: Text(
        buttonName!,
        textScaleFactor: ProjectFontSize.elevatedButton,
      ),
    );
  }

  RoundedRectangleBorder buttonShape() {
    return const RoundedRectangleBorder(
        borderRadius: ProjectBorders.smallAll());
  }
}
