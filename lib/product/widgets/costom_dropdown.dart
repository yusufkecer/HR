import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';

class CustomDropdown extends StatefulWidget {
  final String? selected;
  final String? hint;
  final Function(dynamic) onChange;
  final Map? items;
  const CustomDropdown({
    Key? key,
    this.selected,
    this.hint,
    required this.onChange,
    this.items,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
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
            value: widget.selected,
            onChanged: widget.onChange,
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
        value: value,
        child: Text(key),
      ));
    });
  }
}
