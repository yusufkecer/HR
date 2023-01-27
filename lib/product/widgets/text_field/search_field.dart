import 'package:flutter/material.dart';
import '../../../Core/Constant/radius.dart';
import '../../../core/constant/project_padding.dart';
import '../../constant/colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: MyColor.tints,
        borderRadius: ProjectRadius.mediumAll(),
      ),
      child: Center(
        child: Theme(
          data: ThemeData().copyWith(
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: MyColor.fuchsiaBlueLight,
                ),
          ),
          child: TextField(
            cursorColor: MyColor.butterflyBush,
            decoration: InputDecoration(
              contentPadding: const ProjectPadding.textFieldContent(14.0),
              hintText: "Ne Verelim Abime?",
              suffixIcon: Padding(
                padding: const ProjectPadding.rightEight(),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list,
                  ),
                ),
              ),
              border: InputBorder.none,
              prefixIconColor: Colors.grey,
              prefixIcon: const Padding(
                padding: ProjectPadding.leftEight(),
                child: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
