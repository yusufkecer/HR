import 'package:flutter/material.dart';
import 'package:hrapp/product/models/general_company_model.dart';
import 'company_advert_detail_view.dart';

abstract class CompanyAdvertDetailViewModel extends State<CompanyAdvertDetailView> {
  Job? advertList;
  String? date;
  @override
  void initState() {
    advertList = widget.adverts;
    if (advertList?.deadline != null) {
      List val = advertList!.deadline!.toString().split(" ")[0].split("-");
      date = val[2] + "/" + val[1] + "/" + val[0];
    }

    super.initState();
  }
}
