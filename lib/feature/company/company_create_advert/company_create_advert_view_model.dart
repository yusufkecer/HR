import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/data/auth.dart';
import 'package:hrapp/product/service/api.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/models/general_company_model.dart';
import '../../../product/service/data_service.dart';
import 'company_create_advert_view.dart';

abstract class CompanyCreateJobViewModel extends State<CompanyCreateJobView> {
  @override
  void initState() {
    getProvince();
    controllerSettings();
    super.initState();
  }

  bool? isActive;
  List<TextEditingController> textController = [];
  Job? updateJob;
  String? jobTitle;
  int? positionOpen;
  String? timing;
  String? level;
  String? description;
  String? currencyValue;
  List<String> skills = [];
  List? val;
  List? wage = [];
  String? date;
  String? createValue;
  String? provinceValue;
  bool? check = false;
  DateTime? selectedDate;
  String? newDateString;
  bool isChange = false;
  void getDate() async {
    if (updateJob?.deadline != null && isChange == false) {
      List<String> parse = updateJob!.deadline.toString().split(' ')[0].split("-");
      newDateString = "${parse[0]}-${parse[1]}-${parse[2]} 00:00:00.00";
      selectedDate = DateTime.parse(newDateString!);
      isChange = true;
    }
    nav.closeKeyboard();
    selectedDate = await nav.showDate(context, selectedDate);
    if (selectedDate != null) {
      saveDate(textController[6]);
    }
  }

  void createDate() async {
    nav.closeKeyboard();
    selectedDate = await nav.showDate(context, selectedDate);
    if (selectedDate != null) {
      saveDate(textController[7]);
    }
  }

  void saveDate(TextEditingController textController) {
    if (selectedDate != null) {
      textController.text = ("${selectedDate!.year}-"
          "${selectedDate!.month > 9 ? selectedDate!.month : "0${selectedDate!.month}"}-"
          "${selectedDate!.day > 9 ? selectedDate!.day : "0${selectedDate!.day}"}");
    }
  }

  initController() {
    jobTitle = textController[0].text;
    timing = textController[2].text;
    level = textController[3].text;
    positionOpen = int.parse(textController[4].text);
    val = textController[1].text.isNotEmpty ? textController[1].text.replaceAll(" ", "").split(",") : null;
    wage = textController[5].text.isNotEmpty ? textController[5].text.split("-") : null;
    date = textController[6].text;
    description = textController[8].text.isNotEmpty ? textController[8].text : null;
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
    [StringData.applicationDate, MyIcons.date, ""],
    [StringData.createDate, MyIcons.update, ""],
    [StringData.description],
  ];
  Future<void> getProvince() async {
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

  Future<void> controllerSettings() async {
    for (var i = 0; i < jobQualities.length; i++) {
      textController.add(TextEditingController());
    }
    updateJob = widget.updateJob;

    if (updateJob?.jobTitle != null &&
        updateJob?.description != null &&
        updateJob?.skills != null &&
        updateJob?.timing != null &&
        updateJob?.level != null &&
        updateJob?.positionOpen != null &&
        updateJob?.deadline != null) {
      textController[0].text = updateJob!.jobTitle!;
      textController[1].text = updateJob!.skills!.join(",");
      textController[2].text = updateJob!.timing!;
      textController[3].text = updateJob!.level!;
      textController[4].text = updateJob!.positionOpen.toString();
      textController[6].text = updateJob!.deadline!.toString().split(" ")[0];
      // textController[7].text = updateJob!.description!;
      textController[8].text = updateJob!.description!;
      currencyValue = updateJob?.currency;
      provinceValue = updateJob?.province;
      isActive = updateJob!.isActive!;
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

  void visibility() {
    isActive = !isActive!;

    setState(() {});
  }

  void saveAdvert() async {
    nav.closeKeyboard();

    initController();
    if (jobTitle == "" ||
        val == null ||
        level == "" ||
        timing == "" ||
        positionOpen == null ||
        description == null ||
        date == "") {
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
    if (description != null) {
      if (description!.length < 20) {
        nav.alertWithButon(
            StringData.error, "${StringData.errorDescription} Siz ${description!.length} karakter girdiniz.");
        return;
      }
    }
    check = await nav.checkDialog(StringData.checkTitle, StringData.checkCreate);

    if (check ?? false) {
      // ignore: prefer_typing_uninitialized_variables
      var res;

      if (widget.updateJob == null) {
        Job data = Job(
          companyId: Auth.instance.getId,
          isActive: isActive,
          title: jobTitle,
          jobTitle: jobTitle,
          date: date,
          skills: skills,
          lowerWage: wage?[0] != null ? int.parse(wage?[0]) : null,
          upperWage: wage != null
              ? wage!.length >= 2
                  ? int.parse(wage?[1])
                  : null
              : null,
          timing: timing,
          positionOpen: positionOpen,
          currency: currencyValue,
          level: level,
          province: provinceValue,
          description: description,
        );
        final json = jsonEncode(data.toJson());
        Future(() => nav.showLoading(context));
        res = await DataService().post(ApiUri.postAdvert, json);
        // ignore: use_build_context_synchronously
        nav.hideLoading(context);
      } else {
        Job data = Job(
          id: widget.updateJob!.id,
          jobPositionId: widget.updateJob!.jobPositionId,
          isActive: isActive,
          title: jobTitle,
          jobTitle: jobTitle,
          date: date,
          skills: skills,
          lowerWage: wage?[0] != null ? int.parse(wage?[0]) : null,
          upperWage: wage != null
              ? wage!.length >= 2
                  ? int.parse(wage?[1])
                  : null
              : null,
          timing: timing,
          positionOpen: positionOpen,
          currency: currencyValue,
          level: level,
          province: provinceValue,
          description: description,
        );
        final json = jsonEncode(data.toJson());
        Future(() => nav.showLoading(context));

        res = await DataService().upteAdvert(ApiUri.updateAdvert, json);
        // ignore: use_build_context_synchronously
        nav.hideLoading(context);
      }

      if (res == null) {
        nav.alertWithButon(
          StringData.notSaved,
          StringData.advertNotSaved,
          StringData.ok,
        );
        return;
      }
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
