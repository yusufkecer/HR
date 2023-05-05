import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../Product/Constant/colors.dart';
import '../../../product/models/general_company_model.dart';

class UserAdvertDetailView extends StatefulWidget {
  final Job? job;
  const UserAdvertDetailView({
    Key? key,
    this.job,
  }) : super(key: key);

  @override
  State<UserAdvertDetailView> createState() => _UserAdvertDetailViewState();
}

class _UserAdvertDetailViewState extends State<UserAdvertDetailView> {
  @override
  Widget build(BuildContext context) {
    print(widget.job);
    return const Scaffold(
      backgroundColor: MyColor.backgroundColor,
    );
  }
}
