import 'package:flutter/material.dart';
import 'package:hrapp/core/mixin/check_mixin.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/auth/login/login_view.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/service/api.dart';
import '../../../core/mixin/password_visible.dart';
import '../../../product/data/auth.dart';
import '../register/register_view.dart';
import '../reset_password/reset_password_view.dart';

abstract class LoginViewModel extends State<LoginView> with PasswordVisibilityMixin, CheckMixin {
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

  void navigateResetPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ResetPassword(),
      ),
    );
  }

  void goToRegister(context, isCompany) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => RegisterView(
              isCompany: isCompany,
            )),
      ),
    );
  }

  void navigateApp() async {
    nav.closeKeyboard();
    Future(() => nav.showLoading(context));
    var val = await Auth.instance.login(
      emailController.text,
      passwordController.text,
      widget.isCompany! ? ApiUri.loginCompnay : ApiUri.loginUser,
      true,
      check,
    );
    Future(() => nav.hideLoading(context));
    if (val == true) {
      Future(() => widget.isCompany! ? nav.navigteToCompany(context) : nav.navigteToUser(context));
    } else if (val.runtimeType == String) {
      Future(() => nav.callSnackbar(context, val));
    } else if (val.runtimeType == List) {
      Future(() => nav.callSnackbar(context, val.join()));
    } else {
      Future(() => nav.callSnackbar(context, StringData.generalErr));
    }
  }
}
