import 'package:flutter/material.dart';

import '../../core/constant/project_padding.dart';
import '../Constant/weight.dart';
import '../constant/font_size.dart';

class Subtitle extends StatelessWidget {
  final String? title;
  const Subtitle({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allEight().copyWith(bottom: 0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title!,
          textScaleFactor: ProjectFontSize.oneToThree,
          style: const TextStyle(
            fontWeight: Weight.midium,
          ),
        ),
      ),
    );
  }
}
