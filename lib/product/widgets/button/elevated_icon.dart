import 'package:flutter/material.dart';

import '../../../Core/Constant/radius.dart';
import '../../../Core/Constant/size.dart';

class ElevatedIcons extends StatelessWidget {
  final Function onPressed;
  final String buttonName;
  final Icon loginIcon;
  const ElevatedIcons(this.onPressed, this.buttonName, this.loginIcon,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ProjectSize.authSize(context).height,
      width: ProjectSize.authSize(context).width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: ProjectBorders.smallAll()),
            backgroundColor: Theme.of(context).backgroundColor),
        onPressed: () {
          onPressed();
        },
        icon: loginIcon,
        label: Text(
          buttonName,
          textScaleFactor: 1.4,
        ),
      ),
    );
  }
}
