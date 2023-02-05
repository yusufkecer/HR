import 'package:flutter/material.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/sub_title.dart';
import 'package:hrapp/product/widgets/text_with_icon.dart';
import '../../../Core/Constant/radius.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/Constant/weight.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/icons.dart';
import '../../../product/data/company_repo/advert_repo.dart';
import '../company_create_advert/company_create_advert_view.dart';
import 'company_job_view_model.dart';

class CompanyJobView extends StatefulWidget {
  final AdvertRepo? advertRepo;
  const CompanyJobView({
    Key? key,
    this.advertRepo,
  }) : super(key: key);

  @override
  State<CompanyJobView> createState() => _CompanyJobViewState();
}

class _CompanyJobViewState extends CompanyJobViewModel {
  @override
  Widget build(BuildContext context) {
    return widget.advertRepo!.adverts.isNotEmpty
        ? Padding(
            padding: const ProjectPadding.bottomTwentySix(),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                const SubTitle(
                  title: StringData.myAdvertisement,
                ),
                jobs(),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagePath.dontResult,
                  height: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  StringData.jobAdvertNotFound,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: MyColor.osloGrey, fontWeight: Weight.midium),
                  textScaleFactor: ProjectFontSize.oneToFour,
                ),
              ],
            ),
          );
  }

  SizedBox jobs() {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.advertRepo!.adverts.length,
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
                      Row(
                        children: [
                          jobWage(index),
                          verticalDivider
                              ? const SizedBox(
                                  height: 17,
                                  child: VerticalDivider(
                                    color: MyColor.osloGrey,
                                    width: 10,
                                    thickness: 1.5,
                                  ),
                                )
                              : const SizedBox(),
                          jobTiming(index),
                          widget.advertRepo!.adverts[index].jobs!.province != null
                              ? const SizedBox(
                                  height: 18,
                                  child: VerticalDivider(
                                    color: MyColor.osloGrey,
                                    width: 10,
                                    thickness: 1.5,
                                  ),
                                )
                              : const SizedBox(),
                          widget.advertRepo!.adverts[index].jobs!.province != null ? province(index) : const SizedBox()
                        ],
                      )
                    ],
                  ),
                  jobSettings(index),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Align jobSettings(index) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const ProjectPadding.allTwelve(),
        child: PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20).copyWith(
              topRight: const Radius.circular(0),
            ),
          ),
          color: Colors.grey.shade100,
          child: const Icon(
            MyIcons.popupMenu,
            color: MyColor.red,
          ),
          // onSelected: (value) {
          //   if (value == 0) {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => CompanyCreateJobView(
          //         updateJob: widget.advertRepo?.adverts[index],
          //         advertRepo: widget.advertRepo,
          //       ),
          //     ));
          //   }
          // },
          itemBuilder: (ctx) {
            return [
              popupItem(
                index,
                MyIcons.editNote,
                StringData.update,
                updateJob,
                0,
              ),
              popupItem(
                index,
                MyIcons.delete,
                StringData.delete,
                deleteJob,
                1,
              ),
            ];
          },
        ),
      ),
    );
  }

  PopupMenuItem popupItem(int index, IconData icon, String info, Function onTap, int value) {
    return PopupMenuItem(
        value: value,
        child: TextWithIcon(
          icon: icon,
          text: info,
        ),
        onTap: () {
          onTap(index);
        });
  }

  Padding jobImage(int index) {
    return Padding(
      padding: const ProjectPadding.allEightTeen(),
      child: Container(
        height: 75,
        width: 75,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              ImagePath.temporaryImage,
            ),
          ),
          borderRadius: ProjectRadius.smallAll(),
          color: MyColor.transparent,
        ),
      ),
    );
  }

  Text jobTitle(int index) {
    return Text(
      widget.advertRepo!.adverts[index].jobs?.jobTitle ?? "-",
      textScaleFactor: ProjectFontSize.oneToThree,
      style: const TextStyle(
        fontWeight: Weight.midium,
      ),
    );
  }

  SizedBox skills(parentIndex) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.advertRepo?.adverts[parentIndex].jobs?.skills != null
            ? widget.advertRepo?.adverts[parentIndex].jobs?.skills?.length
            : 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.allEight().copyWith(
              left: index == 0 ? 18 : 0,
              top: 0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: const ProjectPadding.allEight(),
                decoration: const BoxDecoration(
                  borderRadius: ProjectRadius.verySmallAll(),
                  color: MyColor.white,
                ),
                child: widget.advertRepo?.adverts[parentIndex].jobs?.skills?[index] != null
                    ? Text(
                        widget.advertRepo?.adverts[parentIndex].jobs?.skills?[index], //textAlign: TextAlign.center,
                        //  textScaleFactor: ProjectFontSize.zeroToNine,
                      )
                    : const SizedBox(),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding jobWage(int index) {
    return Padding(
      padding: const ProjectPadding.allEightTeen().copyWith(left: 18, right: 0),
      child: wageConditions(index),
    );
  }

  Text jobTiming(int index) {
    return Text(
      "${widget.advertRepo!.adverts[index].jobs!.timing}",
      textScaleFactor: ProjectFontSize.oneToOne,
      style: const TextStyle(fontWeight: Weight.midium),
    );
  }

  Widget province(int index) => Flexible(
        child: Padding(
          padding: const ProjectPadding.rightEight(),
          child: Text(
            "${widget.advertRepo!.adverts[index].jobs!.province}",
            textScaleFactor: ProjectFontSize.oneToOne,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontWeight: Weight.midium),
          ),
        ),
      );

  Text wageConditions(int index) {
    String? currency;
    String? data;
    if (widget.advertRepo?.adverts[index].jobs?.currency == null) {
      currency = StringData.turkishLiraSymbol;
    } else {
      currency = widget.advertRepo!.adverts[index].jobs!.currency;
    }
    if (widget.advertRepo!.adverts[index].jobs?.lowerWage != null &&
        widget.advertRepo!.adverts[index].jobs?.upperWage != null) {
      data = "$currency ${widget.advertRepo!.adverts[index].jobs?.lowerWage?.toStringAsFixed(0)}"
          "-"
          "${widget.advertRepo!.adverts[index].jobs?.upperWage?.toStringAsFixed(0)}/Ay";
    } else if (widget.advertRepo!.adverts[index].jobs?.upperWage != null) {
      data = "$currency ${widget.advertRepo!.adverts[index].jobs?.upperWage?.toStringAsFixed(0)}/Ay";
    } else if (widget.advertRepo!.adverts[index].jobs?.lowerWage != null) {
      data = "$currency ${widget.advertRepo!.adverts[index].jobs?.lowerWage?.toStringAsFixed(0)}/Ay";
    } else {
      data = "";
      verticalDivider = false;
    }
    return Text(
      data,
      textScaleFactor: ProjectFontSize.oneToOne,
      style: const TextStyle(fontWeight: Weight.midium),
    );
  }

  void updateJob(index) async {
    Future(() => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CompanyCreateJobView(
              updateJob: widget.advertRepo?.adverts[index].jobs,
              advertRepo: widget.advertRepo,
            ),
          ),
        ));
  }
}
