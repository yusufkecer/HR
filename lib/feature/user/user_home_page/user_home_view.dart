import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/feature/user/user_home_page/user_home_view_model.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/icons.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/widgets/subtitle.dart';
import '../../../product/widgets/time.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

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

  SizedBox topCompany() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: imageList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const ProjectPadding.allEight(),
            child: Container(
              decoration: DecorationUserHome(decorationColor: color[index]),
              width: 130,
              child: Column(
                children: [
                  Padding(
                    padding: const ProjectPadding.allEight().copyWith(top: 13),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image(
                        image: NetworkImage(imageList[index][0]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const ProjectPadding.allEight().copyWith(top: 0),
                    child: Text(
                      imageList[index][1],
                      textScaleFactor: ProjectFontSize.oneToFour,
                      style: const TextStyle(color: MyColor.white),
                    ),
                  ),
                  Text(
                    imageList[index][2],
                    textScaleFactor: ProjectFontSize.oneToTwo,
                    style: TextStyle(color: MyColor.white.withOpacity(.8)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ListView advertList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            decoration: const DecorationUserHome(),
            child: ListTile(
              title: Row(
                children: [
                  Image(
                    height: 65,
                    width: 65,
                    image: NetworkImage(
                      imageList[index][0],
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
                            adverts[index],
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
                            child: const Center(child: Text("Tam Zamanlı")),
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
        );
      },
    );
  }
}

class DecorationUserHome extends BoxDecoration {
  const DecorationUserHome({decorationColor = MyColor.white})
      : super(borderRadius: const ProjectRadius.mediumAll(), color: decorationColor);
}
