import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/service/worker_service.dart';
import '../../../../product/constant/icons.dart';
import '../../../../product/constant/string_data.dart';
import '../../../../product/models/worker_model/worker_model.dart';
import '../company_home_view/company_home_view.dart';
import 'package:hrapp/product/data/company_repo/company_repo.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';

abstract class CompanyHomeViewModel extends State<CompanyHomeView> {
  final CompanyRepo companyRepo = CompanyRepo();
  final Map bottomBar = {
    StringData.homePage: MyIcons.home,
    StringData.postings: MyIcons.listAlt,
  };
  getWorkers() async {
    futureWorker = await dt.getWorkers();
    setState(() {
      workers = futureWorker!.map((e) => Worker.fromJson(e)).toList();
    });
    print(workers!.first.image);
  }

  void saveJob(int index) async {
    setState(() {
      companyRepo.saveJob(index);
    });
    // getWorkers();
  }

  void changeWorkerList() {
    setState(() {
      if (gridView) {
        gridView = false;
      } else {
        gridView = true;
      }
    });
  }

  Iterable? futureWorker;
  List<Worker>? workers;
  DataService dt = DataService();
  double aspectRatio = 1;
  bool gridView = false;
  NavigationService nav = NavigationService();
  int cardCount = 4;

  List<Company> jobInfo = CompanyRepo().companys.toList();
}
