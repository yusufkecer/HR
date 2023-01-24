import 'package:flutter/material.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/sub_title.dart';
import '../../../Core/Constant/radius.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/Constant/weight.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/icons.dart';
import '../../../product/data/company_repo/advert_repo.dart';

class CompanyJobView extends StatefulWidget {
  final AdvertRepo? advertRepo;
  const CompanyJobView({
    Key? key,
    this.advertRepo,
  }) : super(key: key);

  @override
  State<CompanyJobView> createState() => _CompanyJobViewState();
}

class _CompanyJobViewState extends State<CompanyJobView> {
  bool isSelectedPopup = false;
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
                topJobs(),
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
                  "İlanınız bulunmamaktadır.\n Hemen oluşturun!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: MyColor.osloGrey, fontWeight: Weight.midium),
                  textScaleFactor: ProjectFontSize.oneToFour,
                ),
              ],
            ),
          );
  }

  SizedBox topJobs() {
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
                borderRadius: ProjectBorders.mediumAll(),
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
                          const SizedBox(
                            height: 17,
                            child: VerticalDivider(
                              color: MyColor.osloGrey,
                              width: 10,
                              thickness: 1.5,
                            ),
                          ),
                          jobTiming(index)
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
          enabled: isSelectedPopup ? false : true,
          onCanceled: () {
            isSelectedPopup = isSelectedPopup;
          },
          onSelected: (value) {
            isSelectedPopup = isSelectedPopup;
          },
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
          itemBuilder: (context) {
            return [PopupMenuItem(child: const Text(StringData.delete))];
          },
        ),
      ),
      // child: IconButton(
      //     onPressed: (() {
      //       delete(index);
      //     }),
      //     icon: const Icon(MyIcons.delete),
      //     color: MyColor.red),
    );
  }

  Padding jobImage(int index) {
    return Padding(
      padding: const ProjectPadding.allEightTeen(),
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              ImagePath.temporaryImage,
            ),
          ),
          borderRadius: ProjectBorders.smallAll(),
          color: MyColor.transparent,
        ),
      ),
    );
  }

  Text jobTitle(int index) {
    return Text(
      widget.advertRepo!.adverts[index].jobs?.jobTitle ?? "-",
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
        itemCount: widget.advertRepo!.adverts[parentIndex].jobs!.skills!.length > 3
            ? 3
            : widget.advertRepo!.adverts[parentIndex].jobs!.skills!.length,
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
                widget.advertRepo!.adverts[parentIndex].jobs!.skills![index],
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
      padding: const ProjectPadding.allEightTeen().copyWith(left: 18, right: 0),
      child: Text(
        "₺ ${widget.advertRepo!.adverts[index].jobs?.lowerWage?.toDouble().toStringAsFixed(3)}"
        "-"
        "${widget.advertRepo!.adverts[index].jobs?.upperWage?.toDouble().toStringAsFixed(3)}/Ay",
        style: const TextStyle(fontWeight: Weight.midium),
      ),
    );
  }

  Text jobTiming(int index) {
    return Text(
      "${widget.advertRepo!.adverts[index].jobs!.timing}",
      style: const TextStyle(fontWeight: Weight.midium),
    );
  }

  void delete(int index) async {
    Navigator.pop(context);
    setState(() {
      widget.advertRepo!.delete(index);
    });
  }
}
