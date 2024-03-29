import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/feature/user/user_advert_detail/user_advert_detail_view.dart';
import 'package:hrapp/feature/user/user_advert_list/user_advert_view_model.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/widgets/button/icon_button.dart';
import 'package:hrapp/product/widgets/subtitle.dart';

import '../../../core/constant/project_padding.dart';
import '../../../product/models/general_company_model.dart';

class UserAdvertListView extends StatefulWidget {
  final void Function()? getApp;
  final List<Job>? adverts;
  const UserAdvertListView({
    Key? key,
    this.getApp,
    this.adverts,
  }) : super(key: key);

  @override
  State<UserAdvertListView> createState() => _UserAdvertListViewState();
}

class _UserAdvertListViewState extends UserAdvertViewModel {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0).copyWith(top: 0),
      child: ListView(
        children: [
          const Subtitle(title: StringData.advert),
          const SizedBox(
            height: 10,
          ),
          advertsList(),
        ],
      ),
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
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserAdvertDetailView(
                      job: widget.adverts?[index],
                    ),
                  ));
                  widget.getApp!();
                },
                child: Ink(
                  height: 213,
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
                        skills(index)
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

  Row companyName(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            "${advertList[index].companyName}",
            overflow: TextOverflow.ellipsis,
            textScaleFactor: ProjectFontSize.oneToFive,
            style: const TextStyle(fontWeight: Weight.bold),
          ),
        ),
        SizedBox(
          width: 35,
          height: 45,
          child: ChangeIconButton(
            pressButton: save,
            buttonIcon: MyIcons.save,
            change: isSave,
            changeIcon: MyIcons.saved,
          ),
        ),
      ],
    );
  }

  Align city(index) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "${advertList[index].province}",
        textScaleFactor: ProjectFontSize.oneToThree,
        style: const TextStyle(color: MyColor.osloGrey),
      ),
    );
  }

  Align wage(index) {
    String? currency = widget.adverts?[index].currency;
    String? data;
    if (widget.adverts?[index].currency == null) {
      currency = StringData.turkishLiraSymbol;
    } else {
      currency = widget.adverts?[index].currency;
    }
    if (widget.adverts?[index].lowerWage != null && widget.adverts?[index].upperWage != null) {
      data = "$currency ${widget.adverts?[index].lowerWage?.toStringAsFixed(0)}"
          "-"
          "${widget.adverts?[index].upperWage?.toStringAsFixed(0)}";
    } else if (widget.adverts?[index].upperWage != null) {
      data = "$currency ${widget.adverts?[index].upperWage?.toStringAsFixed(0)}";
    } else if (widget.adverts?[index].lowerWage != null) {
      data = "$currency ${widget.adverts?[index].lowerWage?.toStringAsFixed(0)}";
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
          itemCount: widget.adverts?[pindex].skills?.length,
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
                    "${widget.adverts?[pindex].skills?[index]}",
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
