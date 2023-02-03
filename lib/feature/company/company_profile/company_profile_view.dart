import 'package:flutter/material.dart';

import 'package:hrapp/Product/Constant/colors.dart';
import 'package:hrapp/core/Constant/radius.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/product/Constant/weight.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';
import 'package:hrapp/product/widgets/card_listtile.dart';
import 'package:hrapp/product/widgets/sub_title.dart';

import '../../../product/widgets/app_bar_logo.dart';

class CompanyProfileView extends StatefulWidget {
  const CompanyProfileView({super.key});

  @override
  State<CompanyProfileView> createState() => _CompanyProfileViewState();
}

class _CompanyProfileViewState extends State<CompanyProfileView> {
  var company = Company(
      phoneNumber: "05333333333",
      mail: "info@info.com",
      website: "www.blablabla.com",
      sector: "Yazılım Geliştirme",
      companyName: "Microsoft",
      numberWorker: "200-300");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogoTitle(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const ProjectPadding.horizontalEight(),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                profileImage(),
                nameAndInfo(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SubTitle(title: "Temel Bilgiler"),
            const SizedBox(
              height: 10,
            ),
            generalInfo(),
            const SizedBox(
              height: 10,
            ),
            const SubTitle(title: "İletişime Bilgileri"),
            const SizedBox(
              height: 15,
            ),
            contactInfo(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Padding nameAndInfo() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                company.companyName!,
                textScaleFactor: ProjectFontSize.oneToFive,
                style: const TextStyle(
                  fontWeight: Weight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${company.sector}\n${company.numberWorker} Kişi",
                textAlign: TextAlign.start,
                textScaleFactor: ProjectFontSize.oneToTwo,
                style: const TextStyle(
                  fontWeight: Weight.midium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding profileImage() {
    return Padding(
      padding: const ProjectPadding.allTen(),
      child: Align(
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: const ProjectRadius.mediumAll(),
            image: const DecorationImage(image: NetworkImage(ImagePath.temporaryImage)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container generalInfo() {
    return Container(
      decoration: const DecorationProfile(color: MyColor.tints),
      child: Padding(
        padding: const ProjectPadding.allSixteen(),
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Şirketin Tarihçesi\n\n",
                style: TextStyle(
                  color: MyColor.black,
                  fontWeight: Weight.midium,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                style: TextStyle(
                  color: MyColor.black,
                  fontSize: 16,
                ),
                text: StringData.companyInfo,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container contactInfo() {
    return Container(
      decoration: const DecorationProfile(color: MyColor.tints),
      child: Column(
        children: [
          CardAndListtile(
            iconLeading: MyIcons.mail,
            text: company.mail,
            trailing: MyIcons.edit,
            onpress: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          CardAndListtile(
            iconLeading: MyIcons.phone,
            text: company.phoneNumber,
            trailing: MyIcons.edit,
            onpress: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          CardAndListtile(
            iconLeading: MyIcons.website,
            text: company.website,
            trailing: MyIcons.edit,
            onpress: () {},
          ),
        ],
      ),
    );
  }
}

class DecorationProfile extends BoxDecoration {
  const DecorationProfile({
    Color? color,
  }) : super(
          color: color,
          borderRadius: const ProjectRadius.mediumAll(),
        );
}
