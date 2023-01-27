import 'package:flutter/material.dart';

import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import 'company_create_advert_view.dart';

abstract class CompanyCreateJobViewModel extends State<CompanyCreateJobView> {
  List jobQualities = [
    [StringData.jobPosition, MyIcons.position, ""],
    [StringData.skills, MyIcons.skill, StringData.skillsHint],
    [StringData.timing, MyIcons.timinig, ""],
    [StringData.level, MyIcons.level, ""],
    [StringData.wage, MyIcons.wage, StringData.salaryRange]
  ];
  // StringData.wage,
  // StringData.salaryRange,
  // StringData.currencyUnit,
  // StringData.description,
  // StringData.province,
  int listIndex = 0;
  double textFieldWidth = 300;
  List<TextEditingController> textController = [];
}
