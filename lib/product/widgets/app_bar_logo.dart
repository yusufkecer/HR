import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/edge_insets.dart';
import 'package:hrapp/product/constant/image_path.dart';

class AppBarLogoTitle extends StatelessWidget {
  const AppBarLogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: ProjectPadding.topEight(),
      child: Image(
        image: AssetImage(
          ImagePath.appbarLogo,
        ),
        height: 30,
      ),
    );
  }
}
