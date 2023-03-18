import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/constant/string_data.dart';
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
          ),
        ),
      );

      if (check == true) {
        Future(() => nav.showLoading(context));
        await widget.updateList!();
        setState(() {});
        check = false;
        Future(() => nav.hideLoading(context));
      }
    });
  }

  void deleteAdvert(int index, List<Job>? advert) async {
    nav.checkDialog(StringData.checkTitle, StringData.checkDelete);
    if (advert == null) {
      return;
    }
    Future(() => nav.showLoading(context));

    Job data = advert[index];
    String json = jsonEncode(data);
    var response = await dt.delete(ApiUri.deleteAdvert, advert[index].id!, json);

    if (response["isSuccess"]) {
      // await updateList();
    }

    Future(() => nav.hideLoading(context));
  }
}
