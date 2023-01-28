import 'package:flutter/cupertino.dart';

class ProjectPadding extends EdgeInsets {
//all
  const ProjectPadding.allEightTeen() : super.all(18);
  const ProjectPadding.allFive() : super.all(5);
  const ProjectPadding.allSixteen() : super.all(16);
  const ProjectPadding.allEight() : super.all(8);
  const ProjectPadding.allTwelve() : super.all(12);
  const ProjectPadding.allTwenty() : super.all(20);
  const ProjectPadding.edgeZero() : super.all(0);
//only
  const ProjectPadding.leftEight() : super.only(left: 8);
  const ProjectPadding.rightEight() : super.only(right: 8);
  const ProjectPadding.appBarPadding() : super.fromLTRB(8, 0, 8, 15);
  const ProjectPadding.topEight() : super.only(top: 8);
  const ProjectPadding.topTwenty() : super.only(top: 20);
  const ProjectPadding.bottomTwentySix() : super.only(bottom: 26);
  const ProjectPadding.leftEightTeen() : super.only(left: 18);
//symetric
  const ProjectPadding.horizontalEight() : super.symmetric(horizontal: 8);
  const ProjectPadding.horizontalFive() : super.symmetric(horizontal: 5);
  const ProjectPadding.horizontalTen() : super.symmetric(horizontal: 10);
  const ProjectPadding.horizontalTwelve() : super.symmetric(horizontal: 12);
//spesific
  const ProjectPadding.textFieldTitle() : super.only(left: 3.0, bottom: 8);
  const ProjectPadding.textFieldContent(content) : super.only(top: content);
  const ProjectPadding.createJob() : super.fromLTRB(13, 7, 13, 7);
}
