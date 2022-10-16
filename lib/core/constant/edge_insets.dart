import 'package:flutter/cupertino.dart';

class ProjectPadding extends EdgeInsets {
  const ProjectPadding.allEight() : super.all(8);
  const ProjectPadding.leftEight() : super.only(left: 8);
  const ProjectPadding.allEightteen() : super.all(18);
  const ProjectPadding.topTwenty() : super.only(top: 20);
  const ProjectPadding.textFieldTitle() : super.only(left: 3.0, bottom: 8);
  const ProjectPadding.edgeZero() : super.all(0);
}
