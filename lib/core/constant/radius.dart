import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ProjectBorders extends BorderRadius {
  const ProjectBorders.oneAll() : super.all(const Radius.circular(1));
  const ProjectBorders.smallAll() : super.all(const Radius.circular(10));
  const ProjectBorders.mediumAll() : super.all(const Radius.circular(16));
  const ProjectBorders.bigAll() : super.all(const Radius.circular(20));
  const ProjectBorders.bigOnly()
      : super.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
        );
}
