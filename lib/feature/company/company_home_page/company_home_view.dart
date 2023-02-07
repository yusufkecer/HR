import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/models/worker_model/worker_model.dart';
import 'package:hrapp/product/widgets/button/icon_button.dart';
import 'package:hrapp/product/widgets/profile_list.dart';
import 'package:hrapp/product/widgets/sub_title.dart';
import 'package:hrapp/product/widgets/text_field/search_field.dart';

import '../../../Product/Constant/colors.dart';
import '../../../product/data/company_repo/advert_repo.dart';
import 'company_home_view_model.dart';

class CompanyHomeView extends StatefulWidget {
  final List<Worker>? workers;
  final String? connectionError;
  const CompanyHomeView({
    Key? key,
    this.workers,
    required this.connectionError,
  }) : super(key: key);

  @override
  State<CompanyHomeView> createState() => _CompanyHomeViewState();
}

class _CompanyHomeViewState extends CompanyHomeViewModel {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: const ProjectPadding.horizontalFive(),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: SearchField(),
            ),
            const SubTitle(
              title: StringData.popularJobs,
            ),
            topJobs(),
            companyWorkerTitle(),
            companyWorkers(),
          ],
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
                borderRadius: ProjectRadius.mediumAll(),
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
                          jobImage(jobInfo[index]),
                          //TODO:böyle kullan
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
        buttonIcon: MyIcons.save,
        changeIcon: MyIcons.saved,
        buttonTooltip: StringData.save,
        pressButton: () {
          saveJob(index);
        },
        change: AdvertRepo.instance.adverts[index].jobs?.isSaveJob,
      ),
    );
  }

  Padding jobImage(index) {
    return Padding(
      padding: const ProjectPadding.allEightTeen(),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              index.companyImage ?? "",
            ),
          ),
          borderRadius: const ProjectRadius.smallAll(),
          color: MyColor.transparent,
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
                borderRadius: ProjectRadius.verySmallAll(),
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
        "₺ ${jobInfo[index].jobs?.lowerWage?.toDouble().toStringAsFixed(3) ?? "-"}/Ay",
        style: const TextStyle(fontWeight: Weight.midium),
      ),
    );
  }

  Row companyWorkerTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SubTitle(
          title: StringData.companyWorker,
        ),
        ChangeIconButton(
          buttonIcon: MyIcons.grid,
          changeIcon: MyIcons.list,
          buttonTooltip: StringData.changeView,
          change: check,
          pressButton: changeCheck,
        )
      ],
    );
  }

  Padding companyWorkers() {
    return Padding(
      padding: const ProjectPadding.horizontalFive(),
      child: ProfileList(
        connectionError: widget.connectionError,
        check: check,
        aspectRatio: aspectRatio,
        workerList: widget.workers,
        itemCount: check,
      ),
    );
  }
}
//170 250