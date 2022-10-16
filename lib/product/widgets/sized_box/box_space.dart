import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxSpace extends StatelessWidget {
  final double height;
  final double width;
  const BoxSpace({this.width = 0, this.height = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
