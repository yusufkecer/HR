import 'package:flutter/material.dart';

import '../Constant/colors.dart';
import '../Constant/weight.dart';
import '../constant/font_size.dart';
import '../constant/image_path.dart';

class NotFound extends StatelessWidget {
  final String? text;
  final double padding;
  const NotFound({
    Key? key,
    required this.text,
    this.padding = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagePath.dontResult,
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: MyColor.osloGrey, fontWeight: Weight.midium),
            textScaleFactor: ProjectFontSize.oneToFour,
          ),
        ],
      ),
    );
  }
}
