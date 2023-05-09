import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Constant/colors.dart';
import '../constant/icons.dart';
import '../constant/string_data.dart';

class UserNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onTabChange;
  const UserNavBar({
    Key? key,
    required this.selectedIndex,
    this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GNav(
      rippleColor: Colors.purple.withOpacity(0.5),
      hoverColor: Colors.purple.withOpacity(0.1),
      gap: 8,
      activeColor: Theme.of(context).colorScheme.primary,
      iconSize: 24,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      duration: const Duration(milliseconds: 300),
      tabBackgroundColor: Colors.purple.withOpacity(0.1),
      color: MyColor.osloGrey,
      tabs: const [
        GButton(
          iconSize: 26,
          icon: MyIcons.home,
          text: StringData.homePage,
        ),
        GButton(
          iconSize: 26,
          icon: MyIcons.company,
          text: StringData.advert,
        ),
        GButton(
          iconSize: 26,
          icon: MyIcons.position,
          text: StringData.navCv,
        ),
        GButton(
          iconSize: 26,
          icon: MyIcons.access,
          text: StringData.access,
        ),
      ],
      selectedIndex: selectedIndex,
      onTabChange: onTabChange,
    );
  }
}
