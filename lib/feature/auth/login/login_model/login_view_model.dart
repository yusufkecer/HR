import 'package:flutter/material.dart';
import 'package:hrapp/core/mixin/check_mixin.dart';
import 'package:hrapp/core/services/navigation_service.dart';
import 'package:hrapp/feature/auth/login/login_view/login_view.dart';

import '../../../../core/mixin/password_visible.dart';

abstract class LoginViewModel extends State<LoginView>
    with PasswordVisibilityMixin, CheckMixin {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  NavigationService nav = NavigationService();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  checkValidator() {
    if (formKey.currentState!.validate()) {
      nav.navigteToCompany(context);
    }
  }
}
