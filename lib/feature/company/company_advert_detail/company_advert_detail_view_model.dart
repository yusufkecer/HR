import 'package:flutter/material.dart';
import 'package:hrapp/product/models/general_company_model.dart';
import 'company_advert_detail_view.dart';

abstract class CompanyAdvertDetailViewModel extends State<CompanyAdvertDetailView> {
  Job? advertList;
  @override
  void initState() {
    advertList = widget.adverts;
    super.initState();
  }
}
