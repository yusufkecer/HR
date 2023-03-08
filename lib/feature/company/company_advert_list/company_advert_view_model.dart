import 'package:flutter/material.dart';
import 'package:hrapp/core/enum/advert_filter.dart';
import '../../../product/models/company_model/company_model.dart';
import '../company_create_advert/company_create_advert_view.dart';
import 'company_advert_view.dart';

abstract class CompanyJobViewModel extends State<CompanyJobView> {
  @override
  void initState() {
    if (widget.advertRepo?.adverts != null) {
      widget.advertRepo!.filterAdvert();
    }

    super.initState();
  }

  AdvertFilterOptions filterOptions = AdvertFilterOptions.active;
  bool verticalDivider = true;

  void updateJob(index, List<Company> advertRepo) async {
    Future(() async {
      bool check = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CompanyCreateJobView(
            updateJob: advertRepo[index].jobs,
            advertRepo: widget.advertRepo,
            index: index,
          ),
        ),
      );

      if (check) {
        setState(() {});
      }
    });
  }

  void filter(AdvertFilterOptions options) {
    filterOptions = options;
    setState(() {});
  }

  void deleteAdvert(int index, a) async {
    setState(() {
      widget.advertRepo!.delete(index);
    });
  }
}
