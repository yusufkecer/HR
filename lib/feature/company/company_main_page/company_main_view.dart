import 'package:flutter/material.dart';
import 'package:hrapp/feature/company/company_job_list/company_job_view.dart';
import 'package:hrapp/product/data/company_repo/advert_repo.dart';
import '../../../Product/Constant/colors.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/image_path.dart';
import '../../../product/widgets/app_bar_logo.dart';
import '../../../product/widgets/nav_bar.dart';
import '../company_create_job/company_create_advert_view.dart';
import '../company_home_page/company_home_view.dart';
import 'company_main_view_model.dart';

class CompanyMainView extends StatefulWidget {
  const CompanyMainView({super.key});

  @override
  State<CompanyMainView> createState() => _CompanyMainViewState();
}

class _CompanyMainViewState extends CopmanyMainViewModel with TickerProviderStateMixin {
  @override
  void initState() {
    getWorkers();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  var a = AdvertRepo.instance.adverts.first.jobs!.isSaveJob;
  @override
  Widget build(BuildContext context) {
    print("build main çalıştı");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListView.builder(
                itemCount: AdvertRepo.instance.adverts.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // setState(() {});
                  return AdvertRepo.instance.adverts[index].jobs!.isSaveJob == true
                      ? Text("${AdvertRepo.instance.adverts[index].jobs!.jobTitle}")
                      : const SizedBox();
                },
              ),
            ],
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
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CompanyCreateJobView(advertRepo: jobList),
        ));
      },
      child: const Icon(MyIcons.add),
    );
  }

  Padding circleProfileImage() {
    return const Padding(
      padding: ProjectPadding.allEight(),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          ImagePath.temporaryImage,
        ),
      ),
    );
  }
}
