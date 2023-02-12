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
    controllerSettings();

    super.initState();
  }

  List<TextEditingController> textController = [];
  Jobs? updateJob;
  String? jobTitle;
  String? timing;
  String? level;
  String? currencyValue;
  List skills = [];
  List? val;
  List? wage;
  String? provinceValue;
  bool? check = false;
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

    wage = textController[4].text.isNotEmpty ? textController[4].text.split("-") : null;
    provinceValue = provinceValue;
  }

  Map? province;
  final FocusNode focusNode = FocusNode();
  final DataService service = DataService();
  double textFieldWidth = 300;

  final Map? currency = {"TL": "₺", "EUR": "€", "DLR": "\$"};
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

  void controllerSettings() {
    for (var i = 0; i < jobQualities.length; i++) {
      textController.add(TextEditingController());
    }

    if (widget.updateJob?.jobTitle != null) {
      updateJob = widget.updateJob;

      textController[0].text = updateJob!.jobTitle!;
      textController[1].text = updateJob!.skills!.join(",");
      textController[2].text = updateJob!.timing!;
      textController[3].text = updateJob!.level!;
      currencyValue = updateJob?.currency;
      provinceValue = updateJob?.province;
      String result = "";
      if (updateJob?.upperWage != null && updateJob?.upperWage != null) {
        result = "${updateJob?.lowerWage?.toStringAsFixed(0)}-${updateJob?.upperWage?.toStringAsFixed(0)}";
      } else {
        result += updateJob?.upperWage?.toStringAsFixed(0) ?? "";
        result += updateJob?.lowerWage?.toStringAsFixed(0) ?? "";
      }
      textController[4].text = result;
    }
  }

  saveAdvert() async {
    FocusScope.of(context).requestFocus(FocusNode());

    initController();
    if (jobTitle == "" || val == null || level == "" || timing == "") {
      nav.alertWithButon(StringData.missing, StringData.missingText, StringData.ok);
      return;
    }
    check = await nav.checkDialog(StringData.checkTitle, StringData.checkText);
    if (check ?? false) {
      var data = Company(
        companyName: "PAÜ",
        sector: "Yazılım",
        jobs: Jobs(
          isSaveJob: false,
          jobTitle: jobTitle,
          skills: skills,
          lowerWage: wage?[0] != null ? double.parse(wage?[0]) : null,
          upperWage: wage?[1] != null ? double.parse(wage?[1]) : null,
          timing: timing,
          currency: currencyValue,
          level: level,
          province: provinceValue,
        ),
      );
      if (updateJob == null) {
        widget.advertRepo?.adverts.add(data);
      } else {
        widget.advertRepo?.adverts[widget.index!].jobs?.skills = [];
        widget.advertRepo?.adverts[widget.index!] = data;
      }
      setState(() {});

      nav.alertWithButon(
        StringData.saved,
        StringData.advertSaved,
        StringData.ok,
        nav.back,
      );
    }
  }

  void popButton() {
    Navigator.pop(context);
  }
}
