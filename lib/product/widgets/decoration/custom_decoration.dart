import 'package:flutter/material.dart';

import '../../../Core/Constant/radius.dart';
import '../../constant/colors.dart';

class CustomPrefixDecoration extends BoxDecoration {
  CustomPrefixDecoration(
      {Color borderColor = MyColor.osloGrey, double borderWidth = 1})
      : super(
          border: Border(
            right: BorderSide(
              width: borderWidth,
              color: MyColor.osloGrey,
            ),
          ),
        );
}

class CustomDecoration extends BoxDecoration {
  CustomDecoration({Color backgroundColor = MyColor.desertStorm})
      : super(
          borderRadius: const ProjectBorders.smallAll(),
          color: backgroundColor,
          boxShadow: [
            const BoxShadow(
              color: MyColor.boxShadowColor,
              offset: Offset(
                0,
                0,
              ),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        );
}
