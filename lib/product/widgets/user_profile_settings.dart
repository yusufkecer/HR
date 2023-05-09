import 'package:flutter/material.dart';

import 'package:hrapp/product/constant/font_size.dart';

class UserProfileSettings extends StatelessWidget {
  final IconData leading;
  final void Function() ontap;
  final IconData? trailing;
  final String title;
  const UserProfileSettings({
    Key? key,
    required this.leading,
    required this.ontap,
    this.trailing,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Icon(
        leading,
        size: 27,
      ),
      title: Text(
        title,
        textScaleFactor: ProjectFontSize.oneToOne,
      ),
      trailing: Icon(
        trailing,
        size: 22,
      ),
    );
  }
}
