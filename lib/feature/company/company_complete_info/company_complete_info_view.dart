import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/button/elevated_icon.dart';
import 'package:hrapp/product/widgets/text_field/auth_field.dart';
import '../../../product/Constant/weight.dart';
import '../../../product/models/general_company_model.dart';
import '../../../product/service/api.dart';
import '../../../product/widgets/subtitle.dart';
import 'company_complete_info_view_model.dart';

class CompaynCompleteInfoView extends StatefulWidget {
  final Job? info;
  const CompaynCompleteInfoView({
    Key? key,
    this.info,
  }) : super(key: key);

  @override
  State<CompaynCompleteInfoView> createState() => CompaynCompleteInfoViewState();
}

class CompaynCompleteInfoViewState extends CompaynCompleteInfoViewModel {
  @override
  void dispose() {
    mailController.dispose();
    nameController.dispose();
    departmentController.dispose();
    sectorController.dispose();
    totalWorkerController.dispose();
    phoneController.dispose();
    siteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nav.closeKeyboard();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarLogoTitle(),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const Subtitle(
              title: StringData.updateInfo,
            ),
            name(),
            phone(),
            mail(),
            website(),
            sector(),
            departments(),
            totalWorkers(),
            taxNumber(),
            description(),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: MyElevatedIcons(
                  onPressed: () async {
                    nav.showLoading();
                    nav.closeKeyboard();

                    if (departmentController.text == "") {
                      return;
                    }

                    List temp = departmentController.text.split(',');
                    department = [];
                    Map info = {};

                    for (String i in temp) {
                      info["name"] = i.split(":")[0];
                      info["numberOfEmployees"] = i.split(":")[1];
                      department.add(info);
                    }

                    sectorList = sectorController.text.split(",");
                    totalWorker = totalWorkerController.text;
                    companyMail = mailController.text;
                    site = siteController.text;
                    phoneNumber = phoneController.text;
                    companyName = nameController.text;

                    String json = jsonEncode(Job(
                      sector: sectorList,
                      totalWorker: totalWorker,
                      departments: department,
                      email: companyMail,
                      webSite: site,
                      companyPhone: phoneNumber,
                      companyName: companyName,
                      description: companyDescription,
                    ).companyToJson());
                    var res = await dt.upteAdvert(ApiUri.updateCompany, json);
                    nav.hideLoading();
                    try {
                      if (res["isSuccess"]) {
                        nav.alertWithButon(
                          "Başarılı",
                          res["message"],
                          StringData.ok,
                          () {
                            nav.back();
                          },
                        );
                      }
                    } catch (e) {
                      nav.alertWithButon("Hata", "Bir hata oluştu.");
                    }
                  },
                  buttonName: StringData.save,
                  icons: const Icon(MyIcons.confirm),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Padding departments() => Padding(
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

  Padding phone() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        controller: phoneController,
        listener: (p0) {
          if (p0 == null) {
            return;
          }
          phoneNumber = p0;
        },
        titlePadding: const ProjectPadding.edgeZero().copyWith(bottom: 8),
        fontWeight: Weight.midium,
        icon: const Icon(
          MyIcons.phone,
          color: MyColor.black,
        ),
        textType: TextInputType.number,
        info: StringData.phoneNumber,
      ),
    );
  }

  Padding website() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        controller: siteController,
        listener: (p0) {
          if (p0 == null) {
            return;
          }
          site = p0;
        },
        titlePadding: const ProjectPadding.edgeZero().copyWith(bottom: 8),
        fontWeight: Weight.midium,
        icon: const Icon(
          MyIcons.website,
          color: MyColor.black,
        ),
        textType: TextInputType.url,
        info: StringData.webSite,
      ),
    );
  }

  Padding mail() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        controller: mailController,
        listener: (p0) {
          if (p0 == null) {
            return;
          }
          companyMail = p0;
        },
        titlePadding: const ProjectPadding.edgeZero().copyWith(bottom: 8),
        fontWeight: Weight.midium,
        icon: const Icon(
          MyIcons.mail,
          color: MyColor.black,
        ),
        textType: TextInputType.emailAddress,
        info: StringData.email,
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        controller: nameController,
        listener: (p0) {
          if (p0 == null) {
            return;
          }
          companyName = p0;
        },
        titlePadding: const ProjectPadding.edgeZero().copyWith(bottom: 8),
        fontWeight: Weight.midium,
        icon: const Icon(
          MyIcons.company,
          color: MyColor.black,
        ),
        textType: TextInputType.text,
        info: StringData.companyName,
      ),
    );
  }

  Padding sector() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        controller: sectorController,
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
          MyIcons.list,
          color: MyColor.black,
        ),
        textType: TextInputType.text,
        info: StringData.sector,
      ),
    );
  }

  Padding totalWorkers() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        controller: totalWorkerController,
        listener: (p0) {
          if (p0 == null) {
            return;
          }
          totalWorker = p0;
        },
        titlePadding: const ProjectPadding.edgeZero().copyWith(bottom: 8),
        fontWeight: Weight.midium,
        icon: const Icon(
          MyIcons.number,
          color: MyColor.black,
        ),
        textType: TextInputType.number,
        info: StringData.totalWorkers,
      ),
    );
  }

  Padding taxNumber() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        controller: taxController,
        textType: TextInputType.number,
        listener: (value) {
          tax = value;
          return;
        },
        validation: (value) {
          if (value?.length == 10) {
            return null;
          }
          return StringData.writeTax;
        },
        titlePadding: const ProjectPadding.textFieldTitle(),
        icon: const Icon(
          MyIcons.list,
          color: MyColor.black,
        ),
        fontWeight: Weight.midium,
        info: StringData.taxNumber,
      ),
    );
  }

  Padding description() {
    return Padding(
      padding: const ProjectPadding.topTen().copyWith(left: 15, right: 15, top: 15),
      child: AuthField(
        controller: descriptionController,
        textType: TextInputType.text,
        listener: (value) {
          companyDescription = value;
          return;
        },
        validation: (value) {
          if (value!.length < 30) {
            return null;
          }
          return StringData.writeDescription;
        },
        titlePadding: const ProjectPadding.textFieldTitle(),
        icon: const Icon(
          MyIcons.alert,
          color: MyColor.black,
        ),
        fontWeight: Weight.midium,
        info: StringData.description.substring(0, StringData.description.length - 1),
      ),
    );
  }
}
