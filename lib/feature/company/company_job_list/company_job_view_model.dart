import 'package:flutter/material.dart';
import 'company_job_view.dart';

abstract class CompanyJobViewModel extends State<CompanyJobView> {
  @override
  void initState() {
    Future(() {});
    setState(() {});
    super.initState();
  }

  bool verticalDivider = true;
  void deleteJob(int index) async {
    setState(() {
      widget.advertRepo!.delete(index);
    });
  }

  void updateJob(index) {
    String value = "YUSUF";
    String value2 = "";
    for (var i = 0; i < value.length; i++) {
      if (i == 0) {
        value2 = value[i];
        continue;
      }
      value2 += value[i].toLowerCase();
    }
    print(value2);
  }
}
