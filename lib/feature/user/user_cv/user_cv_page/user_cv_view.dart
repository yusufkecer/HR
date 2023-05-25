import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/feature/user/user_cv/user_cv_page/user_cv_view_model.dart';
import 'package:hrapp/product/widgets/cv_card.dart';
import 'package:hrapp/product/widgets/subtitle.dart';
import '../../../../product/widgets/not_found.dart';

class UserCVView extends StatefulWidget {
  final Future<void> Function() getCv;
  final Map<String, dynamic>? cv;
  const UserCVView({
    Key? key,
    required this.getCv,
    this.cv,
  }) : super(key: key);

  @override
  State<UserCVView> createState() => _UserCVViewState();
}

class _UserCVViewState extends UserCvViewModel {
  @override
  Widget build(BuildContext context) {
    return widget.cv != null
        ? RefreshIndicator(
            onRefresh: widget.getCv,
            child: ListView(
              children: [
                Padding(
                  padding: const ProjectPadding.createJob().copyWith(top: 0, bottom: 5),
                  child: const Subtitle(title: "Özgeçmişlerim"),
                ),
                CVCard(
                  cv: widget.cv!,
                  onTap: navigateDetail,
                  deleteCv: deleteCv,
                  updateCv: () {
                    navigateCreateCv(widget.cv);
                  },
                ),
              ],
            ),
          )
        : RefreshIndicator(
            onRefresh: widget.getCv,
            child: ListView(
              children: [
                SizedBox(
                  height: context.height * 0.7,
                  child: GestureDetector(
                    onTap: () {
                      navigateCreateCv({});
                    },
                    child: const NotFound(
                      text: "Özgeçmiş bulunamadı.\nResime tıklayıp hemen oluşturun!",
                      padding: 0,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
