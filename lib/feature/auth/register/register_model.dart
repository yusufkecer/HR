import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hrapp/core/mixin/password_visible.dart';
import 'package:hrapp/product/models/general_company_model.dart';
import 'package:hrapp/product/service/api.dart';
import 'package:hrapp/product/service/data_service.dart';
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

  DataService dataService = DataService();
  String? email;
  String? name;
  String? webSite;
  String? password;
  String? phone;

  Future<void> onpressed() async {
    bool isPassed = checkvalid();
    if (isPassed == false) {
      return;
    }
    nav.showLoading(context);
    Job data = Job(companyName: name, email: email, webSite: webSite, companyPhone: phone, password: password);
    final json = jsonEncode(data.companyToJson());
    var res;
    if (widget.isCompany == true) {
      res = await dataService.postAdvert(ApiUri.registerCompany, json);
    } else {
      res = await dataService.postAdvert(ApiUri.registerUser, json);
    }

    if (res == null) {
      return;
    }
    Future(() => nav.hideLoading(context));
    goToLogin();
  }

  goToLogin() {
    Navigator.of(context).pop();
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

  bool checkvalid() {
    if (formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
