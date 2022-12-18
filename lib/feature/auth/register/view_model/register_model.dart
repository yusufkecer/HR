import 'package:flutter/material.dart';
import 'package:hrapp/core/mixin/password_visible.dart';
import 'package:hrapp/feature/auth/login/login_view/login_view.dart';

import '../../../../core/navigation/navigation_service.dart';
import '../register_view/register_view.dart';

abstract class LoginViewModel extends State<RegisterView> with PasswordVisibilityMixin {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  NavigationService nav = NavigationService();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  checkvalid() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginView(),
      ));
    }
  }
}
