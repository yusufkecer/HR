import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/user/user_main_page/user_main_view.dart';

import '../../../product/models/general_company_model.dart';
import '../../../product/service/api.dart';
import '../../../product/service/data_service.dart';
import '../user_advert_list/user_advert_list_view.dart';
import '../user_home_page/user_home_view.dart';

abstract class UserMainViewModel extends State<UserMainView> {
  NavigationService nav = NavigationService();
  DataService dataService = DataService();
  List<Job> advertList = [];
  List<Widget> widgetOptions = [
    const UserHomeView(),
    const Text(
      'CV',
    ),
    const Text(
      'Profil',
    ),
  ];
  @override
  void initState() {
    getAdverts();
    super.initState();
  }

  Future<void> getAdverts() async {
    Future(() => nav.showLoading());
    var response = await dataService.fetchData(ApiUri.getAdvertAll);
    if (response == null) {
      return;
    }
    Iterable data = response["data"];
    setState(() {
      advertList = data.map((e) => Job.fromJson(e)).toList();
      widgetOptions[1] = UserAdvertListView(adverts: advertList);
    });

    print(advertList.length);
    Future(() => nav.hideLoading());
  }
}
