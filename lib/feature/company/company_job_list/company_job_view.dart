import 'package:flutter/material.dart';
import 'package:hrapp/Product/Constant/colors.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/sub_title.dart';
import '../../../Core/Constant/radius.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/Constant/weight.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/icons.dart';
import '../../../product/data/company_repo/company_repo.dart';

class CompanyJobView extends StatefulWidget {
  const CompanyJobView({super.key});

  @override
  State<CompanyJobView> createState() => _CompanyJobViewState();
}

class _CompanyJobViewState extends State<CompanyJobView> {
  final CompanyRepo companyRepo = CompanyRepo();
  @override
  Widget build(BuildContext context) {
    return companyRepo.companys.isNotEmpty
        ? ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SubTitle(
                title: StringData.myAdvertisement,
              ),
              topJobs(),
            ],
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
                SizedBox(
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
        itemCount: companyRepo.companys.length,
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
                  deleteJob(index),
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

  Align deleteJob(index) {
    return Align(
        alignment: Alignment.topRight,
        child: IconButton(
            onPressed: (() {
              delete(index);
            }),
            icon: const Icon(MyIcons.delete),
            color: MyColor.red));
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
      companyRepo.companys[index].jobs?.jobTitle ?? "-",
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
        itemCount: companyRepo.companys[parentIndex].jobs!.skills!.length > 3
            ? 3
            : companyRepo.companys[parentIndex].jobs!.skills!.length,
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
                companyRepo.companys[parentIndex].jobs!.skills![index],
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
        "₺ ${companyRepo.companys[index].jobs?.wage?.toDouble().toStringAsFixed(3) ?? "-"}/Ay",
        style: const TextStyle(fontWeight: Weight.midium),
      ),
    );
  }

  void delete(int index) async {
    setState(() {
      companyRepo.delete(index);
    });
  }
}
