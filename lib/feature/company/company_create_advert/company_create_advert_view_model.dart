import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/service/api.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/models/company_model/company_model.dart';
import '../../../product/models/job_model/job_model.dart';
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
  List skills = [];
  List? val;
  List? upperAndLowerWage;
  String? provinceValue;
  initController() {
    jobTitle = textController[0].text;
    timing = textController[2].text;
    level = textController[3].text;

    val = textController[1].text.isNotEmpty ? textController[1].text.replaceAll(" ", "").split(",") : null;
    if (val != null) {
      for (var i = 0; i < val!.length; i++) {
        if (val![i] != "") {
          skills.add(val![i]);
        }
      }
    }

    upperAndLowerWage = textController[4].text.isNotEmpty ? textController[4].text.split("-") : null;
    provinceValue = provinceValue;
  }

  bool isAddJob = false;
  Map? province;
  FocusNode focusNode = FocusNode();
  DataService service = DataService();
  double textFieldWidth = 300;

  Map? currency = {"TL": "₺", "EUR": "€", "DLR": "\$"};
  NavigationService nav = NavigationService();

  List jobQualities = [
    [StringData.jobPosition, MyIcons.position, ""],
    [StringData.skills, MyIcons.skill, StringData.skillsHint],
    [StringData.timing, MyIcons.timinig, ""],
    [StringData.level, MyIcons.level, ""],
    [StringData.wage, MyIcons.wage, StringData.salaryRange],
    [StringData.description],
  ];
  getProvince() async {
    Map? province;
    Future(() {
      NavigationService().showLoading(context);
    });

    province = await service.fetchData(ApiUri.provinceApi);

    this.province = province?.map((key, val) => MapEntry(val, val));
    if (this.province != null) {
      for (String element in this.province!.values) {
        for (var i = 0; i < element.length; i++) {
          if (i == 0) {
            this.province![element] = element[i];
            continue;
          }
          this.province![element] += element[i].toLowerCase();
        }
      }
    }

    Future(() {
      NavigationService().hideLoading(context);
    });
    setState(() {});
  }

  saveAdvert() async {
    initController();
    if (jobTitle == "" || val == null || level == "" || timing == "") {
      nav.alert(
        context,
        StringData.missing,
        StringData.missingText,
      );
      return;
    }
    bool? check = false;

    check = await nav.checkDialog(context, StringData.checkTitle, StringData.checkText);
    if (check ?? false) {
      var data = Company(
        companyName: "PAÜ",
        sector: "Yazılım",
        jobs: Jobs(
          isSaveJob: false,
          jobTitle: jobTitle,
          skills: skills,
          lowerWage: upperAndLowerWage?[0] != null ? double.parse(upperAndLowerWage?[0]) : null,
          upperWage: upperAndLowerWage?[1] != null ? double.parse(upperAndLowerWage?[1]) : null,
          timing: timing,
          currency: currencyValue,
          level: level,
          province: provinceValue,
        ),
      );
      setState(() {
        widget.advertRepo?.adverts.add(data);
      });
    }
  }
}
