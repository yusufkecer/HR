import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';

class NavBar extends StatefulWidget {
  final Map? navBarItem;
  const NavBar({
    this.navBarItem,
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with TickerProviderStateMixin {
  List<MapEntry<dynamic, dynamic>>? navBar;
  TabController? tabController;

  @override
  void initState() {
    navBar = widget.navBarItem?.entries.toList();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const ProjectPadding.appBarPadding(),
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
            shape: const CircularNotchedRectangle(),
            color: Colors.white,
            elevation: 0,
            child: TabBar(
              indicator: const BoxDecoration(
                borderRadius: ProjectBorders.mediumAll(),
              ),
              indicatorColor: Colors.purple,
              labelColor: MyColor.purplishBlue,
              unselectedLabelColor: MyColor.osloGrey,
              controller: tabController,
              tabs: [
                bottomNavBarItems(navBar![0].key, navBar![0].value),
                bottomNavBarItems(navBar![1].key, navBar![1].value),
              ],
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
