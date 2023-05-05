import 'package:flutter/material.dart';

class ProjectSize extends Size {
  ProjectSize.smallHeight() : super.fromHeight(5);
  ProjectSize.smallWidtht() : super.fromWidth(5);
  ProjectSize.normalHeight() : super.fromHeight(8);
  ProjectSize.normalWidth() : super.fromWidth(8);
  ProjectSize.bigHeight() : super.fromHeight(20);
  ProjectSize.bigWidth() : super.fromWidth(20);
  ProjectSize.veryBigHeight() : super.fromHeight(25);
  ProjectSize.veryBigWidth() : super.fromWidth(25);

  ProjectSize.border() : super.fromWidth(2);

  ProjectSize.authSize(context)
      : super(MediaQuery.of(context).size.width / 1.2, 50);
}
