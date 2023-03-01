import 'package:flutter/cupertino.dart';

mixin CheckMixin<T extends StatefulWidget> on State<T> {
  bool check = true;
  void changeCheck() {
    setState(() {
      check = !check;
    });
  }
}
