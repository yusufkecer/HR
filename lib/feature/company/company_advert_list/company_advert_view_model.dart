import 'package:flutter/material.dart';

import 'company_advert_view.dart';

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
}
