import 'package:flutter/material.dart';
import 'package:hrapp/core/mixin/check_mixin.dart';
import 'company_home_view.dart';
import 'package:hrapp/product/data/company_repo/advert_repo.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';

abstract class CompanyHomeViewModel extends State<CompanyHomeView> with CheckMixin {
  void saveJob(int index) async {
    setState(() {
      AdvertRepo.instance.saveJob(index);
    });
  }

  double aspectRatio = 1;
  int cardCount = 4;
  List<Company> jobInfo = AdvertRepo.instance.adverts.toList();
}
