import 'package:flutter/material.dart';

mixin PasswordVisibilityMixin<T extends StatefulWidget> on State<T> {
  bool isVisible = false;

  changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }
}
