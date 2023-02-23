import 'package:flutter/material.dart';
import 'package:hrapp/core/mixin/password_visible.dart';
import 'package:hrapp/feature/auth/login/login_view.dart';

import '../../../core/navigation/navigation_service.dart';
import 'register_view.dart';

abstract class LoginViewModel extends State<RegisterView> with PasswordVisibilityMixin {
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  NavigationService nav = NavigationService();
  DateTime? selectedDate;
  @override
  void initState() {
    super.initState();
  }

  onpressed() {
    checkvalid();
  }

  openPicker() async {
    FocusScope.of(context).requestFocus(FocusNode());
    selectedDate = await nav.showDate(context);
    if (selectedDate == null) {
      return;
    }
    saveDate();
  }

  void saveDate() {
    dateController.text = ("${selectedDate!.day > 10 ? selectedDate!.day : "0${selectedDate!.day}"}/"
        "${selectedDate!.month > 10 ? selectedDate!.month : "0${selectedDate!.month}"}/"
        "${selectedDate!.year}");
  }

  checkvalid() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginView(),
      ));
    }
  }
}
