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
  num listLength = 0;
  @override
  void initState() {
    listLength = generalInfo.length +
        language.length +
        education.length +
        experiance.length +
        project.length +
        socialMedia.length;
    initController();
    super.initState();
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

  Future<void> saveAdvert() async {
    Map cv = {
      "information": textController[0].text,
      "skills": textController[1].text.split(","),
      "hobbies": textController[2].text,
      "education": [
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
          "years": textController[11].text,
          "description": textController[12].text,
          "leaveWorkYear": textController[13].text,
        }
      ],
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
      "socialMedias": {
        "github": textController[18].text,
        "linkedin": textController[19].text,
        "webSite": textController[20].text,
      },
    };

    final data = jsonEncode(cv);
    print("data-> $data");
    var res = await dataService.post("${ApiUri.loginUser}${Auth.instance.getId}", data);
    print("cv add res-> $res");
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
      "Bitiş Tarihi",
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
