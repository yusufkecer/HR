import 'package:flutter/material.dart';

import 'package:hrapp/core/enum/advert_filter.dart';
import 'package:hrapp/feature/company/company_advert_detail/company_advert_detail_view.dart';
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
import '../../../product/models/general_company_model.dart';
import '../../../product/service/api.dart';
import '../../../product/widgets/button/chip_button.dart';
import '../../../product/widgets/not_found.dart';
import 'company_advert_view_model.dart';

class CompanyAdvertView extends StatefulWidget {
  final List<Job>? adverts;
  final List<Job>? activeAdverts;
  final List<Job>? passiveAdverts;
  const CompanyAdvertView({
    Key? key,
    this.adverts,
    this.activeAdverts,
    this.passiveAdverts,
  }) : super(key: key);

  @override
  State<CompanyAdvertView> createState() => _CompanyAdvertViewState();
}

class _CompanyAdvertViewState extends CompanyAdvertViewModel {
  @override
  Widget build(BuildContext context) {
    return widget.adverts != null
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
                      selected: filters.getFilter == AdvertFilterOptions.all,
                      ontap: () {
                        filter(AdvertFilterOptions.all, ApiUri.getAdvertAll);
                        filters.updateFilter = AdvertFilterOptions.all;
                      },
                    ),
                    CustomChipButton(
                      title: AdvertFilterOptions.active.options,
                      selected: filters.getFilter == AdvertFilterOptions.active,
                      ontap: () {
                        filter(AdvertFilterOptions.active, ApiUri.getAdvertActive);
                        filters.updateFilter = AdvertFilterOptions.active;
                      },
                    ),
                    CustomChipButton(
                      title: AdvertFilterOptions.passive.options,
                      selected: filters.getFilter == AdvertFilterOptions.passive,
                      ontap: () {
                        filters.updateFilter = AdvertFilterOptions.passive;
                        filter(AdvertFilterOptions.passive, ApiUri.getAdvertPassive);
                      },
                    ),
                  ],
                ),
                const SubTitle(
                  title: StringData.myAdvertisement,
                ),
                filters.getFilter == AdvertFilterOptions.all
                    ? jobs(widget.adverts!)
                    : filters.getFilter == AdvertFilterOptions.active
                        ? jobs(widget.activeAdverts!)
                        : jobs(widget.passiveAdverts!)
              ],
            ),
          )
        : const NotFound(
            text: StringData.advertNotFound,
          );
  }

  SizedBox jobs(List<Job> adverts) {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: adverts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompanyAdvertDetailView(adverts: adverts[index]),
                ),
              );
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
                                jobTitle(index, adverts),
                                const SizedBox(
                                  height: 7,
                                ),
                                jobInfo(adverts, index),
                              ],
                            )
                          ],
                        ),
                        skills(adverts, index),
                        Row(
                          children: [
                            jobWage(adverts, index),
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
                            jobTiming(adverts, index),
                            adverts[index].province != null
                                ? const SizedBox(
                                    height: 18,
                                    child: VerticalDivider(
                                      color: MyColor.osloGrey,
                                      width: 10,
                                      thickness: 1.5,
                                    ),
                                  )
                                : const SizedBox(),
                            adverts[index].province != null ? province(adverts, index) : const SizedBox()
                          ],
                        )
                      ],
                    ),
                    jobSettings(index, adverts),
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

  Text jobTitle(int index, List<Job> advert) {
    return Text(
      advert[index].jobTitle ?? "-",
      textScaleFactor: ProjectFontSize.oneToThree,
      style: const TextStyle(
        fontWeight: Weight.midium,
      ),
    );
  }

  Widget jobInfo(List<Job> advert, int index) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: "${advert[index].level}",
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
        text: "${advert[index].positionOpen} Kişi",
        style: const TextStyle(
          fontWeight: Weight.midium,
          color: MyColor.black,
          fontSize: 15.5,
        ),
      ),
    ]));
  }

  Align jobSettings(int index, List<Job>? advert) {
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
                updateAdvert,
                0,
                advert,
              ),
              popupItem(
                index,
                MyIcons.delete,
                StringData.delete,
                deleteAdvert,
                1,
                advert,
              ),
            ];
          },
        ),
      ),
    );
  }

  PopupMenuItem popupItem(
    int index,
    IconData icon,
    String info,
    Function onTap,
    int value,
    List<Job>? advert,
  ) {
    return PopupMenuItem(
        value: value,
        child: TextWithIcon(
          icon: icon,
          text: info,
        ),
        onTap: () {
          onTap(index, advert);
        });
  }

  SizedBox skills(List<Job> advert, parentIndex) {
    return SizedBox(
      height: 44,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: advert[parentIndex].skills != null ? advert[parentIndex].skills?.length : 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const ProjectPadding.allEight().copyWith(
                top: 0,
                right: index == advert.length - 1 ? 5 : 5,
                left: index == 0 ? 10 : 5,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const ProjectPadding.allEight(),
                  decoration: const BoxDecoration(
                    borderRadius: ProjectRadius.verySmallAll(),
                    color: MyColor.white,
                  ),
                  child: advert[parentIndex].skills?[index] != null
                      ? Text(
                          advert[parentIndex].skills![index],
                          //  textScaleFactor: ProjectFontSize.zeroToNine,
                        )
                      : const SizedBox(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding jobWage(List<Job> advert, int index) {
    return Padding(
      padding: const ProjectPadding.allEightTeen().copyWith(left: 18, right: 0),
      child: wageConditions(advert, index),
    );
  }

  Text jobTiming(List<Job> advert, int index) {
    return Text(
      "${advert[index].timing}",
      textScaleFactor: ProjectFontSize.oneToOne,
      style: const TextStyle(fontWeight: Weight.midium),
    );
  }

  Widget province(List<Job> advert, int index) => Flexible(
        child: Padding(
          padding: const ProjectPadding.rightEight(),
          child: Text(
            "${advert[index].province}",
            textScaleFactor: ProjectFontSize.oneToOne,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontWeight: Weight.midium),
          ),
        ),
      );

  Text wageConditions(List<Job> advert, int index) {
    String? currency = advert[index].currency;
    String? data;
    if (advert[index].currency == null) {
      currency = StringData.turkishLiraSymbol;
    } else {
      currency = advert[index].currency;
    }
    if (advert[index].lowerWage != null && advert[index].upperWage != null) {
      data = "$currency ${advert[index].lowerWage?.toStringAsFixed(0)}"
          "-"
          "${advert[index].upperWage?.toStringAsFixed(0)}/Ay";
    } else if (advert[index].upperWage != null) {
      data = "$currency ${advert[index].upperWage?.toStringAsFixed(0)}/Ay";
    } else if (advert[index].lowerWage != null) {
      data = "$currency ${advert[index].lowerWage?.toStringAsFixed(0)}/Ay";
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
