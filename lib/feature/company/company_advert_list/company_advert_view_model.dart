import 'package:flutter/material.dart';
import 'package:hrapp/core/enum/advert_filter.dart';
import '../../../product/models/general_company_model.dart';
import '../company_create_advert/company_create_advert_view.dart';
import 'company_advert_view.dart';

abstract class CompanyAdvertViewModel extends State<CompanyJobView> {
  @override
  void initState() {
    super.initState();
  }

  AdvertFilterOptions filterOptions = AdvertFilterOptions.all;
  bool verticalDivider = true;

  void updateJob(int index, List<Job> advert) async {
    Future(() async {
      bool check = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CompanyCreateJobView(
            updateJob: advert[index],
            index: index,
          ),
        ),
      );
    });
  }

  void filter(AdvertFilterOptions options) {
    filterOptions = options;
    setState(() {});
  }

  void deleteAdvert(int index) async {
    setState(() {
      // widget.adverts!.delete(index);
    });
  }
}
