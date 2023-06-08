import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/user_cv_detail/user_cv_detail_view.dart';
import 'package:hrapp/product/models/general_company_model.dart';
import 'package:hrapp/product/service/data_service.dart';

import '../../../product/service/api.dart';
import 'company_advert_app_view.dart';

abstract class CompanyAdvertAppViewModel extends State<CompanyAdvertAppView> {
  DataService dataService = DataService();
  NavigationService nav = NavigationService();
  List? userInfoList;
  List<Job>? advertList;
  List appList = [];
  @override
  void initState() {
    appList = widget.appList ?? [];
    getInfo();
    super.initState();
  }

  void getInfo() async {
    Future(() => nav.showLoading(context));

    await getUserInfo();
    Future(() => nav.hideLoading(context));
  }

  Future<void> getAdvertList() async {
    advertList = [];
    if (widget.appList == null) {
      return;
    }
    for (var element in widget.appList!) {
      var res = await dataService.fetchData(ApiUri.getAdvertById + element["jobAdvertisementId"]);
      if (res != null) {
        if (res["data"] != null) {
          advertList?.add(Job.fromJson(res["data"]));
        }
      }
    }
    setState(() {});
  }

  Future<void> getUserInfo() async {
    userInfoList = [];
    if (widget.appList == null) {
      return;
    }
    for (var element in widget.appList!) {
      var res = await dataService.fetchData(ApiUri.userInfoById + element["jobSeekerId"]);
      if (res != null) {
        userInfoList?.add(res["data"]);
      }
    }
    await getAdvertList();
  }

  void goToUserDetail(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserCvDetailView(
          cv: userInfoList?[index]["cv"],
          adverts: advertList?[index],
          isCompany: true,
        ),
      ),
    );
  }
}
