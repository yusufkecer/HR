import 'package:flutter/material.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/data/company_repo/company_repo.dart';
import '../../../product/models/worker_model/worker_model.dart';
import '../../../product/service/worker_service.dart';
import 'company_main_view.dart';

abstract class CopmanyMainViewModel extends State<CompanyMainView> {
  final Map bottomBar = {
    StringData.homePage: MyIcons.home,
    StringData.myAdvertisement: MyIcons.listAlt,
  };
  final CompanyRepo companyRepo = CompanyRepo();
  late TabController tabController;
  getWorkers() async {
    Future(() {
      nav.showLoading(context);
    });

    futureWorker = await dt.fetchData();
    setState(() {
      workers = futureWorker!.map((e) => Worker.fromJson(e)).toList();
    });

    Future(
      () {
        nav.hideLoading(context);
      },
    );
  }

  Iterable? futureWorker;
  List<Worker>? workers;
  DataService dt = DataService();
  NavigationService nav = NavigationService();
}
