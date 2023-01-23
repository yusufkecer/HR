import 'package:flutter/material.dart';
import 'package:hrapp/core/mixin/check_mixin.dart';
import 'company_home_view.dart';
import 'package:hrapp/product/data/company_repo/company_repo.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';

abstract class CompanyHomeViewModel extends State<CompanyHomeView> with CheckMixin {
  void saveJob(int index) async {
    setState(() {
      CompanyRepo.instance.saveJob(index);
    });
    // getWorkers();
  }

  double aspectRatio = 1;
  int cardCount = 4;
  List<Company> jobInfo = CompanyRepo.instance.companys.toList();
}
