import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_main_page/user_main_view_model.dart';
import 'package:hrapp/product/constant/colors.dart';
import '../../../product/widgets/custom_appbar.dart';
import '../../../product/widgets/user_nav_bar.dart';

class UserMainView extends StatefulWidget {
  const UserMainView({super.key});

  @override
  State<UserMainView> createState() => _UserMainViewState();
}

class _UserMainViewState extends UserMainViewModel {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => nav.closeKeyboard(),
      child: Scaffold(
        backgroundColor: const Color(0XFFE7EBF5),
        appBar: const PreferredSize(preferredSize: Size.fromHeight(65), child: CustomAppBar()),
        body: Center(
          child: widgetOptions.isEmpty ? const SizedBox() : widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: MyColor.desertStorm,
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
      ),
    );
  }
}
