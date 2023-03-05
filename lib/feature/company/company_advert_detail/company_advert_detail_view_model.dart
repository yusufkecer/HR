import 'package:flutter/material.dart';
import '../../../product/models/company_model/company_model.dart';
import 'company_advert_detail_view.dart';

abstract class CompanyAdvertDetailViewModel extends State<CompanyAdvertDetailView> {
  Company? advertList;
  @override
  void initState() {
    advertList = widget.adverts;
    super.initState();
  }
}
