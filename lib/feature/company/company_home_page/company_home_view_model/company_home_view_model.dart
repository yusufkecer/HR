import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import '../../../../product/constant/icons.dart';
import '../../../../product/constant/string_data.dart';
import '../company_home_view/company_home_view.dart';
import 'package:hrapp/product/data/company_repo/company_repo.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';

abstract class CompanyHomeViewModel extends State<CompanyHomeView> {
  final CompanyRepo companyRepo = CompanyRepo();
  final Map bottomBar = {
    StringData.homePage: MyIcons.home,
    StringData.postings: MyIcons.listAlt,
  };
  double aspectRatio = 1;
  bool gridView = false;
  NavigationService nav = NavigationService();
  int cardCount = 4;

  List<Company> jobInfo = CompanyRepo().companys.toList();
}
