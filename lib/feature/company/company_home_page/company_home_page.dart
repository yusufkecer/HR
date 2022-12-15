import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/edge_insets.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/data/company_repo/company_repo.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
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
  int parentIndex = 0;
  bool save = false;
  List<Company> jobInfo = CompanyRepo().companys.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(child: Text(parentIndex.toString())),
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
            padding: EdgeInsets.all(8.0),
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
            padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                StringData.popularJobs,
                textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: Weight.midium,
                ),
              ),
            ),
          ),
          topJobs(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                StringData.companyWorker,
                textScaleFactor: 1.3,
                style: TextStyle(fontWeight: Weight.midium),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const ListTile();
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingButton(),
      bottomNavigationBar: NavBar(
        navBarItem: bottomBar,
      ),
    );
  }

  SizedBox topJobs() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          parentIndex = index;
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            save = !save;
                          });
                        },
                        icon: Icon(
                          save == false ? MyIcons.saveAdd : MyIcons.saved,
                          color: MyColor.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
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
                      ),
                      Text(
                        jobInfo[index].jobModel?.jobTitle ?? "-",
                        textScaleFactor: 1.2,
                        style: const TextStyle(
                          fontWeight: Weight.midium,
                        ),
                      ),
                    ],
                  ),
                  skills(),
                  Padding(
                    padding: const ProjectPadding.allEight().copyWith(left: 18),
                    child: Text(
                      "\$ ${jobInfo[index].jobModel?.wage?.toDouble().toStringAsFixed(3) ?? "-"} /Ay",
                      style: const TextStyle(fontWeight: Weight.midium),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox skills() {
    return SizedBox(
      height: 39,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: jobInfo[parentIndex].jobModel!.skills!.length > 3
            ? 3
            : jobInfo[parentIndex].jobModel!.skills!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.allEight()
                .copyWith(left: index == 0 ? 18 : 0, top: 0),
            child: Container(
              padding: const ProjectPadding.allEight(),
              decoration: const BoxDecoration(
                borderRadius: ProjectBorders.verySmallAll(),
                color: MyColor.white,
              ),
              child: Text(
                jobInfo[parentIndex].jobModel!.skills![index],
                textScaleFactor: 0.9,
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
}
//170 250