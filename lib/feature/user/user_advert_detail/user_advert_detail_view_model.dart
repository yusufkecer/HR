import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/user/user_advert_detail/user_advert_detail_view.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/data/auth.dart';
import 'package:hrapp/product/service/api.dart';
import 'package:hrapp/product/service/data_service.dart';

abstract class UserAdvertDetailViewModel extends State<UserAdvertDetailView> {
  DataService dataService = DataService();
  NavigationService nav = NavigationService();
  String? date;
  String? description;
  @override
  void initState() {
    if (widget.job?.deadline != null) {
      List val = widget.job!.deadline!.toString().split(" ")[0].split("-");
      date = val[2] + "/" + val[1] + "/" + val[0];
    }

    super.initState();
  }

  void advertApplication() async {
    String? val = await nav.displayTextInputDialog(
      StringData.enterDescription,
      StringData.sendDescriptionToCompany,
      TextEditingController(),
    );
    if (val == null || val == "false") {
      return;
    }

    if (val.length <= 30) {
      nav.alertWithButon(
          StringData.error, "Açıklama 30 karakterden az olamaz. Giridiğiniz karakter sayısı: ${val.length}");
      return;
    }
    bool? check = await nav.checkDialog(
      StringData.checkTitle,
      StringData.checkApplication,
    );
    if (check != true) {
      return;
    }
    nav.showLoading();
    description = val;
    print("description: $description");
    Map<String, dynamic> data = {
      "jobAdvertisementId": widget.job!.id,
      "jobSeekerId": Auth.instance.getId,
      "jobSeekerDescription": description,
    };
    String json = jsonEncode(data);
    var res = await dataService.post(ApiUri.advertApplication, json);
    nav.hideLoading();

    if (res is Map) {
      nav.alertWithButon(StringData.success, StringData.applicationSuccess);
    }
  }
}
