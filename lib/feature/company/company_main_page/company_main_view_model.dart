import 'package:flutter/material.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/data/company_repo/company_repo.dart';
import 'company_main_view.dart';

abstract class CopmanyMainViewModel extends State<CompanyMainView> {
  final Map bottomBar = {
    StringData.homePage: MyIcons.home,
    StringData.postings: MyIcons.listAlt,
  };
  final CompanyRepo companyRepo = CompanyRepo();
  late TabController tabController;
}
