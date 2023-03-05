import 'package:flutter/material.dart';
import 'package:hrapp/feature/company/company_create_advert/company_create_advert_view.dart';
import 'package:hrapp/product/data/company_repo/advert_repo.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';

import '../../../product/models/worker_model/worker_model.dart';
import '../../../product/service/api.dart';

import '../../../product/service/data_service.dart';
import '../company_profile/company_profile_view.dart';
import '../saved_advert/saved_advert_view.dart';
import 'company_main_view.dart';

abstract class CopmanyMainViewModel extends State<CompanyMainView> with TickerProviderStateMixin {
  @override
  void initState() {
    getWorkers();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void navigateProfile() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CompanyProfileView(),
    ));
  }

  void navigateSavedAdvert() async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SavedAdvertView(),
    ));

    setState(() {});
  }

  void navigateCreateAdvert() async {
    status = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CompanyCreateJobView(advertRepo: jobList),
    ));

    if (status) {
      setState(() {});
    }
  }

  bool status = false;
  final Map bottomBar = {
    StringData.homePage: MyIcons.home,
    StringData.myAdvertisement: MyIcons.listAlt,
  };

  final AdvertRepo jobList = AdvertRepo();
  late TabController tabController;
  void getWorkers() async {
    Future(() {
      nav.showLoading(context);
    });

    futureWorker = await dt.fetchData(ApiUri.workerApi);
    setState(() {
      if (futureWorker != null) {
        workers = futureWorker!.map((e) => Worker.fromJson(e)).toList();
      } else {
        dontReachApi = StringData.connectionError;
      }
    });

    Future(() {
      nav.hideLoading(context);
    });
  }

  String? dontReachApi;
  Iterable? futureWorker;
  List<Worker>? workers;
  DataService dt = DataService();
  NavigationService nav = NavigationService();
}
