import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/user/user_cv/user_create_cv/user_create_cv_view.dart';
import 'package:hrapp/product/models/cv_model/cv.dart';

import '../../../../product/constant/icons.dart';
import '../../../../product/constant/string_data.dart';

abstract class UserCreateCvViewModel extends State<UserCreateCvView> {
  NavigationService nav = NavigationService();
  List<TextEditingController> textController = [];

  @override
  void initState() {
    initController();
    super.initState();
  }

  void initController() {
    for (var i = 0; i < cv.length; i++) {
      textController.add(TextEditingController());
    }
  }

  void checkCv() async {
    bool isEmpty = false;

    for (var i = 0; i < textController.length; i++) {
      if (textController[i].text == "") {
        print("i-> $i text-> ${textController[i].text}");
        isEmpty = true;
        break;
      }
    }
    if (isEmpty) {
      nav.alertWithButon(StringData.error, StringData.fillAllArea);
      return;
    }
    bool? check = await nav.checkDialog(StringData.checkTitle, StringData.checkCreate);
    print("check -> $check");
    if (check != true) {
      return;
    }
    saveAdvert();
  }

  void saveAdvert() {
    CV cv = CV(
      informations: textController[0].text,
      skills: textController[1].text.split(","),
      languages: textController[2].text.split(","),
      education: textController[3].text.split(","),
      experiance: textController[4].text.split(","),
      projects: textController[5].text.split(","),
      socialMedia: textController[6].text.split(","),
      hobbies: textController[7].text.split(","),
    );

    final data = jsonEncode(cv.toJson());
  }

  List cv = [
    [
      StringData.informations,
      MyIcons.position,
      "",
    ],
    [
      StringData.skills,
      MyIcons.skill,
      StringData.skillsHint,
    ],
    [
      StringData.languages,
      MyIcons.language,
      StringData.languagesHint,
    ],
    [
      StringData.education,
      MyIcons.department,
      StringData.educationHint,
    ],
    [
      StringData.experiance,
      MyIcons.level,
      StringData.experianceHint,
    ],
    [
      StringData.projects,
      MyIcons.list,
      StringData.projectsHint,
    ],
    [
      StringData.socialMedia,
      MyIcons.smartPhone,
      StringData.socialMediaHint,
    ],
    [
      StringData.hobbies,
      MyIcons.hobbies,
      StringData.hobbiesHint,
    ],
  ];
}
