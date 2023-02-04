import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/radius.dart';

import '../constant/font_size.dart';

class ContactCard extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final IconData? iconLeading;
  final String? text;
  final double scale;

  const ContactCard({
    Key? key,
    this.color,
    required this.textColor,
    required this.iconLeading,
    required this.text,
    this.scale = ProjectFontSize.oneToOne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != null || text == ""
        ? ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: color, borderRadius: const ProjectRadius.bigAll()),
              child: Icon(iconLeading),
            ),
            title: Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.left,
                  text!,
                  textScaleFactor: scale,
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
