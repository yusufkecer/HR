import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_main_page/user_main_view_model.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import '../../../product/widgets/user_nav_bar.dart';
import '../user_home_page/user_home_view.dart';

class UserMainView extends StatefulWidget {
  const UserMainView({super.key});

  @override
  State<UserMainView> createState() => _UserMainViewState();
}

class _UserMainViewState extends UserMainViewModel {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: const AppBarLogoTitle(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: UserNavBar(
            selectedIndex: selectedIndex,
            onTabChange: (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
          ),
        ),
      ),
    );
  }

  static const List<Widget> _widgetOptions = [
    UserHomeView(),
    Text(
      'Likes',
    ),
    Text(
      'CV',
    ),
    Text(
      'Profil',
    ),
  ];
}
