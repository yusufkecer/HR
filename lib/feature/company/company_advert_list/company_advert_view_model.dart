import 'package:flutter/material.dart';
import 'package:hrapp/core/enum/advert_filter.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/service/data_service.dart';

import '../../../core/filter/filter.dart';
import '../../../product/models/general_company_model.dart';
import '../../../product/service/api.dart';
import '../company_create_advert/company_create_advert_view.dart';
import 'company_advert_view.dart';

abstract class CompanyAdvertViewModel extends State<CompanyAdvertView> {
  Filter filters = Filter.instance;
  DataService dt = DataService();
  NavigationService nav = NavigationService();
  @override
  void initState() {
    super.initState();
  }

  bool verticalDivider = true;

  void updateAdvert(int index, List<Job> advert) async {
    Future(() async {
      bool check = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CompanyCreateJobView(
            updateJob: advert[index],
            index: index,
          ),
        ),
      );

      if (check == true) {
        // getAllAdvert();
        // getActiveAdvert();
        // getPassiveAdvert();
        check = false;
      }
    });
  }

  // Future<void> getAllAdvert() async {
  //   var response = await dt.fetchData(ApiUri.getAdvertAll);
  //   Iterable data = response["data"];
  //   List<Job> jobs = data.map((json) => Job.fromJson(json)).toList();
  //   print(jobs.first.id);
  //   setState(() {
  //     widget.adverts = jobs;
  //   });
  // }

  // Future<void> getActiveAdvert() async {
  //   var response = await dt.fetchData(ApiUri.getAdvertActive);
  //   Iterable data = response["data"];
  //   List<Job> jobs = data.map((json) => Job.fromJson(json)).toList();
  //   setState(() {
  //     widget.activeAdverts = jobs;
  //   });
  // }

  // Future<void> getPassiveAdvert() async {
  //   var response = await dt.fetchData(ApiUri.getAdvertPassive);
  //   Iterable data = response["data"];
  //   List<Job> jobs = data.map((json) => Job.fromJson(json)).toList();
  //   setState(() {
  //     widget.passiveAdverts = jobs;
  //   });
  // }

  void deleteAdvert(int index) async {
    setState(() {});
  }
}
