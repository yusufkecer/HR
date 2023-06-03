import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/feature/company/company_profile/company_profile_view.dart';
import 'package:hrapp/feature/user/user_advert_detail/user_advert_detail_view.dart';
import 'package:hrapp/feature/user/user_home_page/user_home_view_model.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/widgets/not_found.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/models/general_company_model.dart';
import '../../../product/widgets/subtitle.dart';
import '../../../product/widgets/time.dart';

class UserHomeView extends StatefulWidget {
  final List<Job>? topJobList;
  final List<Job>? topCompany;
  const UserHomeView({
    Key? key,
    this.topJobList,
    this.topCompany,
  }) : super(key: key);

  @override
  State<UserHomeView> createState() => UserHomeViewState();
}

class UserHomeViewState extends UserHomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.horizontalFive(),
      child: ListView(
        shrinkWrap: true,
        children: [
          const Time(),
          searchBar(),
          const Subtitle(
            title: StringData.topCompany,
          ),
          const SizedBox(
            height: 8,
          ),
          topCompany(),
          const Subtitle(
            title: StringData.topAdvert,
          ),
          const SizedBox(
            height: 8,
          ),
          advertList()
        ],
      ),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: const ProjectPadding.allEight().copyWith(top: 0),
      child: Row(
        children: [
          searchfied(),
          const SizedBox(
            width: 10,
          ),
          filter()
        ],
      ),
    );
  }

  Expanded searchfied() {
    return Expanded(
      child: Container(
        decoration: const DecorationUserHome(),
        child: Theme(
          data: ThemeData(
            colorScheme: ThemeData().colorScheme.copyWith(primary: MyColor.black),
          ),
          child: TextField(
            focusNode: node,
            decoration: const InputDecoration(
              hintText: StringData.search,
              prefixIcon: Icon(MyIcons.search),
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Padding filter() {
    return Padding(
      padding: const ProjectPadding.allEight().copyWith(right: 0, left: 0),
      child: Ink(
        width: 60,
        height: 60,
        decoration: const DecorationUserHome(),
        child: InkWell(
          customBorder: const RoundedRectangleBorder(
            borderRadius: ProjectRadius.mediumAll(),
          ),
          onTap: () {},
          child: Icon(
            MyIcons.filter,
            color: node.hasFocus == true ? MyColor.black : MyColor.osloGrey,
          ),
        ),
      ),
    );
  }

  Widget topCompany() {
    return widget.topCompany != null
        ? SizedBox(
            height: 160,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: color.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const ProjectPadding.allEight(),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompanyProfileView(
                            companyInfo: widget.topCompany?[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: DecorationUserHome(decorationColor: color[index]),
                      width: 130,
                      child: Column(
                        children: [
                          Padding(
                            padding: const ProjectPadding.allEight().copyWith(top: 13),
                            child: const SizedBox(
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: ProjectRadius.smallAll(),
                                child: Image(
                                  image: NetworkImage(ImagePath.temporaryImage),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const ProjectPadding.allEight().copyWith(top: 0),
                            child: Text(
                              widget.topCompany![index].companyName ?? "",
                              textScaleFactor: ProjectFontSize.oneToFour,
                              style: const TextStyle(color: MyColor.white),
                            ),
                          ),
                          Text(
                            widget.topCompany![index].sector?.first ?? "Yazılım",
                            textScaleFactor: ProjectFontSize.oneToTwo,
                            style: TextStyle(color: MyColor.white.withOpacity(.8)),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : Padding(
            padding: const ProjectPadding.allEight().copyWith(bottom: 0),
            child: const NotFound(
              text: StringData.notFoundCompany,
              padding: 0,
            ),
          );
  }

  Widget advertList() {
    return widget.topJobList != null
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserAdvertDetailView(
                        job: widget.topJobList?[index],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const ProjectPadding.allEight(),
                  child: Container(
                    height: 100,
                    decoration: const DecorationUserHome(),
                    child: ListTile(
                      title: Row(
                        children: [
                          const Image(
                            height: 65,
                            width: 65,
                            image: NetworkImage(
                              ImagePath.temporaryImage,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    widget.topJobList![index].jobTitle!,
                                    textScaleFactor: ProjectFontSize.oneToTwo,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: 30,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: const ProjectRadius.verySmallAll(),
                                      color: MyColor.lightPurple,
                                    ),
                                    child: Center(
                                      child: Text(widget.topJobList![index].timing!),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              iconSize: 32,
                              onPressed: () {},
                              icon: const Icon(MyIcons.save),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Padding(
            padding: const ProjectPadding.allEight().copyWith(bottom: 0),
            child: const NotFound(
              text: StringData.notFoundAdvert,
              padding: 0,
            ),
          );
  }
}

class DecorationUserHome extends BoxDecoration {
  const DecorationUserHome({decorationColor = MyColor.white})
      : super(borderRadius: const ProjectRadius.mediumAll(), color: decorationColor);
}
