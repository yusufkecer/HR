import 'package:chat/Core/Constant/size.dart';
import 'package:chat/Product/widgets/sized_box/box_space.dart';

import 'package:flutter/material.dart';
import '../Constant/weight.dart';

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
          textScaleFactor: 2.3,
          style: const TextStyle(fontWeight: Weight.bold),
        ),
        BoxSpace(
          height: ProjectSize.smallHeight().height,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.left,
          textScaleFactor: 1.5,
          style: const TextStyle(fontWeight: Weight.midium),
        ),
      ],
    );
  }
}
