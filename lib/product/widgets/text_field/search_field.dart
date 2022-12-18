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
        borderRadius: ProjectBorders.mediumAll(),
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
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
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
                padding: EdgeInsets.only(left: 8.0),
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
