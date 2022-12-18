import 'package:flutter/cupertino.dart';

mixin CheckMixin<T extends StatefulWidget> on State<T> {
  bool check = false;
  void changeCheck(value) {
    setState(() {
      check = !check;
    });
  }
}
