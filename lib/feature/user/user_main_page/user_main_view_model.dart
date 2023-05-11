import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/user/user_cv/user_cv_page/user_cv_view.dart';
import 'package:hrapp/feature/user/user_main_page/user_main_view.dart';
import '../../../product/models/general_company_model.dart';
import '../../../product/service/api.dart';
import '../../../product/service/data_service.dart';
import '../user_advert_list/user_advert_list_view.dart';
import '../user_home_page/user_home_view.dart';
import '../user_access/user_access_view.dart';

abstract class UserMainViewModel extends State<UserMainView> {
  NavigationService nav = NavigationService();
  DataService dataService = DataService();
  List<Job> advertList = [];
  List<Widget> widgetOptions = List.filled(4, const SizedBox());
  @override
  void initState() {
    getAdverts();

    super.initState();
  }

  Future<void> getAdverts() async {
    Future(() => nav.showLoading());
    var response = await dataService.fetchData(ApiUri.getAdvertActive);
    if (response == null) {
      Future(() => nav.hideLoading());
      return;
    }
    Iterable data = response["data"];
    setState(() {
      advertList = data.map((e) => Job.fromJson(e)).toList();
      widgetOptions[0] = const UserHomeView();
      widgetOptions[1] = UserAdvertListView(adverts: advertList);

      widgetOptions[2] = const UserCVView();
      widgetOptions[3] = const UserAccess();
    });

    Future(() => nav.hideLoading());
  }
}
