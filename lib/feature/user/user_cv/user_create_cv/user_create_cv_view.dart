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
          const Subtitle(title: StringData.createCv),
          Padding(
            padding: const ProjectPadding.createJob(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cv.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const ProjectPadding.createJob().copyWith(left: 0, right: 0),
                  child: CustomTextField(
                    textEditingController: textController[index],
                    title: cv[index][0],
                    icon: cv[index][1],
                    hint: cv[index][2],
                    maxLine: 1,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const ProjectPadding.allTwenty().copyWith(top: 0),
            child: MyElevatedIcons(
              onPressed: checkCv,
              buttonName: StringData.save,
              icons: const Icon(MyIcons.confirm),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
