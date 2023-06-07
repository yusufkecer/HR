import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/company/company_profile/company_profile_view.dart';
import 'package:hrapp/feature/user/user_advert_application/user_advert_app_view.dart';
import 'package:hrapp/product/service/data_service.dart';

import '../../../product/models/general_company_model.dart';
import '../../../product/service/api.dart';
import '../user_advert_detail/user_advert_detail_view.dart';

abstract class UserAdvertAppViewModel extends State<UserAdvertAppView> {
  DataService dataService = DataService();
  NavigationService nav = NavigationService();
  List<Job> companyList = [];
  List<Job> advertList = [];
  userAdvertListDetail(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserAdvertDetailView(
          job: widget.adverts?[index],
          isApplication: true,
        ),
      ),
    );
  }

  @override
  void initState() {
    Future(() => getCompanyInfo());
    Future(() => getAdverts());

    super.initState();
  }

  goToCompanyProfile(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompanyProfileView(
          companyInfo: companyList[index],
        ),
      ),
    );
  }

  Future<void> getCompanyInfo() async {
    Future(() => nav.showLoading());
    companyList = [];
    for (var item in widget.adverts!) {
      var res = await dataService.fetchData("${ApiUri.companyInfoById}${item["employerId"]}");
      if (res == null) {
        return;
      }
      companyList.add(Job.fromJsonCompanyInfo(res["data"]));
    }
    Future(() => nav.hideLoading());
    setState(() {});
  }

  Future<void> getAdverts() async {
    Future(() => nav.showLoading());
    companyList = [];
    for (var item in widget.adverts!) {
      var res = await dataService.fetchData("${ApiUri.getAdvertById}${item["jobAdvertisementId"]}");
      if (res == null) {
        return;
      }
      advertList.add(Job.fromJson(res["data"]));
    }
    Future(() => nav.hideLoading());
    setState(() {});
  }
}
