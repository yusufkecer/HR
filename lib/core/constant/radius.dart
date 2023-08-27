import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ProjectRadius extends BorderRadius {
  const ProjectRadius.oneAll() : super.all(const Radius.circular(1));
  const ProjectRadius.verySmallAll() : super.all(const Radius.circular(5));
  const ProjectRadius.smallAll() : super.all(const Radius.circular(10));
  const ProjectRadius.mediumAll() : super.all(const Radius.circular(16));
  const ProjectRadius.bigAll() : super.all(const Radius.circular(20));
  const ProjectRadius.veryBigAll() : super.all(const Radius.circular(30));
  const ProjectRadius.bigOnly()
      : super.only(topLeft: const Radius.circular(20),topRight: const Radius.circular(20));
}
