import 'package:flutter/material.dart';
import 'package:hrapp/feature/company/company_advert_list/company_advert_view.dart';
import 'package:hrapp/product/data/company_repo/advert_repo.dart';
import '../../../Product/Constant/colors.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/image_path.dart';
import '../../../product/widgets/app_bar_logo.dart';
import '../../../product/widgets/nav_bar.dart';
import '../company_create_advert/company_create_advert_view.dart';
import '../company_home_page/company_home_view.dart';
import '../company_profile/company_profile_view.dart';
import 'company_main_view_model.dart';

class CompanyMainView extends StatefulWidget {
  const CompanyMainView({super.key});

  @override
  State<CompanyMainView> createState() => _CompanyMainViewState();
}

class _CompanyMainViewState extends CopmanyMainViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      drawer: Drawer(
        child: SafeArea(
          child: ListView.builder(
            itemCount: AdvertRepo.instance.adverts.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AdvertRepo.instance.adverts[index].jobs!.isSaveJob == true
                  ? Text("${AdvertRepo.instance.adverts[index].jobs!.jobTitle}")
                  : const SizedBox();
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: const AppBarLogoTitle(),
        actions: [
          circleProfileImage(),
        ],
      ),
      body: TabBarView(controller: tabController, children: [
        CompanyHomeView(
          workers: workers,
          connectionError: dontReachApi,
        ),
        CompanyJobView(
          advertRepo: jobList,
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingButton(),
      bottomNavigationBar: NavBar(
        tabController: tabController,
        navBarItem: bottomBar,
      ),
    );
  }

  Widget floatingButton() {
    return FloatingActionButton(
      backgroundColor: MyColor.discovreyPurplishBlue,
      onPressed: () async {
        status = await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CompanyCreateJobView(advertRepo: jobList),
        ));

        if (status) {
          setState(() {});
        }
      },
      child: const Icon(MyIcons.add),
    );
  }

  GestureDetector circleProfileImage() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CompanyProfileView(),
        ));
      },
      child: const Padding(
        padding: ProjectPadding.allEight(),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            ImagePath.temporaryImage,
          ),
        ),
      ),
    );
  }
}
