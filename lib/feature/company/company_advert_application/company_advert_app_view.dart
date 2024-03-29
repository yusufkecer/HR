import 'package:flutter/material.dart';

import 'package:hrapp/Product/Constant/colors.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/feature/company/company_advert_application/company_advert_app_view_model.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/not_found.dart';
import 'package:hrapp/product/widgets/subtitle.dart';

import '../../../product/constant/string_data.dart';

class CompanyAdvertAppView extends StatefulWidget {
  final List? appList;
  const CompanyAdvertAppView({
    Key? key,
    required this.appList,
  }) : super(key: key);

  @override
  State<CompanyAdvertAppView> createState() => _CompanyAdvertAppViewState();
}

class _CompanyAdvertAppViewState extends CompanyAdvertAppViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogoTitle(), // <-- Use AppBarLogoTitle
      ),
      body: appList.isNotEmpty && userInfoList != null && userInfoList != []
          ? ListView(
              children: [
                const Subtitle(title: StringData.incomingApplications),
                Padding(
                  padding: const ProjectPadding.allTen(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: userInfoList?.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            goToUserDetail(index);
                          },
                          customBorder: const RoundedRectangleBorder(
                            borderRadius: ProjectRadius.smallAll(),
                          ),
                          child: userInfo(index),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: NotFound(text: "Başvuru bulunmamaktadır.")),
    );
  }

  Ink userInfo(index) {
    return Ink(
      decoration: const BoxDecoration(
        color: MyColor.tints,
        borderRadius: ProjectRadius.smallAll(),
      ),
      child: Center(
        child: Padding(
          padding: const ProjectPadding.allEight(),
          child: ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(ImagePath.temporaryImage),
            ),
            title: Text(userInfoList?[index]["firstName"] + " " + userInfoList?[index]["lastName"]),
            subtitle: Padding(
              padding: const ProjectPadding.topEight(),
              child: Text(advertList?[index].jobTitle ?? "", maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            trailing: SizedBox(
              width: 35,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => openDescription(index),
                icon: const Icon(
                  MyIcons.message,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
