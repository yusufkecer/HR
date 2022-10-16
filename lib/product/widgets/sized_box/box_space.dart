import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxSpace extends StatelessWidget {
  final double? height;
  final double? width;
  const BoxSpace({this.width, this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
