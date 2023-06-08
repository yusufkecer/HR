import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/user/user_cv/user_create_cv/user_create_cv_view.dart';
import 'package:hrapp/product/data/auth.dart';
import 'package:hrapp/product/service/api.dart';
import 'package:hrapp/product/service/data_service.dart';

import '../../../../product/constant/icons.dart';
import '../../../../product/constant/string_data.dart';

abstract class UserCreateCvViewModel extends State<UserCreateCvView> {
  NavigationService nav = NavigationService();
  DataService dataService = DataService();
  List<TextEditingController> textController = [];
  Map<String, dynamic>? cv;
  num listLength = 0;
  bool isEdit = false;
  @override
  void initState() {
    listLength = generalInfo.length +
        language.length +
        education.length +
        experiance.length +
        project.length +
        socialMedia.length;
    initController();
    Map<String, dynamic> cv = widget.cv ?? {};
    if (cv.isNotEmpty) {
      typeControl();
    }

    super.initState();
  }

  void typeControl() {
    cv = widget.cv;
    isEdit = true;
    textController[0].text = cv!["information"];
    textController[1].text = cv!["skills"].join(",");
    textController[2].text = cv!["hobbies"];
    textController[3].text = cv!["educations"][0]["school"];
    textController[4].text = cv!["educations"][0]["major"];
    textController[5].text = cv!["educations"][0]["grade"];
    textController[6].text = cv!["educations"][0]["years"].join(",");
    textController[7].text = cv!["educations"][0]["graduate"];
    textController[8].text = cv!["jobExperiences"][0]["companyName"];
    textController[9].text = cv!["jobExperiences"][0]["department"];
    textController[10].text = cv!["jobExperiences"][0]["position"];
    textController[11].text = cv!["jobExperiences"][0]["description"];
    textController[12].text = cv!["jobExperiences"][0]["years"];
    textController[13].text = cv!["jobExperiences"][0]["leaveWorkYear"];
    textController[14].text = cv!["languages"][0]["languages"];
    textController[15].text = cv!["languages"][0]["languageLevel"];
    textController[16].text = cv!["projects"][0]["projectName"];
    textController[17].text = cv!["projects"][0]["description"];
    textController[18].text = cv!["socialMedias"]["github"];
    textController[19].text = cv!["socialMedias"]["linkedin"];
    textController[20].text = cv!["socialMedias"]["webSite"];
  }

  void initController() {
    for (var i = 0; i < listLength; i++) {
      textController.add(TextEditingController());
    }
  }

  void checkCv() async {
    bool isEmpty = false;

    for (var i = 0; i < textController.length; i++) {
      if (textController[i].text == "") {
        isEmpty = true;
        break;
      }
    }
    if (isEmpty) {
      nav.alertWithButon(StringData.error, StringData.fillAllArea);
      return;
    }
    bool? check = await nav.checkDialog(StringData.checkTitle, StringData.checkCreate);

    if (check != true) {
      return;
    }
    saveCV();
  }

  Future<void> saveCV() async {
    nav.showLoading();
    Map cv = {
      "jobSeekerId": Auth.instance.getId,
      "id": widget.cv!["id"],
      "educations": [
        {
          "school": textController[3].text,
          "major": textController[4].text,
          "grade": textController[5].text,
          "years": textController[6].text.split(","),
          "graduate": textController[7].text,
        }
      ],
      "jobExperiences": [
        {
          "companyName": textController[8].text,
          "department": textController[9].text,
          "position": textController[10].text,
          "description": textController[11].text,
          "years": textController[12].text,
          "leaveWorkYear": textController[13].text,
        }
      ],
      "skills": textController[1].text.split(","),
      "languages": [
        {
          "languages": textController[14].text,
          "languageLevel": textController[15].text,
        }
      ],
      "projects": [
        {
          "projectName": textController[16].text,
          "description": textController[17].text,
        }
      ],
      "imageUrl": "asdfasdfasdfasdfdsfsdfsdf",
      "socialMedias": {
        "github": textController[18].text,
        "linkedin": textController[19].text,
        "webSite": textController[20].text,
      },
      "information": textController[0].text,
      "hobbies": textController[2].text,
    };

    final data = jsonEncode(cv);
    // ignore: prefer_typing_uninitialized_variables
    var res;
    if (isEdit == false) {
      res = await dataService.post(ApiUri.createCv, data);
    } else {
      res = await dataService.upteAdvert(ApiUri.updateCv, data);
    }
    nav.hideLoading();
    if (res is List) {
      nav.alertWithButon(StringData.error, res[0]["value"].join("").toString());
    } else {
      nav.alertWithButon(StringData.success, StringData.createdCV);
    }
  }

  List generalInfo = [
    [
      "Pozisyon",
      MyIcons.position,
    ],
    [
      "Yetenekler",
      MyIcons.skill,
    ],
    [
      "Hobiler",
      MyIcons.hobbies,
    ],
  ];

  List language = [
    [
      "Yabancı Diller",
      MyIcons.language,
    ],
    [
      "Yabancı Dil Seviyeleri",
      MyIcons.language,
    ],
  ];

  List education = [
    [
      "Eğitim",
      MyIcons.department,
    ],
    [
      "Bölüm",
      MyIcons.department,
    ],
    [
      "Düzey",
      MyIcons.department,
    ],
    [
      "Başlangıç Tarihi",
      MyIcons.department,
    ],
    [
      "Durum",
      MyIcons.department,
    ],
  ];

  List experiance = [
    [
      "Şirket İsmi",
      MyIcons.level,
    ],
    [
      "Departman",
      MyIcons.level,
    ],
    [
      "Pozisyon",
      MyIcons.level,
    ],
    [
      "Açıklama",
      MyIcons.level,
    ],
    [
      "Başlangıç Tarihi",
      MyIcons.level,
    ],
    [
      "Ayrılma Tarihi",
      MyIcons.level,
    ],
  ];

  List project = [
    [
      "Projeler",
      MyIcons.list,
    ],
    [
      "Proje Açıklaması",
      MyIcons.list,
    ],
  ];

  List socialMedia = [
    [
      "GitHub",
      MyIcons.smartPhone,
    ],
    [
      "Linkedin",
      MyIcons.smartPhone,
    ],
    [
      "Web Sitesi",
      MyIcons.smartPhone,
    ],
  ];
}
