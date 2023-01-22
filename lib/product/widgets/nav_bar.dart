import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/widgets/nav_bar_shape.dart';

class NavBar extends StatelessWidget {
  final Map? navBarItem;
  final TabController? tabController;
  const NavBar({
    Key? key,
    this.navBarItem,
    this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navBar = navBarItem?.entries.toList();
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const ProjectPadding.appBarPadding(),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(shape: MyBorderShape()),
          child: Container(
            height: 65,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(1, 3),
                ),
              ],
              borderRadius: const ProjectBorders.mediumAll(),
            ),
            child: BottomAppBar(
              color: Colors.white,
              elevation: 0,
              child: TabBar(
                indicator: const BoxDecoration(
                  borderRadius: ProjectBorders.mediumAll(),
                ),
                labelColor: MyColor.purplishBlue,
                unselectedLabelColor: MyColor.osloGrey,
                controller: tabController,
                tabs: [
                  bottomNavBarItems(navBar![0].key, navBar[0].value),
                  bottomNavBarItems(navBar[1].key, navBar[1].value),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bottomNavBarItems(String name, IconData icon) {
    return Tab(
      icon: Icon(icon),
      text: name,
    );
  }
}
