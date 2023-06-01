import 'package:flutter/material.dart';
import 'package:hrapp/Product/Constant/colors.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/feature/company/company_advert_application/company_advert_app_view_model.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/subtitle.dart';

import '../../../product/constant/string_data.dart';

class CompanyAdvertAppView extends StatefulWidget {
  const CompanyAdvertAppView({super.key});

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
      body: ListView(
        children: [
          const Subtitle(title: StringData.incomingApplications),
          Padding(
            padding: const ProjectPadding.allTen(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => Column(
                children: [
                  userInfo(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container userInfo() {
    return Container(
      color: MyColor.tints,
      child: const Center(
        child: Padding(
          padding: ProjectPadding.allEight(),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(ImagePath.temporaryImage),
            ),
            title: Text("İşçi Adı Soyadı"),
            subtitle: Text("İşçi Mesleği"),
            trailing: Icon(MyIcons.nextIOSIcon),
          ),
        ),
      ),
    );
  }
}
