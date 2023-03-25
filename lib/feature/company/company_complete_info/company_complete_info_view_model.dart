import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/service/data_service.dart';

import 'company_complete_info_view.dart';

abstract class CompaynCompleteInfoViewModel extends State<CompaynCompleteInfoView> {
  TextEditingController departmentController = TextEditingController();
  DataService dt = DataService();
  Map<String, String>? department;
  NavigationService nav = NavigationService();
  List<String>? sectorList;
  String? totalEmployee;
}
