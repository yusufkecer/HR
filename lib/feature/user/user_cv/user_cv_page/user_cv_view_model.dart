import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_cv/user_cv_page/user_cv_view.dart';

import '../../../user_cv_detail/user_cv_detail_view.dart';

abstract class UserCvViewModel extends State<UserCVView> {
  Map<String, dynamic>? cv;

  void navigateDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserCvDetailView(
          cv: cv,
        ),
      ),
    );
  }

  @override
  void initState() {
    cv = widget.cv;

    super.initState();
  }
}
