import 'package:flutter/material.dart';
import 'package:hrapp/feature/company/company_advert_detail/company_advert_detail_view.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';
import 'package:hrapp/product/widgets/text_with_icon.dart';
import '../../../Core/Constant/radius.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/Constant/weight.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/icons.dart';

class AdvertVerticalList extends StatefulWidget {
  final bool isSave;
  final List? saveIndex;
  final void Function(int index, int parentIndex)? saveFunc;
  final List<Company>? advertRepo;
  final void Function()? updateAdvert;
  final void Function()? deleteAdvert;
  const AdvertVerticalList({
    Key? key,
    this.saveFunc,
    required this.isSave,
    this.saveIndex,
    required this.advertRepo,
    this.deleteAdvert,
    this.updateAdvert,
  }) : super(key: key);

  @override
  State<AdvertVerticalList> createState() => _AdvertVerticalListState();
}

class _AdvertVerticalListState extends State<AdvertVerticalList> {
  bool verticalDivider = true;
  @override
  Widget build(BuildContext context) {
    return jobs();
  }

  SizedBox jobs() {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.advertRepo?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyAdvertDetailView(),
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
                                jobTitle(index),
                                const SizedBox(
                                  height: 7,
                                ),
                                jobInfo(index),
                              ],
                            )
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
                            widget.advertRepo![index].jobs!.province != null
                                ? const SizedBox(
                                    height: 18,
                                    child: VerticalDivider(
                                      color: MyColor.osloGrey,
                                      width: 10,
                                      thickness: 1.5,
                                    ),
                                  )
                                : const SizedBox(),
                            widget.advertRepo![index].jobs!.province != null ? province(index) : const SizedBox()
                          ],
                        )
                      ],
                    ),
                    widget.isSave == false ? jobSettings(index) : savedIcon(index),
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

  Text jobTitle(int index) {
    return Text(
      widget.advertRepo![index].jobs?.jobTitle ?? "-",
      textScaleFactor: ProjectFontSize.oneToThree,
      style: const TextStyle(
        fontWeight: Weight.midium,
      ),
    );
  }

  Widget jobInfo(int index) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: "${widget.advertRepo![index].jobs?.level}",
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
        text: "${widget.advertRepo![index].jobs?.positionOpen} Kişi",
        style: const TextStyle(
          fontWeight: Weight.midium,
          color: MyColor.black,
          fontSize: 15.5,
        ),
      ),
    ]));

    // return Row(
    //   children: [
    //     Text(
    //       "${widget.advertRepo!.adverts[index].jobs?.level}",
    //       style: const TextStyle(
    //         fontWeight: Weight.midium,
    //       ),
    //     ),
    //     SizedBox(
    //       width: 10,
    //     ),
    //     Text(
    //       "${widget.advertRepo!.adverts[index].jobs?.positionOpen}",
    //       style: const TextStyle(
    //         fontWeight: Weight.midium,
    //       ),
    //     ),
    //   ],
    // );
  }

  savedIcon(int index) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(MyIcons.saved),
        onPressed: () {
          if (widget.saveIndex == null) {
            throw "Save için index verilmedi";
          }
          widget.saveFunc!(index, widget.saveIndex![index]);

          setState(() {});
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
                () {},
                0,
              ),
              popupItem(
                index,
                MyIcons.delete,
                StringData.delete,
                () {},
                1,
              ),
            ];
          },
        ),
      ),
    );
  }

  PopupMenuItem popupItem(int index, IconData icon, String info, Function? onTap, int value) {
    return PopupMenuItem(
        value: value,
        child: TextWithIcon(
          icon: icon,
          text: info,
        ),
        onTap: () {
          onTap!(index);
        });
  }

  SizedBox skills(parentIndex) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.advertRepo?[parentIndex].jobs?.skills != null
            ? widget.advertRepo![parentIndex].jobs?.skills?.length
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
                child: widget.advertRepo?[parentIndex].jobs?.skills?[index] != null
                    ? Text(
                        widget.advertRepo?[parentIndex].jobs?.skills?[index], //textAlign: TextAlign.center,
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
      "${widget.advertRepo![index].jobs!.timing}",
      textScaleFactor: ProjectFontSize.oneToOne,
      style: const TextStyle(fontWeight: Weight.midium),
    );
  }

  Widget province(int index) => Flexible(
        child: Padding(
          padding: const ProjectPadding.rightEight(),
          child: Text(
            "${widget.advertRepo![index].jobs!.province}",
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
    if (widget.advertRepo?[index].jobs?.currency == null) {
      currency = StringData.turkishLiraSymbol;
    } else {
      currency = widget.advertRepo![index].jobs!.currency;
    }
    if (widget.advertRepo![index].jobs?.lowerWage != null && widget.advertRepo![index].jobs?.upperWage != null) {
      data = "$currency ${widget.advertRepo![index].jobs?.lowerWage?.toStringAsFixed(0)}"
          "-"
          "${widget.advertRepo![index].jobs?.upperWage?.toStringAsFixed(0)}/Ay";
    } else if (widget.advertRepo![index].jobs?.upperWage != null) {
      data = "$currency ${widget.advertRepo![index].jobs?.upperWage?.toStringAsFixed(0)}/Ay";
    } else if (widget.advertRepo![index].jobs?.lowerWage != null) {
      data = "$currency ${widget.advertRepo![index].jobs?.lowerWage?.toStringAsFixed(0)}/Ay";
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
