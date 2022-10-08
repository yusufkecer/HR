import 'package:chat/Firebase/Firestore.dart';
import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  String userInfo;
  Map<String, dynamic> users = {};
  TextFields(this.userInfo, this.users, {super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });

    _controller.addListener(() {
      if (_controller.value.text != "") {
        widget.users["name"] = _controller.value.text;
      }
    });

    return Column(
      children: [
        TextFormField(
          controller: _controller,
          keyboardType: TextInputType.number,
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: widget.userInfo,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
