import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_cv/user_create_cv/user_create_cv_view_model.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/button/elevated_icon.dart';
import 'package:hrapp/product/widgets/subtitle.dart';
import 'package:hrapp/product/widgets/text_field/custom_text_field.dart';

import '../../../../core/constant/project_padding.dart';

class UserCreateCvView extends StatefulWidget {
  const UserCreateCvView({super.key});

  @override
  State<UserCreateCvView> createState() => _UserCreateCvViewState();
}

class _UserCreateCvViewState extends UserCreateCvViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogoTitle(),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Padding(
            padding: ProjectPadding.leftFive(),
            child: Subtitle(title: StringData.createCv),
          ),
          info(),
          const Padding(
            padding: ProjectPadding.leftFive(),
            child: Subtitle(title: StringData.education),
          ),
          educations(),
          const Padding(
            padding: ProjectPadding.leftFive(),
            child: Subtitle(title: StringData.experiance),
          ),
          level(),
          const Padding(
            padding: ProjectPadding.leftFive(),
            child: Subtitle(title: StringData.languages),
          ),
          languages(),
          const Padding(
            padding: ProjectPadding.leftFive(),
            child: Subtitle(title: StringData.projects),
          ),
          projects(),
          const Padding(
            padding: ProjectPadding.leftFive(),
            child: Subtitle(title: StringData.socialMedia),
          ),
          social(),
          saveButton(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Padding saveButton() {
    return Padding(
      padding: const ProjectPadding.allTwenty().copyWith(top: 10),
      child: MyElevatedIcons(
        onPressed: checkCv,
        buttonName: StringData.save,
        icons: const Icon(MyIcons.confirm),
      ),
    );
  }

  Padding info() {
    return Padding(
      padding: const ProjectPadding.createJob().copyWith(bottom: 0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: generalInfo.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.createJob().copyWith(left: 0, right: 0),
            child: CustomTextField(
              textEditingController: textController[index],
              title: generalInfo[index][0],
              icon: generalInfo[index][1],
              maxLine: 1,
            ),
          );
        },
      ),
    );
  }

  Padding educations() {
    return Padding(
      padding: const ProjectPadding.createJob().copyWith(bottom: 0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: education.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.createJob().copyWith(left: 0, right: 0),
            child: CustomTextField(
              textEditingController: textController[index + 3],
              title: education[index][0],
              icon: education[index][1],
              maxLine: 1,
            ),
          );
        },
      ),
    );
  }

  Padding level() {
    return Padding(
      padding: const ProjectPadding.createJob().copyWith(bottom: 0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: experiance.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.createJob().copyWith(left: 0, right: 0),
            child: CustomTextField(
              textEditingController: textController[index + 8],
              title: experiance[index][0],
              icon: experiance[index][1],
              maxLine: 1,
            ),
          );
        },
      ),
    );
  }

  Padding languages() {
    return Padding(
      padding: const ProjectPadding.createJob().copyWith(bottom: 0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: language.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.createJob().copyWith(left: 0, right: 0),
            child: CustomTextField(
              textEditingController: textController[index + 14],
              title: language[index][0],
              icon: language[index][1],
              maxLine: 1,
            ),
          );
        },
      ),
    );
  }

  Padding projects() {
    return Padding(
      padding: const ProjectPadding.createJob().copyWith(bottom: 0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: project.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.createJob().copyWith(left: 0, right: 0),
            child: CustomTextField(
              textEditingController: textController[index + 16],
              title: project[index][0],
              icon: project[index][1],
              maxLine: 1,
            ),
          );
        },
      ),
    );
  }

  Padding social() {
    return Padding(
      padding: const ProjectPadding.createJob().copyWith(bottom: 0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: socialMedia.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.createJob().copyWith(left: 0, right: 0),
            child: CustomTextField(
              textEditingController: textController[index + 18],
              title: socialMedia[index][0],
              icon: socialMedia[index][1],
              maxLine: 1,
            ),
          );
        },
      ),
    );
  }
}
