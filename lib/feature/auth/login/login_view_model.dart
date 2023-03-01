import 'package:flutter/material.dart';
import 'package:hrapp/core/mixin/check_mixin.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/auth/login/login_view.dart';
import 'package:hrapp/product/service/data_service.dart';
import '../../../core/mixin/password_visible.dart';
import '../../../product/data/auth.dart';

abstract class LoginViewModel extends State<LoginView> with PasswordVisibilityMixin, CheckMixin {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  DataService ds = DataService();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  NavigationService nav = NavigationService();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  void closeKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void navigateApp() async {
    closeKeyboard();
    Future(() => nav.showLoading(context));
    var val = await Auth.instance.login(emailController.text, passwordController.text);
    Future(() => nav.hideLoading(context));
    if (val == true) {
      Future(() => nav.navigteToCompany(context));
    } else if (val == false) {
      Future(() => nav.callSnackbar(context, "E-posta Veya Şifre Hatalı"));
    } else {
      Future(() => nav.callSnackbar(context, "Bir Hata Oluştu"));
    }
  }
}
