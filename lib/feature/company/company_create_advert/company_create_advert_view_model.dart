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
  String? positionOpen;
  String? timing;
  String? level;
  String? description;
  String? currencyValue;
  List skills = [];
  List? val;
  List? wage = [];
  String? provinceValue;
  bool? check = false;
  initController() {
    jobTitle = textController[0].text;
    timing = textController[2].text;
    level = textController[3].text;
    positionOpen = textController[4].text;
    val = textController[1].text.isNotEmpty ? textController[1].text.replaceAll(" ", "").split(",") : null;
    wage = textController[5].text.isNotEmpty ? textController[5].text.split("-") : null;

    description = textController[6].text.isNotEmpty ? textController[6].text : null;
    provinceValue = provinceValue;
    if (val != null) {
      skills = [];
      for (var i = 0; i < val!.length; i++) {
        if (val![i] != "") {
          skills.add(val![i]);
        }
      }
    }
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
    [StringData.positionOpen, MyIcons.number, ""],
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
    updateJob = widget.updateJob;

    if (updateJob?.jobTitle != null &&
        updateJob?.description != null &&
        updateJob?.skills != null &&
        updateJob?.timing != null &&
        updateJob?.level != null &&
        updateJob?.positionOpen != null) {
      updateJob = widget.updateJob;

      textController[0].text = updateJob!.jobTitle!;
      textController[1].text = updateJob!.skills!.join(",");
      textController[2].text = updateJob!.timing!;
      textController[3].text = updateJob!.level!;
      textController[4].text = updateJob!.positionOpen!;
      textController[6].text = updateJob!.description!;
      currencyValue = updateJob?.currency;
      provinceValue = updateJob?.province;
      String result = "";
      if (updateJob?.upperWage != null && updateJob?.upperWage != null) {
        result = "${updateJob?.lowerWage?.toStringAsFixed(0)}-${updateJob?.upperWage?.toStringAsFixed(0)}";
      } else {
        result += updateJob?.upperWage?.toStringAsFixed(0) ?? "";
        result += updateJob?.lowerWage?.toStringAsFixed(0) ?? "";
      }
      textController[5].text = result;
    }
  }

  saveAdvert() async {
    FocusScope.of(context).requestFocus(FocusNode());

    initController();
    if (jobTitle == "" || val == null || level == "" || timing == "" || positionOpen == "" || description == null) {
      nav.alertWithButon(StringData.missing, StringData.missingText);
      return;
    }
    if (wage != null) {
      if (wage!.length > 1) {
        if (double.parse(wage![0]) > double.parse(wage![1])) {
          nav.alertWithButon(StringData.error, StringData.errorWage);
          return;
        }
      }
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
          upperWage: wage != null
              ? wage!.length >= 2
                  ? double.parse(wage?[1])
                  : null
              : null,
          timing: timing,
          positionOpen: positionOpen,
          currency: currencyValue,
          level: level,
          province: provinceValue,
          description: description,
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
