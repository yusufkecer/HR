import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/service/api.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/service/get_data.dart';
import 'company_create_advert_view.dart';

abstract class CompanyCreateJobViewModel extends State<CompanyCreateJobView> {
  @override
  void initState() {
    getProvince();
    // ignore: avoid_function_literals_in_foreach_calls
    jobQualities.forEach((element) {
      textController.add(TextEditingController());
    });
    super.initState();
  }

  List<TextEditingController> textController = [];

  String? jobTitle;
  String? timing;
  String? level;
  String? currencyValue;
  List? skills;
  List? upperAndLowerWage;
  String? provinceValue;
  initController() {
    jobTitle = textController[0].text;
    timing = textController[2].text;
    level = textController[3].text;
    currencyValue = currencyItem;
    skills = textController[1].text.isNotEmpty ? textController[1].text.split(",") : null;

    upperAndLowerWage = textController[4].text.isNotEmpty ? textController[4].text.split("-") : null;
    provinceValue = provinceItem;
  }

  bool isAddJob = false;
  String? provinceItem;
  String? currencyItem;
  FocusNode focusNode = FocusNode();
  DataService service = DataService();
  double textFieldWidth = 300;
  Map? province;
  Map? currency = {"€": "EUR", "₺": "TL", "\$": "DLR"};

  List jobQualities = [
    [StringData.jobPosition, MyIcons.position, ""],
    [StringData.skills, MyIcons.skill, StringData.skillsHint],
    [StringData.timing, MyIcons.timinig, ""],
    [StringData.level, MyIcons.level, ""],
    [StringData.wage, MyIcons.wage, StringData.salaryRange],
    [StringData.description],
  ];
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
