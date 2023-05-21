import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/user/user_cv/user_cv_page/user_cv_view.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/service/api.dart';
import 'package:hrapp/product/service/data_service.dart';

import '../../../user_cv_detail/user_cv_detail_view.dart';
import '../user_create_cv/user_create_cv_view.dart';

abstract class UserCvViewModel extends State<UserCVView> {
  NavigationService nav = NavigationService();

  void navigateCreateCv(Map<String, dynamic>? cv) async {
    Future(() async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UserCreateCvView(cv: cv),
        ),
      );
      widget.getCv();
      setState(() {});
    });
  }

  DataService dataService = DataService();
  void navigateDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserCvDetailView(
          cv: widget.cv,
        ),
      ),
    );
  }

  Future<void> deleteCv() async {
    bool? val;
    await Future(() async => val = await nav.checkDialog(StringData.checkTitle, StringData.deleteCv));
    if (val == false) {
      return;
    }
    Future(() => nav.showLoading());
    await dataService.delete(ApiUri.deleteCv, widget.cv!["id"]);
    Future(() => nav.hideLoading());
    await widget.getCv();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }
}
