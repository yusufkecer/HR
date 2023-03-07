import 'package:flutter/material.dart';

import 'package:hrapp/product/constant/colors.dart';

class CustomChipButton extends StatelessWidget {
  final String? title;
  final bool? selected;
  final void Function()? ontap;
  const CustomChipButton({
    Key? key,
    this.selected,
    this.title,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: GestureDetector(
        onTap: ontap,
        child: Chip(
          side: selected == false ? const BorderSide(color: MyColor.black) : null,
          labelPadding: selected! ? const EdgeInsets.fromLTRB(30, 7, 30, 7) : const EdgeInsets.fromLTRB(30, 6, 30, 6),
          label: Text(
            title!,
            style: TextStyle(
              color: selected! ? MyColor.white : MyColor.black,
            ),
          ),
          backgroundColor: selected! ? MyColor.fuchsiaBlue : MyColor.desertStorm,
        ),
      ),
    );
  }
}
