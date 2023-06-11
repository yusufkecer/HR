import 'package:flutter/material.dart';

import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/feature/user/user_advert_application/user_advert_app_view_model.dart';

import '../../../Core/Constant/radius.dart';
import '../../../Product/Constant/colors.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/Constant/weight.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/image_path.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/widgets/app_bar_logo.dart';
import '../../../product/widgets/subtitle.dart';
import '../user_advert_detail/user_advert_detail_view.dart';

class UserAdvertAppView extends StatefulWidget {
  final List? adverts;
  const UserAdvertAppView({
    Key? key,
    this.adverts,
  }) : super(key: key);

  @override
  State<UserAdvertAppView> createState() => _UserAdvertAppViewState();
}

class _UserAdvertAppViewState extends UserAdvertAppViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      appBar: AppBar(
        title: const AppBarLogoTitle(),
      ),
      body: advertList.isNotEmpty || companyList.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(10.0).copyWith(top: 0),
              child: ListView(
                children: [
                  const Subtitle(title: StringData.application),
                  const SizedBox(
                    height: 10,
                  ),
                  advertsList(),
                ],
              ),
            )
          : const SizedBox(),
    );
  }

  ListView advertsList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: advertList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                customBorder: const RoundedRectangleBorder(
                  borderRadius: ProjectRadius.mediumAll(),
                ),
                splashColor: MyColor.tints,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserAdvertDetailView(
                        job: advertList[index],
                        isApplication: true,
                      ),
                    ),
                  );
                },
                child: Ink(
                  height: 227,
                  width: context.width,
                  decoration: const BoxDecoration(borderRadius: ProjectRadius.mediumAll(), color: MyColor.white),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        companyInfo(index),
                        Padding(
                          padding: const EdgeInsets.all(8.0).copyWith(right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  advertPosition(index),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  wage(index)
                                ],
                              ),
                              timing(index)
                            ],
                          ),
                        ),
                        skills(index),
                        Text(
                          widget.adverts?[index]["result"],
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        });
  }

  Row companyInfo(index) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: const BoxDecoration(
            borderRadius: ProjectRadius.mediumAll(),
            image: DecorationImage(
              image: NetworkImage(ImagePath.temporaryImage),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                companyName(index),
                city(index),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text companyName(index) {
    return Text(
      "${advertList[index].companyName}",
      overflow: TextOverflow.ellipsis,
      textScaleFactor: ProjectFontSize.oneToFive,
      style: const TextStyle(fontWeight: Weight.bold),
    );
  }

  Align city(index) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "${advertList[index].province}",
        textAlign: TextAlign.left,
        textScaleFactor: ProjectFontSize.oneToThree,
        style: const TextStyle(color: MyColor.osloGrey),
      ),
    );
  }

  Align wage(index) {
    String? currency = advertList[index].currency;
    String? data;
    if (advertList[index].currency == null) {
      currency = StringData.turkishLiraSymbol;
    } else {
      currency = advertList[index].currency;
    }
    if (advertList[index].lowerWage != null && advertList[index].upperWage != null) {
      data = "$currency ${advertList[index].lowerWage?.toStringAsFixed(0)}"
          "-"
          "${advertList[index].upperWage?.toStringAsFixed(0)}";
    } else if (advertList[index].upperWage != null) {
      data = "$currency ${advertList[index].upperWage?.toStringAsFixed(0)}";
    } else if (advertList[index].lowerWage != null) {
      data = "$currency ${advertList[index].lowerWage?.toStringAsFixed(0)}";
    } else {
      data = "";
    }
    return Align(
      child: Text(
        data,
        textScaleFactor: ProjectFontSize.oneToTwo,
        style: const TextStyle(color: MyColor.osloGrey),
      ),
    );
  }

  Text advertPosition(index) {
    return Text(
      "${advertList[index].jobTitle}",
      textScaleFactor: ProjectFontSize.oneToThree,
      style: const TextStyle(fontWeight: Weight.midium),
    );
  }

  Align timing(index) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const ProjectRadius.verySmallAll(),
          color: MyColor.lightPurple,
        ),
        child: Padding(
          padding: const ProjectPadding.allEight(),
          child: Text(
            "${advertList[index].timing}",
            textScaleFactor: ProjectFontSize.oneToOne,
            style: const TextStyle(color: MyColor.osloGrey),
          ),
        ),
      ),
    );
  }

  Align skills(pindex) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 44,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: advertList[pindex].skills?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const ProjectPadding.leftEight(),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const ProjectPadding.allEight(),
                  decoration: BoxDecoration(
                    borderRadius: const ProjectRadius.verySmallAll(),
                    color: MyColor.lightPurple,
                  ),
                  child: Text(
                    "${advertList[pindex].skills?[index]}",
                    style: const TextStyle(color: MyColor.discovreyPurplishBlue),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
