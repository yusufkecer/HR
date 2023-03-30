import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/feature/user/user_home_page/user_home_view_model.dart';
import 'package:hrapp/product/widgets/popular_adverts.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/data/company_repo/advert_repo.dart';
import '../../../product/widgets/subtitle.dart';
import '../../../product/widgets/text_field/search_field.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => UserHomeViewState();
}

class UserHomeViewState extends UserHomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.horizontalFive(),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
            child: SearchField(),
          ),
          const Subtitle(
            title: StringData.popularJobs,
          ),
          PopularAdverts(
            advertInfo: AdvertRepo.instance.adverts,
            saveButton: saveJob,
          )
        ],
      ),
    );
  }
}
