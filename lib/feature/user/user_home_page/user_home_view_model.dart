import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_home_page/user_home_view.dart';

import '../../../product/data/company_repo/advert_repo.dart';

abstract class UserHomeViewModel extends State<UserHomeView> {
  void saveJob(int index) async {
    setState(() {
      AdvertRepo.instance.saveJob(index);
    });
  }
}
