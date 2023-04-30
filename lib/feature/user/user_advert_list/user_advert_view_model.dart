import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_advert_list/user_advert_list_view.dart';

import '../../../product/models/general_company_model.dart';

abstract class UserAdvertViewModel extends State<UserAdvertListView> {
  bool isSave = false;
  List<Job> advertList = [];
  void save() {
    setState(() {
      isSave = !isSave;
    });
  }

  @override
  void initState() {
    advertList = widget.adverts ?? [];

    super.initState();
  }
}
