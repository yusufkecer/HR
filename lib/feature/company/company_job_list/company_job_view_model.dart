import 'package:flutter/material.dart';
import 'company_job_view.dart';

abstract class CompanyJobViewModel extends State<CompanyJobView> {
  bool isSelectedPopup = false;
  void deleteJob(int index) async {
    setState(() {
      widget.advertRepo!.delete(index);
    });
  }

  void updateJob(index) {
    print("güncelleme butonuna tıklandı");
  }
}
