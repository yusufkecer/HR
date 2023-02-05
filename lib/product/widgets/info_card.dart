import 'package:flutter/material.dart';
import '../../Core/Constant/radius.dart';
import '../Constant/colors.dart';

class InfoCard extends StatelessWidget {
  final Color? cardColor;
  final Widget? child;
  const InfoCard({
    Key? key,
    this.cardColor = MyColor.white,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: const ProjectRadius.mediumAll(),
        boxShadow: [
          BoxShadow(
            color: MyColor.osloGrey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
