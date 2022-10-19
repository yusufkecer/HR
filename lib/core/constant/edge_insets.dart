import 'package:flutter/cupertino.dart';

class ProjectPadding extends EdgeInsets {
//all
  const ProjectPadding.allEightteen() : super.all(18);
  const ProjectPadding.allEight() : super.all(8);
  const ProjectPadding.edgeZero() : super.all(0);
//only
  const ProjectPadding.leftEight() : super.only(left: 8);
  const ProjectPadding.topEight() : super.only(left: 8);
  const ProjectPadding.topTwenty() : super.only(top: 20);
//spesific
  const ProjectPadding.textFieldTitle() : super.only(left: 3.0, bottom: 8);
  const ProjectPadding.textFieldContent(content) : super.only(top: content);
}
