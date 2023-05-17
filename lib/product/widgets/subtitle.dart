import 'package:flutter/material.dart';
import 'package:hrapp/product/constant/colors.dart';

import '../../core/constant/project_padding.dart';
import '../Constant/weight.dart';
import '../constant/font_size.dart';

class Subtitle extends StatelessWidget {
  final double fontSize;
  final String? title;
  final Color? color;
  const Subtitle({
    Key? key,
    this.fontSize = ProjectFontSize.oneToThree,
    required this.title,
    this.color = MyColor.lightBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allEight().copyWith(bottom: 0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title!,
          textScaleFactor: fontSize,
          style: TextStyle(fontWeight: Weight.midium, color: color),
        ),
      ),
    );
  }
}
