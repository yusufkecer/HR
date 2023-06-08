import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/feature/company/company_advert_detail/company_advert_detail_view.dart';
import 'package:hrapp/feature/user/user_profile/user_profile_view.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/models/general_company_model.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';

import '../../Product/Constant/colors.dart';
import '../../product/widgets/subtitle.dart';

class UserCvDetailView extends StatefulWidget {
  final Map<String, dynamic>? cv;
  final bool isCompany;
  final Job? adverts;
  const UserCvDetailView({
    Key? key,
    this.cv,
    this.isCompany = false,
    this.adverts,
  }) : super(key: key);

  @override
  State<UserCvDetailView> createState() => _UserCvDetailViewState();
}

class _UserCvDetailViewState extends State<UserCvDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      appBar: AppBar(
        title: const AppBarLogoTitle(),
        actions: widget.isCompany
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfileView(
                          userInfo: widget.cv,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    MyIcons.user,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyAdvertDetailView(
                          adverts: widget.adverts,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    MyIcons.list,
                  ),
                ),
              ]
            : [],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const ProjectPadding.horizontalTen(),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: ProjectRadius.mediumAll(),
                color: MyColor.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(),
                  generalInfo(),
                  position(),
                  levelCV(),
                  education(),
                  projects(),
                  languages(),
                  skills(),
                  socialMedia(),
                  hobbies(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  Column generalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.createJob().copyWith(top: 0, left: 5),
          child: const Subtitle(color: MyColor.discovreyPurplishBlue, title: StringData.generalInfo),
        ),
        Padding(
          padding: const ProjectPadding.createJob().copyWith(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                "${"${StringData.name} ${StringData.surname}"}: ",
                "${widget.cv!["firstName"]} ${widget.cv!["lastName"]}",
                fontWeight: Weight.midium,
                size: 1.2,
              ),
              widget.cv?["dateOfBirth"] != null
                  ? Column(
                      children: [
                        space(),
                        textWidget(
                          "${StringData.birthOfDay}: ",
                          "${widget.cv?["dateOfBirth"].split("T")[0]}",
                          fontWeight: Weight.midium,
                          size: 1.2,
                        ),
                      ],
                    )
                  : const SizedBox(),
              space(),
              textWidget(
                "${StringData.email}: ",
                "${widget.cv?["email"]}",
                fontWeight: Weight.midium,
                size: 1.2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column position() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.createJob().copyWith(top: 0, left: 5),
          child: Subtitle(color: MyColor.discovreyPurplishBlue, title: StringData.jobPositionD.replaceAll(":", "")),
        ),
        Padding(
          padding: const ProjectPadding.createJob().copyWith(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                "${StringData.jobPositionD} ",
                "${widget.cv!["information"]}",
                fontWeight: Weight.midium,
                size: 1.2,
              ),
              space(),
            ],
          ),
        ),
      ],
    );
  }

  Column levelCV() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.createJob().copyWith(top: 0, left: 5),
          child: const Subtitle(color: MyColor.discovreyPurplishBlue, title: StringData.levelCv),
        ),
        Padding(
          padding: const ProjectPadding.createJob().copyWith(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget("Şirket Adı: ", "${widget.cv?["jobExperiences"][0]["companyName"]}",
                  fontWeight: Weight.midium),
              space(),
              textWidget("${StringData.jobPositionD} ", "${widget.cv?["jobExperiences"][0]["position"]}"),
              space(),
              textWidget("${StringData.department}: ", "${widget.cv?["jobExperiences"][0]["department"]}"),
              space(),
              textWidget("${StringData.workedYears}: ", "${widget.cv?["jobExperiences"][0]["years"]}"),
              space(),
              textWidget("${StringData.companyDescription}: ", "${widget.cv?["jobExperiences"][0]["description"]}"),
              space(),
              textWidget("${StringData.leaveWorkYear}: ", "${widget.cv?["jobExperiences"][0]["leaveWorkYear"]}")
            ],
          ),
        ),
      ],
    );
  }

  Column education() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.createJob().copyWith(top: 0, left: 5),
          child: const Subtitle(color: MyColor.discovreyPurplishBlue, title: StringData.education),
        ),
        Padding(
          padding: const ProjectPadding.createJob().copyWith(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget("${StringData.school}: ", "${widget.cv?["educations"][0]["school"]}"),
              space(),
              textWidget("${StringData.major}: ", "${widget.cv?["educations"][0]["major"]}"),
              space(),
              textWidget("${StringData.grade}: ", "${widget.cv?["educations"][0]["grade"]}"),
              space(),
              textWidget("${StringData.years}: ", "${widget.cv?["educations"][0]["years"].join()}"),
              space(),
            ],
          ),
        ),
      ],
    );
  }

  Column projects() {
    return Column(
      children: [
        Padding(
          padding: const ProjectPadding.createJob().copyWith(top: 0, left: 5),
          child: const Subtitle(color: MyColor.discovreyPurplishBlue, title: StringData.projects),
        ),
        Padding(
          padding: const ProjectPadding.createJob().copyWith(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget("${StringData.projects}: ", "${widget.cv?["projects"][0]["projectName"]}"),
              space(),
              textWidget("${StringData.projectsDescription}: ", "${widget.cv?["projects"][0]["description"]}"),
              space(),
            ],
          ),
        ),
      ],
    );
  }

  Column languages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.createJob().copyWith(top: 0, left: 5),
          child: const Subtitle(color: MyColor.discovreyPurplishBlue, title: StringData.languages),
        ),
        Padding(
          padding: const ProjectPadding.createJob().copyWith(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget("${StringData.languages}: ", "${widget.cv?["languages"][0]["languages"]}"),
              space(),
              textWidget("${StringData.languagesLevel}: ", "${widget.cv?["languages"][0]["languageLevel"]}"),
              space(),
            ],
          ),
        ),
      ],
    );
  }

  Column skills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.createJob().copyWith(top: 0, left: 5),
          child: const Subtitle(color: MyColor.discovreyPurplishBlue, title: StringData.skills),
        ),
        Padding(
          padding: const ProjectPadding.createJob().copyWith(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget("${StringData.skills}: ", '${widget.cv?["skills"][0]}'),
              space(),
            ],
          ),
        ),
      ],
    );
  }

  Column socialMedia() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.createJob().copyWith(top: 0, left: 5),
          child: const Subtitle(color: MyColor.discovreyPurplishBlue, title: StringData.socialMedia),
        ),
        Padding(
          padding: const ProjectPadding.createJob().copyWith(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget("Github: ", "${widget.cv?["socialMedias"]["github"]}"),
              space(),
              textWidget("Linkedin: ", "${widget.cv?["socialMedias"]["linkedin"]}"),
              space(),
              textWidget("Web Site: ", "${widget.cv?["socialMedias"]["webSite"]}"),
              space(),
            ],
          ),
        ),
      ],
    );
  }

  Column hobbies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.createJob().copyWith(top: 0, left: 5),
          child: const Subtitle(color: MyColor.discovreyPurplishBlue, title: StringData.hobbies),
        ),
        Padding(
          padding: const ProjectPadding.createJob().copyWith(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget("${StringData.hobbies}: ", "${widget.cv?["hobbies"]}"),
              space(),
              space(),
            ],
          ),
        ),
      ],
    );
  }
}

SizedBox space() {
  return const SizedBox(height: 8);
}

Align textWidget(String title, String text, {double? size = 1.1, FontWeight fontWeight = Weight.normal}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColor.black,
              fontSize: 16,
              fontWeight: Weight.midium,
            ),
          ),
          TextSpan(
            text: text,
            style: TextStyle(
              color: MyColor.black,
              fontSize: 16,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    ),
  );
}
