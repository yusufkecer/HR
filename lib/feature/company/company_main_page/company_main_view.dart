import 'package:flutter/material.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/feature/company/company_advert_list/company_advert_view.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/weight.dart';
import '../../../Product/Constant/colors.dart';
import '../../../core/constant/project_padding.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/image_path.dart';
import '../../../product/data/auth.dart';
import '../../../product/widgets/app_bar_logo.dart';
import '../../../product/widgets/nav_bar.dart';
import '../company_home_page/company_home_view.dart';
import 'company_main_view_model.dart';

class CompanyMainView extends StatefulWidget {
  const CompanyMainView({super.key});

  @override
  State<CompanyMainView> createState() => _CompanyMainViewState();
}

class _CompanyMainViewState extends CopmanyMainViewModel {
  String? name;
  @override
  void initState() {
    var response = Auth.instance.getToken();
    name = response?["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      drawer: Drawer(
        width: context.width / 1.4,
        child: Padding(
          padding: const ProjectPadding.allEight(),
          child: SafeArea(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 110,
                      width: 110,
                      child: circleProfileImage(),
                    ),
                    Text(
                      name ?? "",
                      textScaleFactor: ProjectFontSize.oneToThree,
                      style: const TextStyle(fontWeight: Weight.midium),
                    ),
                  ],
                ),
                const Divider(thickness: 1.2),
                listTile(
                  MyIcons.add,
                  "İlan Oluştur",
                  MyIcons.nextIOSIcon,
                  navigateCreateAdvert,
                ),
                const SizedBox(
                  height: 5,
                ),
                listTile(
                  MyIcons.saveIcon,
                  "Kayıtlı İlanlar",
                  MyIcons.nextIOSIcon,
                  navigateSavedAdvert,
                ),
              ],
            ),
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

  ListTile listTile(IconData leadingIcon, String title, IconData tralingIcon, void Function()? ontap) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        size: 27,
      ),
      title: Text(
        title,
        textScaleFactor: ProjectFontSize.oneToTwo,
      ),
      onTap: ontap,
      trailing: Icon(
        tralingIcon,
        size: 24,
      ),
    );
  }

  Widget floatingButton() {
    return FloatingActionButton(
      backgroundColor: MyColor.discovreyPurplishBlue,
      onPressed: navigateCreateAdvert,
      child: const Icon(MyIcons.add),
    );
  }

  Widget circleProfileImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: navigateProfile,
        child: const CircleAvatar(
          backgroundImage: NetworkImage(
            ImagePath.temporaryImage,
          ),
        ),
      ),
    );
  }
}
