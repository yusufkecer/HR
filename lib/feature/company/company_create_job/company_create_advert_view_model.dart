import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/service/api.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/service/get_data.dart';
import 'company_create_advert_view.dart';

abstract class CompanyCreateJobViewModel extends State<CompanyCreateJobView> {
  FocusNode focusNode = FocusNode();
  List? proviceList;
  DataService service = DataService();
  double textFieldWidth = 300;
  Map? province;
  Map? currency = {"EUR": "€", "TL": "₺", "DLR": "\$"};
  List<TextEditingController> textController = [];
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

  getProvince() async {
    Future(() {
      NavigationService().showLoading(context);
    });

    province = await service.fetchData(ApiUri.provinceApi);
    Future(() {
      NavigationService().hideLoading(context);
    });
    setState(() {});
  }
}
