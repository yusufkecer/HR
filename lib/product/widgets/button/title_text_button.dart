import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/product/Constant/colors.dart';
import 'package:hrapp/product/widgets/subtitle.dart';
import '../../constant/font_size.dart';

class TitleWithTextButton extends StatelessWidget {
  final String? title;
  final String? buttonName;
  final void Function()? onPress;
  const TitleWithTextButton({
    Key? key,
    this.title,
    this.buttonName,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Subtitle(
          title: title,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: onPress,
          child: Padding(
            padding: const ProjectPadding.allEight().copyWith(bottom: 0),
            child: Text(
              buttonName ?? "",
              style: const TextStyle(color: MyColor.purplishBlue),
              textScaleFactor: ProjectFontSize.oneToThree,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }
}
