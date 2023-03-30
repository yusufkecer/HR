import 'package:flutter/material.dart';

import '../../Core/Constant/radius.dart';
import '../../core/constant/project_padding.dart';
import '../../feature/company/company_advert_detail/company_advert_detail_view.dart';
import '../Constant/colors.dart';
import '../Constant/weight.dart';
import '../constant/font_size.dart';
import '../constant/icons.dart';
import '../constant/string_data.dart';
import '../data/company_repo/advert_repo.dart';
import '../models/company_model/company_model.dart';
import 'button/icon_button.dart';

class PopularAdverts extends StatefulWidget {
  final List<Company> advertInfo;
  final Function(int) saveButton;
  const PopularAdverts({
    Key? key,
    required this.advertInfo,
    required this.saveButton,
  }) : super(key: key);

  @override
  State<PopularAdverts> createState() => _PopularAdvertsState();
}

class _PopularAdvertsState extends State<PopularAdverts> {
  List<Company>? advertInfo;
  @override
  void initState() {
    advertInfo = widget.advertInfo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return advertInfo != null
        ? SizedBox(
            height: 200,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CompanyAdvertDetailView(),
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
                          saveJobButton(index),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  jobImage(advertInfo?[index]),
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
                  ),
                );
              },
            ),
          )
        : const SizedBox();
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
      advertInfo?[index].jobs?.jobTitle ?? "-",
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
        itemCount:
            advertInfo![parentIndex].jobs!.skills!.length > 3 ? 3 : advertInfo?[parentIndex].jobs!.skills!.length,
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
                advertInfo?[parentIndex].jobs!.skills![index],
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
        "₺ ${advertInfo?[index].jobs?.lowerWage?.toDouble().toStringAsFixed(0) ?? "-"}/Ay",
        style: const TextStyle(fontWeight: Weight.midium),
      ),
    );
  }

  void saveJob(int index) async {
    setState(() {
      AdvertRepo.instance.saveJob(index);
    });
  }
}
