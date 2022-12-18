import 'package:flutter/cupertino.dart';

class ProjectPadding extends EdgeInsets {
//all
  const ProjectPadding.allEightTeen() : super.all(18);
  const ProjectPadding.allSixteen() : super.all(16);
  const ProjectPadding.allEight() : super.all(8);
  const ProjectPadding.edgeZero() : super.all(0);
//only
  const ProjectPadding.leftEight() : super.only(left: 8);
  const ProjectPadding.appBarPadding() : super.fromLTRB(8, 0, 8, 15);
  const ProjectPadding.topEight() : super.only(top: 8);
  const ProjectPadding.topTwenty() : super.only(top: 20);
  const ProjectPadding.bottomThirty() : super.only(bottom: 25);
  const ProjectPadding.leftEightTeen() : super.only(left: 18);
//spesific
  const ProjectPadding.textFieldTitle() : super.only(left: 3.0, bottom: 8);
  const ProjectPadding.textFieldContent(content) : super.only(top: content);
}
