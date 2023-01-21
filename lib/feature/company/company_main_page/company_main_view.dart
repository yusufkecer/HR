import 'package:flutter/material.dart';
import '../../../Product/Constant/colors.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/image_path.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/data/company_repo/company_repo.dart';
import '../../../product/widgets/app_bar_logo.dart';
import '../../../product/widgets/nav_bar.dart';
import '../company_home_page/company_home_view.dart';

class CompanyMainView extends StatefulWidget {
  const CompanyMainView({super.key});

  @override
  State<CompanyMainView> createState() => _CompanyMainViewState();
}

class _CompanyMainViewState extends State<CompanyMainView> with TickerProviderStateMixin {
  final Map bottomBar = {
    StringData.homePage: MyIcons.home,
    StringData.postings: MyIcons.listAlt,
  };
  final CompanyRepo companyRepo = CompanyRepo();
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      drawer: Drawer(
        child: SafeArea(
            child: Column(
          children: [
            for (var i in companyRepo.companys)
              if (i.jobs!.isSaveJob == true) Text("${i.jobs!.jobTitle!} ${i.jobs!.level!}")
          ],
        )),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        title: const AppBarLogoTitle(),
        iconTheme: const IconThemeData(
          color: MyColor.fuchsiaBlueLight,
        ),
        elevation: 0,
        actions: [
          circleProfileImage(),
        ],
      ),
      body: TabBarView(controller: tabController, children: [CompanyHomeView(), Text("data")]),
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
      onPressed: () {},
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
