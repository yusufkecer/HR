import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/edge_insets.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/data/company_repo/company_repo.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/button/icon_button.dart';
import 'package:hrapp/product/widgets/nav_bar.dart';

class CompanyHomePage extends StatefulWidget {
  const CompanyHomePage({super.key});

  @override
  State<CompanyHomePage> createState() => _CompanyHomePageState();
}

class _CompanyHomePageState extends State<CompanyHomePage> {
  Map bottomBar = {
    StringData.homePage: MyIcons.home,
    StringData.postings: MyIcons.list,
  };
  int cardCount = 4;
  bool save = false;
  List<Company> jobInfo = CompanyRepo().companys.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SafeArea(child: Text("blabla")),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        title: const AppBarLogoTitle(),
        iconTheme: const IconThemeData(
          color: MyColor.fuchsiaBlueLight,
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: ProjectPadding.allEight(),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                ImagePath.temporaryImage,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const ProjectPadding.allEight().copyWith(bottom: 0),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                StringData.popularJobs,
                textScaleFactor: ProjectFontSize.oneToThree,
                style: TextStyle(
                  fontWeight: Weight.midium,
                ),
              ),
            ),
          ),
          topJobs(),
          companyWorkerTitle(),
          companyWorkers()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingButton(),
      bottomNavigationBar: NavBar(
        navBarItem: bottomBar,
      ),
    );
  }

  Expanded companyWorkers() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const ListTile();
        },
      ),
    );
  }

  Padding companyWorkerTitle() {
    return const Padding(
      padding: ProjectPadding.allEight(),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          StringData.companyWorker,
          textScaleFactor: ProjectFontSize.oneToThree,
          style: TextStyle(
            fontWeight: Weight.midium,
          ),
        ),
      ),
    );
  }

  SizedBox topJobs() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.allEight(),
            child: Container(
              width: 280,
              decoration: const BoxDecoration(
                borderRadius: ProjectBorders.mediumAll(),
                color: MyColor.tints,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  saveJobButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      jobImage(index),
                      jobTitle(index),
                    ],
                  ),
                  skills(index),
                  jobWage(index)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Align saveJobButton() {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        child: ProjectIconButton(
          buttonIcon: MyIcons.saveAdd,
          changeIcon: MyIcons.saved,
          buttonTooltip: StringData.save,
          pressButton: saveJob,
          change: save,
        ),
      ),
    );
  }

  Padding jobImage(int index) {
    return Padding(
      padding: const ProjectPadding.allEightTeen(),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              jobInfo[index].companyImage ?? "",
            ),
          ),
          borderRadius: const ProjectBorders.smallAll(),
          color: Colors.transparent,
        ),
      ),
    );
  }

  Text jobTitle(int index) {
    return Text(
      jobInfo[index].jobModel?.jobTitle ?? "-",
      textScaleFactor: ProjectFontSize.oneToTwo,
      style: const TextStyle(
        fontWeight: Weight.midium,
      ),
    );
  }

  Padding jobWage(int index) {
    return Padding(
      padding: const ProjectPadding.allEight().copyWith(left: 18),
      child: Text(
        "₺ ${jobInfo[index].jobModel?.wage?.toDouble().toStringAsFixed(3) ?? "-"}/Ay",
        style: const TextStyle(fontWeight: Weight.midium),
      ),
    );
  }

  SizedBox skills(parentIndex) {
    return SizedBox(
      height: 39,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount:
            jobInfo[parentIndex].jobModel!.skills!.length > 3 ? 3 : jobInfo[parentIndex].jobModel!.skills!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.allEight().copyWith(left: index == 0 ? 18 : 0, top: 0),
            child: Container(
              padding: const ProjectPadding.allEight(),
              decoration: const BoxDecoration(
                borderRadius: ProjectBorders.verySmallAll(),
                color: MyColor.white,
              ),
              child: Text(
                jobInfo[parentIndex].jobModel!.skills![index],
                textScaleFactor: ProjectFontSize.zeroToNine,
              ),
            ),
          );
        },
      ),
    );
  }

  Transform floatingButton() {
    return Transform.translate(
      offset: const Offset(8, 0),
      child: FloatingActionButton(
        backgroundColor: MyColor.discovreyPurplishBlue,
        onPressed: () {},
        child: const Icon(MyIcons.add),
      ),
    );
  }

  void saveJob() {
    setState(() {
      save = !save;
    });
  }
}
//170 250