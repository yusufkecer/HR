import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/models/worker_model/worker_model.dart';
import 'package:hrapp/product/widgets/button/icon_button.dart';
import 'package:hrapp/product/widgets/popular_adverts.dart';
import 'package:hrapp/product/widgets/profile_list.dart';
import 'package:hrapp/product/widgets/subtitle.dart';
import 'package:hrapp/product/widgets/text_field/search_field.dart';
import '../../../product/models/general_company_model.dart';
import 'company_home_view_model.dart';

class CompanyHomeView extends StatefulWidget {
  final List<Worker>? workers;
  final List<Job>? topJobList;
  final String? connectionError;
  const CompanyHomeView({
    Key? key,
    this.workers,
    required this.topJobList,
    required this.connectionError,
  }) : super(key: key);

  @override
  State<CompanyHomeView> createState() => _CompanyHomeViewState();
}

class _CompanyHomeViewState extends CompanyHomeViewModel {
  @override
  Widget build(BuildContext context) {
    print("home top job list" + widget.topJobList.toString());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: const ProjectPadding.horizontalFive(),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: SearchField(),
            ),
            widget.topJobList != null
                ? Column(
                    children: [
                      topJobsTitle(),
                      PopularAdverts(advertInfo: widget.topJobList, saveButton: saveJob),
                    ],
                  )
                : const SizedBox(),
            widget.workers != null
                ? Column(
                    children: [
                      companyWorkerTitle(),
                      companyWorkers(),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Subtitle topJobsTitle() {
    return const Subtitle(
      title: StringData.popularJobs,
    );
  }

  Row companyWorkerTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Subtitle(
          title: StringData.companyWorker,
        ),
        ChangeIconButton(
          buttonIcon: MyIcons.grid,
          changeIcon: MyIcons.list,
          buttonTooltip: StringData.changeView,
          change: check,
          pressButton: changeCheck,
        )
      ],
    );
  }

  Padding companyWorkers() {
    return Padding(
      padding: const ProjectPadding.horizontalFive(),
      child: ProfileList(
        connectionError: widget.connectionError,
        check: check,
        aspectRatio: aspectRatio,
        workerList: widget.workers,
        itemCount: check,
      ),
    );
  }
}
//170 250