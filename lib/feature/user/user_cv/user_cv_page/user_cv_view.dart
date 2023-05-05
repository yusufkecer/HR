import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/feature/user/user_cv/user_create_cv/user_create_cv_view.dart';
import 'package:hrapp/product/widgets/cv_card.dart';
import 'package:hrapp/product/widgets/subtitle.dart';

import '../../../../product/widgets/not_found.dart';

class UserCVView extends StatefulWidget {
  const UserCVView({super.key});

  @override
  State<UserCVView> createState() => _UserCVViewState();
}

class _UserCVViewState extends State<UserCVView> {
  List cv = ["1"];
  @override
  Widget build(BuildContext context) {
    return cv.isNotEmpty
        ? ListView(
            children: [
              Padding(
                padding: const ProjectPadding.createJob().copyWith(top: 0, bottom: 5),
                child: const Subtitle(title: "Özgeçmişlerim"),
              ),
              const CVCard(),
            ],
          )
        : GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserCreateCvView(),
                ),
              );
            },
            child: const NotFound(
              text: "Özgeçmiş bulunamadı.\nResime tıklayıp hemen oluşturun!",
            ),
          );
  }
}
