import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_advert_detail/user_advert_detail_view.dart';

abstract class UserAdvertDetailViewModel extends State<UserAdvertDetailView> {
  String? date;
  @override
  void initState() {
    if (widget.job?.deadline != null) {
      List val = widget.job!.deadline!.toString().split(" ")[0].split("-");
      date = val[2] + "/" + val[1] + "/" + val[0];
    }

    super.initState();
  }
}
