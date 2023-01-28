import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';

class CustomDropdown extends StatefulWidget {
  final String? hint;
  final Map? items;
  const CustomDropdown({
    Key? key,
    this.hint,
    this.items,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selected;
  List<DropdownMenuItem> dropItem = [];
  @override
  void initState() {
    dropdownItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: MyColor.osloGrey,
          ),
          borderRadius: const ProjectRadius.mediumAll()),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            menuMaxHeight: 300,
            isExpanded: true,
            isDense: true,
            value: selected,
            onChanged: change,
            hint: Text("${widget.hint}"),
            items: dropItem,
          ),
        ),
      ),
    );
  }

  dropdownItem() {
    widget.items?.forEach((key, value) {
      dropItem.add(DropdownMenuItem(
        value: key,
        child: Text(value),
      ));
    });
  }

  change(value) {
    setState(() {
      selected = value;
    });
  }
}
