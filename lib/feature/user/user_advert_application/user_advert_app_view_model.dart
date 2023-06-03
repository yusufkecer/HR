import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_advert_application/user_advert_app_view.dart';

import '../../../product/models/general_company_model.dart';

abstract class UserAdvertAppViewModel extends State<UserAdvertAppView> {
  List<Job> advertList = [];

  @override
  void initState() {
    advertList = widget.adverts ?? [];

    super.initState();
  }
}
