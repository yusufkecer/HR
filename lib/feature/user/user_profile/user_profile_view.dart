import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/feature/user/user_profile/user_profile_view_model.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/subtitle.dart';

import '../../../Product/Constant/colors.dart';

class UserProfileView extends StatefulWidget {
  final Map<String, dynamic>? userInfo;
  const UserProfileView({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends UserProfileViewModel {
  @override
  Widget build(BuildContext context) {
    print(widget.userInfo);
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      appBar: AppBar(
        title: const AppBarLogoTitle(),
      ),
      body: Padding(
        padding: const ProjectPadding.allTen(),
        child: ListView(
          children: [
            profileInfo(),
            const SizedBox(
              height: 10,
            ),
            generalInfo(),
            const SizedBox(
              height: 10,
            ),
            experiance(),
            const SizedBox(
              height: 10,
            ),
            education(),
            const SizedBox(
              height: 10,
            ),
            language(),
            const SizedBox(
              height: 10,
            ),
            userInfo()
          ],
        ),
      ),
    );
  }

  Column userInfo() {
    return Column(
      children: [
        const Subtitle(title: StringData.socialMedia),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: const BoxDecoration(
            color: MyColor.white,
            borderRadius: ProjectRadius.smallAll(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  info(MyIcons.mail, widget.userInfo!["email"]),
                  info(SimpleIcons.github, widget.userInfo!["socialMedias"]["github"]),
                  info(SimpleIcons.linkedin, widget.userInfo!["socialMedias"]["linkedin"]),
                  info(MyIcons.website, widget.userInfo!["socialMedias"]["webSite"]),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column language() {
    return Column(
      children: [
        const Subtitle(title: StringData.languages),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.userInfo!["languages"].length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: const BoxDecoration(
                  color: MyColor.white,
                  borderRadius: ProjectRadius.smallAll(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            richTextInfo("${StringData.languages}: ",
                                widget.userInfo!["languages"][index]["languages"].toString().split(" ")[0]),
                            const SizedBox(
                              width: 5,
                            ),
                            richTextInfo("${StringData.experiances}: ",
                                widget.userInfo!["languages"][index]["languageLevel"].toString().split(" ")[0]),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Column education() {
    return Column(
      children: [
        const Subtitle(title: StringData.education),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.userInfo!["educations"].length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: const BoxDecoration(
                  color: MyColor.white,
                  borderRadius: ProjectRadius.smallAll(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: richTextInfo(StringData.school, ": ${widget.userInfo!["educations"][index]["school"]}}"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            richTextInfo("${StringData.major}:\n", widget.userInfo!["educations"][index]["major"]),
                            const SizedBox(
                              width: 5,
                            ),
                            richTextInfo("${StringData.grade}:\n", widget.userInfo!["educations"][index]["grade"]),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Column experiance() {
    return Column(
      children: [
        const Subtitle(title: "İş Deneyimleri"),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.userInfo!["jobExperiences"].length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: const BoxDecoration(
                  color: MyColor.white,
                  borderRadius: ProjectRadius.smallAll(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: richTextInfo("Şirket: ", widget.userInfo!["jobExperiences"][index]["companyName"]),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            richTextInfo(
                                "${StringData.jobPositionD}\n", widget.userInfo!["jobExperiences"][index]["position"]),
                            const SizedBox(
                              width: 5,
                            ),
                            richTextInfo(
                                "${StringData.department}:\n", widget.userInfo!["jobExperiences"][index]["department"]),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            richTextInfo(
                                "${StringData.startDate}\n", widget.userInfo!["jobExperiences"][index]["years"]),
                            richTextInfo("${StringData.leaveDate}\n",
                                widget.userInfo!["jobExperiences"][index]["leaveWorkYear"]),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        richTextInfo(
                          "${StringData.description.substring(0, StringData.description.length - 1)}: ",
                          widget.userInfo!["jobExperiences"][index]["description"],
                          TextAlign.start,
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Column generalInfo() {
    return Column(
      children: [
        const Subtitle(title: "Özet Bilgi"),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: const BoxDecoration(
            color: MyColor.white,
            borderRadius: ProjectRadius.smallAll(),
          ),
          child: Text(widget.userInfo!["information"]),
        ),
      ],
    );
  }

  Row profileInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            ImagePath.temporaryImage,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.userInfo!["firstName"] + " " + widget.userInfo!["lastName"],
              textScaleFactor: 1.7,
            ),
            Text(
              widget.userInfo!["jobExperiences"].last["companyName"],
              textScaleFactor: 1.5,
              style: const TextStyle(color: MyColor.osloGrey),
              textAlign: TextAlign.left,
            ),
          ],
        )
      ],
    );
  }

  ListTile info(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
    );
  }

  RichText richTextInfo(String title, String info, [TextAlign alignment = TextAlign.center]) {
    return RichText(
      textScaleFactor: 1.2,
      textAlign: alignment,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(fontWeight: Weight.midium, color: MyColor.black),
          ),
          TextSpan(
            text: info,
            style: const TextStyle(fontWeight: Weight.normal, color: MyColor.osloGrey),
          ),
        ],
      ),
    );
  }
}
