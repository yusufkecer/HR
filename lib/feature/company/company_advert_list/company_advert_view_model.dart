import 'package:flutter/material.dart';

import '../company_create_advert/company_create_advert_view.dart';
import 'company_advert_view.dart';

abstract class CompanyJobViewModel extends State<CompanyJobView> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  int filterIndex = 1;
  bool verticalDivider = true;
  void updateJob(index) async {
    Future(() async {
      bool check = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CompanyCreateJobView(
            updateJob: widget.advertRepo?.adverts[index].jobs,
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

  void filter(int index) {
    filterIndex = index;
    setState(() {});
  }

  void deleteJob(int index) async {
    setState(() {
      widget.advertRepo!.delete(index);
    });
  }
}
