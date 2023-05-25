import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_home_page/user_home_view.dart';
import 'package:hrapp/product/constant/colors.dart';

import '../../../product/data/company_repo/advert_repo.dart';

abstract class UserHomeViewModel extends State<UserHomeView> {
  FocusNode node = FocusNode();
  void saveJob(int index) async {
    setState(() {
      AdvertRepo.instance.saveJob(index);
    });
  }

  @override
  void initState() {
    node.addListener(refresh);
    super.initState();
  }

  List<Color> color = [MyColor.fuchsiaBlue, MyColor.butterflyBush, MyColor.darkLevander, MyColor.black];

  void refresh() {
    setState(() {});
  }
}
