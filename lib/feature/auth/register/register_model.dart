import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hrapp/core/mixin/password_visible.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/models/general_company_model.dart';
import 'package:hrapp/product/service/api.dart';
import 'package:hrapp/product/service/data_service.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../product/models/user_model/user_model.dart';
import 'register_view.dart';

abstract class RegisterViewModel extends State<RegisterView> with PasswordVisibilityMixin {
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  NavigationService nav = NavigationService();
  DateTime? selectedDate;
  @override
  void initState() {
    super.initState();
  }

  DataService dataService = DataService();
  String? tax;
  String? email;
  String? surname;
  String? name;
  String? siteOrName;
  String? password;
  String? phone;
  String? birthOfDay;

  Future<void> onpressed() async {
    nav.closeKeyboard();
    bool isPassed = checkvalid();
    if (isPassed == false) {
      return;
    }
    nav.showLoading(context);

    // ignore: prefer_typing_uninitialized_variables
    var res;
    if (widget.isCompany == true) {
      Job data = Job(companyName: name, email: email, webSite: siteOrName, companyPhone: phone, password: password);

      final json = jsonEncode(data.companyToJson());
      res = await dataService.post(ApiUri.registerCompany, json);
    } else {
      User data = User(
          name: name, surname: siteOrName, email: email, phoneNumber: phone, password: password, birthDay: birthOfDay);

      final json = jsonEncode(data.toJson());
      res = await dataService.post(ApiUri.registerUser, json);
    }
    // ignore: use_build_context_synchronously
    nav.hideLoading(context);
    try {
      if (res == null) {
        return;
      } else if (res["isSuccess"]) {
        nav.alertWithButon(
          "Başarılı",
          "Kayıdınız başarıyla gerçekleşti!",
          StringData.ok,
          () => nav.back(),
        );
      }
    } catch (e) {
      nav.alertWithButon("Hata", "Kayıt sırasında bir hata oluştu. Lütfen daha sonra tekrar deneyin");
    }
  }

  goToLogin() {
    Navigator.of(context).pop();
  }

  void openPicker() async {
    nav.closeKeyboard();
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
    birthOfDay =
        """${selectedDate?.year}-${selectedDate!.month > 10 ? selectedDate!.month : "0${selectedDate!.month}"}-${selectedDate!.day > 10 ? selectedDate!.day : "0${selectedDate!.day}"}""";
  }

  bool checkvalid() {
    if (formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
