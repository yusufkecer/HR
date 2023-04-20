import 'package:flutter/material.dart';
import 'package:hrapp/Product/Constant/colors.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/weight.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0XFFE7EBF5),
      leading: const Icon(MyIcons.drawer, size: 35),
      toolbarHeight: 70,
      title: title(),
      centerTitle: true,
      actions: [
        profileImage(),
      ],
    );
  }

  Padding profileImage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 45,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage(
              ImagePath.temporaryImage,
            ),
            fit: BoxFit.contain,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: MyColor.white, width: 2),
        ),
      ),
    );
  }

  Widget title() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Adres",
              textScaleFactor: 1,
              style: TextStyle(
                color: MyColor.veryLightBlack,
                fontWeight: Weight.normal,
              ),
            ),
            SizedBox(
              width: 10,
              height: 27,
              child: IconButton(
                  padding: const ProjectPadding.edgeZero(),
                  onPressed: () {
                    print("tested");
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: MyColor.veryLightBlack,
                    size: 27,
                  )),
            )
          ],
        ),
        Text(
          "Antalya, Türkiye",
          style: TextStyle(
            fontWeight: Weight.midium,
            color: Colors.black.withOpacity(
              0.8,
            ),
          ),
        ),
      ],
    );
  }
}
