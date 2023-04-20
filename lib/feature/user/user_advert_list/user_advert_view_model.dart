import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_advert_list/user_advert_list_view.dart';

abstract class UserAdvertViewModel extends State<UserAdvertListView> {
  bool isSave = false;
  void save() {
    setState(() {
      isSave = !isSave;
    });
  }
}
