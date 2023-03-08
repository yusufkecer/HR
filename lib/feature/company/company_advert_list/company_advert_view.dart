import 'package:flutter/material.dart';
import 'package:hrapp/core/enum/advert_filter.dart';
import 'package:hrapp/feature/company/company_advert_detail/company_advert_detail_view.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';
import 'package:hrapp/product/widgets/sub_title.dart';
import 'package:hrapp/product/widgets/text_with_icon.dart';
import '../../../Core/Constant/radius.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/Constant/weight.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/icons.dart';
import '../../../product/data/company_repo/advert_repo.dart';
import '../../../product/widgets/button/chip_button.dart';
import '../../../product/widgets/not_found.dart';
import 'company_advert_view_model.dart';

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
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    CustomChipButton(
                      title: AdvertFilterOptions.all.options,
                      selected: filterOptions == AdvertFilterOptions.all,
                      ontap: () {
                        filter(AdvertFilterOptions.all);
                      },
                    ),
                    CustomChipButton(
                      title: AdvertFilterOptions.active.options,
                      selected: filterOptions == AdvertFilterOptions.active,
                      ontap: () {
                        filter(AdvertFilterOptions.active);
                      },
                    ),
                    CustomChipButton(
                      title: AdvertFilterOptions.passive.options,
                      selected: filterOptions == AdvertFilterOptions.passive,
                      ontap: () {
                        filter(AdvertFilterOptions.passive);
                      },
                    ),
                  ],
                ),
                const SubTitle(
                  title: StringData.myAdvertisement,
                ),
                filterOptions == AdvertFilterOptions.active
                    ? jobs(widget.advertRepo!.activeAdverts)
                    : filterOptions == AdvertFilterOptions.passive
                        ? jobs(widget.advertRepo!.passiveAdverts)
                        : jobs(widget.advertRepo!.adverts),
              ],
            ),
          )
        : const NotFound(
            text: StringData.advertNotFound,
          );
  }

  SizedBox jobs(List<Company> advertRepo) {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: advertRepo.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyAdvertDetailView(adverts: advertRepo[index]),
                  ));
            },
            child: Padding(
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                jobTitle(index, advertRepo),
                                const SizedBox(
                                  height: 7,
                                ),
                                jobInfo(advertRepo, index),
                              ],
                            )
                          ],
                        ),
                        skills(advertRepo, index),
                        Row(
                          children: [
                            jobWage(advertRepo, index),
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
                            jobTiming(advertRepo, index),
                            advertRepo[index].jobs!.province != null
                                ? const SizedBox(
                                    height: 18,
                                    child: VerticalDivider(
                                      color: MyColor.osloGrey,
                                      width: 10,
                                      thickness: 1.5,
                                    ),
                                  )
                                : const SizedBox(),
                            advertRepo[index].jobs!.province != null ? province(advertRepo, index) : const SizedBox()
                          ],
                        )
                      ],
                    ),
                    jobSettings(index, advertRepo),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
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

  Text jobTitle(int index, advertRepo) {
    return Text(
      advertRepo[index].jobs?.jobTitle ?? "-",
      textScaleFactor: ProjectFontSize.oneToThree,
      style: const TextStyle(
        fontWeight: Weight.midium,
      ),
    );
  }

  Widget jobInfo(advertRepo, int index) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: "${advertRepo[index].jobs?.level}",
        style: const TextStyle(
          fontWeight: Weight.midium,
          color: MyColor.black,
          fontSize: 15.5,
        ),
      ),
      const WidgetSpan(
          child: SizedBox(
        height: 16,
        child: VerticalDivider(
          color: MyColor.osloGrey,
          width: 10,
          thickness: 1.5,
          endIndent: 2,
        ),
      )),
      TextSpan(
        text: "${advertRepo[index].jobs?.positionOpen} Kişi",
        style: const TextStyle(
          fontWeight: Weight.midium,
          color: MyColor.black,
          fontSize: 15.5,
        ),
      ),
    ]));
  }

  Align jobSettings(index, advertRepo) {
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
          itemBuilder: (ctx) {
            return [
              popupItem(
                index,
                MyIcons.editNote,
                StringData.update,
                updateJob,
                0,
                advertRepo,
              ),
              popupItem(
                index,
                MyIcons.delete,
                StringData.delete,
                deleteAdvert,
                1,
              ),
            ];
          },
        ),
      ),
    );
  }

  PopupMenuItem popupItem(int index, IconData icon, String info, Function onTap, int value,
      [List<Company>? advertRepo]) {
    return PopupMenuItem(
        value: value,
        child: TextWithIcon(
          icon: icon,
          text: info,
        ),
        onTap: () {
          onTap(index, advertRepo);
        });
  }

  SizedBox skills(List<Company> advertRepo, parentIndex) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: advertRepo[parentIndex].jobs?.skills != null ? advertRepo[parentIndex].jobs?.skills?.length : 0,
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
                child: advertRepo[parentIndex].jobs?.skills?[index] != null
                    ? Text(
                        advertRepo[parentIndex].jobs?.skills?[index], //textAlign: TextAlign.center,
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

  Padding jobWage(List<Company> advertRepo, int index) {
    return Padding(
      padding: const ProjectPadding.allEightTeen().copyWith(left: 18, right: 0),
      child: wageConditions(advertRepo, index),
    );
  }

  Text jobTiming(List<Company> advertRepo, int index) {
    return Text(
      "${advertRepo[index].jobs!.timing}",
      textScaleFactor: ProjectFontSize.oneToOne,
      style: const TextStyle(fontWeight: Weight.midium),
    );
  }

  Widget province(List<Company> advertRepo, int index) => Flexible(
        child: Padding(
          padding: const ProjectPadding.rightEight(),
          child: Text(
            "${advertRepo[index].jobs!.province}",
            textScaleFactor: ProjectFontSize.oneToOne,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontWeight: Weight.midium),
          ),
        ),
      );

  Text wageConditions(List<Company> advertRepo, int index) {
    String? currency;
    String? data;
    if (advertRepo[index].jobs?.currency == null) {
      currency = StringData.turkishLiraSymbol;
    } else {
      currency = advertRepo[index].jobs!.currency;
    }
    if (advertRepo[index].jobs?.lowerWage != null && advertRepo[index].jobs?.upperWage != null) {
      data = "$currency ${advertRepo[index].jobs?.lowerWage?.toStringAsFixed(0)}"
          "-"
          "${advertRepo[index].jobs?.upperWage?.toStringAsFixed(0)}/Ay";
    } else if (advertRepo[index].jobs?.upperWage != null) {
      data = "$currency ${advertRepo[index].jobs?.upperWage?.toStringAsFixed(0)}/Ay";
    } else if (advertRepo[index].jobs?.lowerWage != null) {
      data = "$currency ${advertRepo[index].jobs?.lowerWage?.toStringAsFixed(0)}/Ay";
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
}
