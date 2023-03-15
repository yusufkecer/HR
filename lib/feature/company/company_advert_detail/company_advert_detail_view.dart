import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/feature/company/company_advert_detail/company_advert_detail_view_model.dart';
import 'package:hrapp/product/Constant/weight.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/models/general_company_model.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';

class CompanyAdvertDetailView extends StatefulWidget {
  final Job? adverts;
  const CompanyAdvertDetailView({
    Key? key,
    this.adverts,
  }) : super(key: key);

  @override
  State<CompanyAdvertDetailView> createState() => _CompanyAdvertDetailViewState();
}

class _CompanyAdvertDetailViewState extends CompanyAdvertDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogoTitle(),
      ),
      body: Padding(
        padding: const ProjectPadding.allEight().copyWith(top: 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: context.width,
              decoration: const BoxDecoration(
                color: MyColor.tints,
                borderRadius: ProjectRadius.mediumAll(),
              ),
              child: Padding(
                padding: const ProjectPadding.allEight().copyWith(
                  top: 15,
                ),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(borderRadius: ProjectRadius.bigAll()),
                      child: const Image(
                        image: NetworkImage(ImagePath.temporaryImage),
                        //fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const ProjectPadding.allEight(),
                      child: Text(
                        advertList!.companyName!,
                        textScaleFactor: ProjectFontSize.oneToFour,
                        style: const TextStyle(fontWeight: Weight.midium),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            richText(StringData.jobPositionD, advertList!.jobTitle!),
                            richText(StringData.skillsD, advertList!.skills!.join(", ")),
                            richText(StringData.timingD, advertList!.timing!),
                            richText(StringData.levelD, advertList!.level!),
                            richText(StringData.positionOpenD, "${advertList!.positionOpen!} kişi"),
                            richText(StringData.applicationDateD, date!),
                            wageConditions(),
                            advertList!.province != null
                                ? richText(StringData.positionOpenD, advertList!.province!)
                                : const SizedBox(),
                            advertList!.description != null
                                ? richText(StringData.descriptionD, advertList!.description!)
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding richText(String title, String sub) {
    return Padding(
      padding: const ProjectPadding.topTen(),
      child: RichText(
        textScaleFactor: ProjectFontSize.oneToThree,
        text: TextSpan(
          children: [
            TextSpan(text: "$title ", style: const TextStyle(color: MyColor.black, fontWeight: Weight.midium)),
            TextSpan(
              text: sub,
              style: const TextStyle(color: MyColor.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget wageConditions() {
    String? currency;
    String? data;

    if (advertList?.currency == null) {
      currency = StringData.turkishLiraSymbol;
    } else {
      currency = advertList!.currency;
    }
    if (advertList?.lowerWage != null && advertList?.upperWage != null) {
      data = "$currency ${advertList?.lowerWage?.toStringAsFixed(0)}"
          "-"
          "${advertList?.upperWage?.toStringAsFixed(0)}/Ay";
    } else if (advertList?.upperWage != null) {
      data = "$currency ${advertList?.upperWage?.toStringAsFixed(0)}/Ay";
    } else if (advertList?.lowerWage != null) {
      data = "$currency ${advertList?.lowerWage?.toStringAsFixed(0)}/Ay";
    } else {
      data = "";
      return const SizedBox();
    }

    return richText(StringData.wageD, data);
  }
}
