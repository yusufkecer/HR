import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/feature/user/user_home_page/user_home_view_model.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/weight.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/widgets/subtitle.dart';

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
          userName(),
          const Subtitle(
            fontSize: ProjectFontSize.oneToFive,
            title: StringData.welcomeToUser,
          ),
          searchBar(),
          const Subtitle(
            title: StringData.topCompany,
          ),
          topCompany(),
          const Subtitle(title: StringData.advert),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: const DecorationUserHome(),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(imageList[2][0]),
                  ),
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Full Stack Developer",
                            textScaleFactor: ProjectFontSize.oneToTwo,
                            style: TextStyle(fontWeight: Weight.bold),
                          ),
                          IconButton(onPressed: () {}, icon: const Icon(MyIcons.save))
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: ProjectRadius.verySmallAll(),
                            color: Colors.purple.withOpacity(.1),
                          ),
                          child: const Center(child: Text("Tam Zamanlı")),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding userName() {
    return Padding(
      padding: const ProjectPadding.allEight().copyWith(bottom: 0, top: 3),
      child: const Text(
        "Yusuf",
        textScaleFactor: ProjectFontSize.oneToThree,
        style: TextStyle(color: MyColor.osloGrey),
      ),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: const ProjectPadding.allEight(),
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
}

class DecorationUserHome extends BoxDecoration {
  const DecorationUserHome({decorationColor = MyColor.white})
      : super(borderRadius: const ProjectRadius.mediumAll(), color: decorationColor);
}
