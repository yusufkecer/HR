import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';

import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/button/icon_button.dart';
import 'package:hrapp/product/widgets/nav_bar.dart';
import 'package:hrapp/product/widgets/profile_list.dart';
import 'package:hrapp/product/widgets/text_field/search_field.dart';

import 'company_home_view_model.dart';

class CompanyHomeView extends StatefulWidget {
  const CompanyHomeView({super.key});

  @override
  State<CompanyHomeView> createState() => _CompanyHomeViewState();
}

class _CompanyHomeViewState extends CompanyHomeViewModel {
  late TabController tabController;
  @override
  void initState() {
    getWorkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20, 15, 15),
              child: SearchField(),
            ),
            topJobTitle(),
            topJobs(),
            companyWorkerTitle(),
            companyWorkers(),
          ],
        ),
      ),
    );
  }

  Padding topJobTitle() {
    return Padding(
      padding: const ProjectPadding.allEight().copyWith(bottom: 0),
      child: const Align(
        alignment: Alignment.topLeft,
        child: Text(
          StringData.popularJobs,
          textScaleFactor: ProjectFontSize.oneToThree,
          style: TextStyle(
            fontWeight: Weight.midium,
          ),
        ),
      ),
    );
  }

  SizedBox topJobs() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cardCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.allEight(),
            child: Container(
              width: 280,
              decoration: const BoxDecoration(
                borderRadius: ProjectBorders.mediumAll(),
                color: MyColor.tints,
              ),
              child: Stack(
                children: [
                  saveJobButton(index),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          jobImage(index),
                          jobTitle(index),
                        ],
                      ),
                      skills(index),
                      jobWage(index)
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Align saveJobButton(index) {
    return Align(
      alignment: Alignment.topRight,
      child: ChangeIconButton(
        buttonIcon: MyIcons.a1,
        changeIcon: MyIcons.a2,
        buttonTooltip: StringData.save,
        pressButton: () {
          saveJob(index);
        },
        change: companyRepo.companys[index].jobs?.isSaveJob,
      ),
    );
  }

  Padding jobImage(int index) {
    return Padding(
      padding: const ProjectPadding.allEightTeen(),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              jobInfo[index].companyImage ?? "",
            ),
          ),
          borderRadius: const ProjectBorders.smallAll(),
          color: Colors.transparent,
        ),
      ),
    );
  }

  Text jobTitle(int index) {
    return Text(
      jobInfo[index].jobs?.jobTitle ?? "-",
      textScaleFactor: ProjectFontSize.oneToTwo,
      style: const TextStyle(
        fontWeight: Weight.midium,
      ),
    );
  }

  SizedBox skills(parentIndex) {
    return SizedBox(
      height: 39,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: jobInfo[parentIndex].jobs!.skills!.length > 3 ? 3 : jobInfo[parentIndex].jobs!.skills!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.allEight().copyWith(
              left: index == 0 ? 18 : 0,
              top: 0,
            ),
            child: Container(
              padding: const ProjectPadding.allEight(),
              decoration: const BoxDecoration(
                borderRadius: ProjectBorders.verySmallAll(),
                color: MyColor.white,
              ),
              child: Text(
                jobInfo[parentIndex].jobs!.skills![index],
                textScaleFactor: ProjectFontSize.zeroToNine,
              ),
            ),
          );
        },
      ),
    );
  }

  Padding jobWage(int index) {
    return Padding(
      padding: const ProjectPadding.allEight().copyWith(left: 18),
      child: Text(
        "₺ ${jobInfo[index].jobs?.wage?.toDouble().toStringAsFixed(3) ?? "-"}/Ay",
        style: const TextStyle(fontWeight: Weight.midium),
      ),
    );
  }

  Row companyWorkerTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: ProjectPadding.allEight(),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringData.companyWorker,
              textScaleFactor: ProjectFontSize.oneToThree,
              style: TextStyle(
                fontWeight: Weight.midium,
              ),
            ),
          ),
        ),
        ChangeIconButton(
          buttonIcon: MyIcons.grid,
          changeIcon: MyIcons.list,
          buttonTooltip: StringData.changeView,
          change: gridView,
          pressButton: changeWorkerList,
        )
      ],
    );
  }

  Padding companyWorkers() {
    //TODO:Düzenlenecek
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: GridView.builder(
        padding: const ProjectPadding.bottomTwentySix(),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: gridView ? aspectRatio : aspectRatio * 1.5,
          crossAxisCount: gridView ? 2 : 1,
        ),
        itemCount: workers != null ? workers!.length : 0,
        itemBuilder: (context, index) {
          return ProfileList(
            gridIndex: index,
            workerList: workers,
            itemCount: gridView,
          );
        },
      ),
    );
  }
}
//170 250