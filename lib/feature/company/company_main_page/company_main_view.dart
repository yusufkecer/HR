import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/feature/company/company_advert_list/company_advert_view.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import '../../../Product/Constant/colors.dart';
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
  final zoomController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: MyColor.fuchsiaBlue,
      controller: zoomController,
      menuScreen: drawer(),
      mainScreen: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                zoomController.open?.call();
              },
              icon: const Icon(Icons.menu)),
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
          CompanyAdvertView(
            activeAdverts: activeAdverts,
            passiveAdverts: passiveAdverts,
            adverts: adverts,
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingButton(),
        bottomNavigationBar: NavBar(
          tabController: tabController,
          navBarItem: bottomBar,
        ),
      ),
      borderRadius: 24.0,
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }

  SafeArea drawer() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                height: 110,
                width: 110,
                child: circleProfileImage(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Auth.instance.getName ?? "",
                  textScaleFactor: ProjectFontSize.oneToThree,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: Weight.midium, color: MyColor.white),
                ),
              ),
            ],
          ),
          const Padding(
            padding: ProjectPadding.allFive(),
            child: Divider(
              indent: 15,
              endIndent: 19,
              thickness: 1.2,
              color: MyColor.white,
            ),
          ),
          listTile(
            MyIcons.add,
            StringData.createAdvert,
            MyIcons.nextIOSIcon,
            navigateCreateAdvert,
          ),
          const SizedBox(
            height: 5,
          ),
          listTile(
            MyIcons.saveIcon,
            StringData.savedAdvert,
            MyIcons.nextIOSIcon,
            navigateSavedAdvert,
          ),
          const SizedBox(
            height: 5,
          ),
          listTile(
            MyIcons.logout,
            StringData.logout,
            MyIcons.nextIOSIcon,
            logout,
          ),
        ],
      ),
    );
  }

  ListTile listTile(IconData leadingIcon, String title, IconData tralingIcon, void Function()? ontap) {
    return ListTile(
      textColor: MyColor.white,
      iconColor: MyColor.white,
      leading: Icon(
        leadingIcon,
        size: 27,
      ),
      title: Text(
        title,
      ),
      onTap: ontap,
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
