import 'package:flutter/material.dart';
import 'package:hrapp/feature/auth/login/login_view/login_view.dart';
import 'package:hrapp/feature/company/company_home_page/company_home_page.dart';

import '../../../../core/mixin/password_visible.dart';

abstract class LoginViewModel extends State<LoginView>
    with PasswordVisibilityMixin {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  checkValidator() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const CompanyHomePage(),
        ),
      );
    }
  }
}
