import 'package:chat/Core/Constant/size.dart';
import 'package:chat/Product/widgets/sized_box/box_space.dart';

import 'package:flutter/material.dart';
import '../Constant/weight.dart';
import '../constant/font_Size.dart';

class Titles extends StatelessWidget {
  final String title;
  final String subtitle;
  const Titles({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textScaleFactor: ProjectFontSize.mainTitle,
          style: const TextStyle(fontWeight: Weight.bold),
        ),
        BoxSpace(
          height: ProjectSize.smallHeight().height,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.left,
          textScaleFactor: ProjectFontSize.subTitle,
          style: const TextStyle(fontWeight: Weight.midium),
        ),
      ],
    );
  }
}
