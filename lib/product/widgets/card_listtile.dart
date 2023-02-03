import 'package:flutter/material.dart';
import 'package:hrapp/Product/Constant/colors.dart';

import '../constant/font_size.dart';

class CardAndListtile extends StatelessWidget {
  final IconData? iconLeading;
  final String? text;
  final IconData? trailing;
  final void Function()? onpress;
  const CardAndListtile({
    Key? key,
    required this.iconLeading,
    required this.text,
    required this.trailing,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != null || text == ""
        ? ListTile(
            leading: Icon(iconLeading),
            title: Center(
              child: Text(
                text!,
                textScaleFactor: ProjectFontSize.oneToTwo,
              ),
            ),
            trailing: IconButton(onPressed: onpress, icon: Icon(trailing)),
          )
        : const SizedBox();
  }
}
