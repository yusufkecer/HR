import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hrapp/core/mixin/check_mixin.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/service/worker_service.dart';
import '../../../product/models/worker_model/worker_model.dart';
import 'company_home_view.dart';
import 'package:hrapp/product/data/company_repo/company_repo.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';

abstract class CompanyHomeViewModel extends State<CompanyHomeView> with CheckMixin {
  final CompanyRepo companyRepo = CompanyRepo();

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

  void saveJob(int index) async {
    setState(() {
      companyRepo.saveJob(index);
    });
    // getWorkers();
  }

  Iterable? futureWorker;
  List<Worker>? workers;
  DataService dt = DataService();
  double aspectRatio = 1;
  NavigationService nav = NavigationService();
  int cardCount = 4;
  List<Company> jobInfo = CompanyRepo().companys.toList();
}
