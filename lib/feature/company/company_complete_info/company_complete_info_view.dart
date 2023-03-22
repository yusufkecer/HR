import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/service/api.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/button/elevated_icon.dart';
import 'package:hrapp/product/widgets/text_field/auth_field.dart';
import '../../../product/Constant/weight.dart';
import '../../../product/widgets/subtitle.dart';
import 'company_complete_info_view_model.dart';

class CompaynCompleteInfoView extends StatefulWidget {
  const CompaynCompleteInfoView({super.key});

  @override
  State<CompaynCompleteInfoView> createState() => CompaynCompleteInfoViewState();
}

class CompaynCompleteInfoViewState extends CompaynCompleteInfoViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogoTitle(),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Subtitle(
            title: StringData.updateInfo,
          ),
          sector(),
          departments(),
          totalEmployees(),
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyElevatedIcons(
                  onPressed: () async {
                    List department = [];
                    try {
                      if (departmentController.text == "") {
                        return;
                      }
                      for (var i = 0; i < departmentController.text.split(',').length; i++) {
                        Map<String, String>? departmentMap = {
                          for (var item in departmentController.text.split(',')) item.split(':')[0]: item.split(':')[1]
                        };
                        department.add(departmentMap);
                      }

                      String json = jsonEncode(
                          {"sector": sectorList, "numberOfEmployees": totalEmployee, "departments": department});
                      var res = await dt.upteAdvert(ApiUri.updateCompany, json);

                      print(res);
                    } catch (e) {
                      nav.alertWithButon("Hata", "Lütfen belirtilen şekilde giriş yapınız.");
                    }
                  },
                  buttonName: StringData.save,
                  icons: const Icon(MyIcons.confirm)),
            ),
          )
        ]),
      ),
    );
  }

  Padding departments() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        controller: departmentController,
        suffixButton: IconButton(
          onPressed: () {},
          tooltip: StringData.departmentsInfo,
          icon: const Icon(
            MyIcons.alert,
            color: MyColor.black,
          ),
        ),
        titlePadding: const ProjectPadding.edgeZero().copyWith(bottom: 8),
        fontWeight: Weight.midium,
        icon: const Icon(
          MyIcons.department,
          color: MyColor.black,
        ),
        textType: TextInputType.text,
        info: StringData.departments,
      ),
    );
  }

  Padding sector() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        listener: (p0) {
          if (p0 == null) {
            return;
          }
          String val = p0;
          sectorList = val.split(",");
        },
        titlePadding: const ProjectPadding.edgeZero().copyWith(bottom: 8),
        fontWeight: Weight.midium,
        icon: const Icon(
          MyIcons.company,
          color: MyColor.black,
        ),
        textType: TextInputType.text,
        info: StringData.sector,
      ),
    );
  }

  Padding totalEmployees() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        listener: (p0) {
          if (p0 == null) {
            return;
          }
          totalEmployee = p0;
        },
        titlePadding: const ProjectPadding.edgeZero().copyWith(bottom: 8),
        fontWeight: Weight.midium,
        icon: const Icon(
          MyIcons.number,
          color: MyColor.black,
        ),
        textType: TextInputType.number,
        info: StringData.totalEmployees,
      ),
    );
  }
}
