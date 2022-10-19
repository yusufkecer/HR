// ignore_for_file: must_be_immutable
import 'package:chat/Core/Constant/size.dart';
import 'package:flutter/material.dart';
import '../Constant/colors.dart';
import 'sized_box/box_space.dart';

class CheckboxText extends StatefulWidget {
  final FontWeight fontWeight;
  bool? onChanged;
  final String checkboxName;
  CheckboxText(this.fontWeight, this.checkboxName,
      {this.onChanged = false, super.key});

  @override
  State<CheckboxText> createState() => _CheckboxTextState();
}

class _CheckboxTextState extends State<CheckboxText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: ProjectSize.veryBigHeight().height,
          width: ProjectSize.veryBigWidth().width,
          child: Checkbox(
            checkColor: MyColor.white,
            activeColor: MyColor.lightBlack,
            side: BorderSide(
              color: MyColor.lightBlack,
              width: ProjectSize.border().width,
            ),
            value: widget.onChanged,
            onChanged: (value) {
              setState(() {
                widget.onChanged = value;
              });
            },
          ),
        ),
        BoxSpace(
          width: ProjectSize.normalWidth().width,
        ),
        Text(
          widget.checkboxName,
          style: TextStyle(fontWeight: widget.fontWeight),
        )
      ],
    );
  }
}
