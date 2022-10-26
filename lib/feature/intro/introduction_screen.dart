import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/edge_insets.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/core/constant/size.dart';
import 'package:hrapp/feature/auth/login_page.dart';
import 'package:hrapp/product/constant/assets.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        curve: Curves.easeInCirc,
        pages: [
          pageView(StringData.titleFirst, StringData.subtitleFirst,
              MyAssets.contact),
          pageView(
              StringData.titleSecond, StringData.subtitleSecond, MyAssets.join),
          pageView(
              StringData.titleEnd, StringData.subtitleEnd, MyAssets.programmer),
        ],
        done: doneText(),
        dotsDecorator: dotsDecorator(),
        onDone: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false);
        },
        controlsPadding: const ProjectPadding.topEight(),
      ),
    );
  }

  SizedBox nextButton(int initialPage) {
    return SizedBox(
      height: ProjectSize.veryBigHeight().height,
      child: const Icon(
        MyIcons.arrowIOSIcon,
      ),
    );
  }

  SizedBox doneText() {
    return SizedBox(
      height: ProjectSize.veryBigHeight().height,
      child: const Text(
        StringData.done,
        style: TextStyle(
          fontSize: ProjectFontSize.normalSize,
        ),
      ),
    );
  }

  PageViewModel pageView(String title, String subtitle, String images) {
    return PageViewModel(
      title: pageViewInfo(
        title,
      ),
      body: pageViewInfo(
        subtitle,
      ),
      image: image(images),
      decoration: decorationText(),
    );
  }

  Image image(String myImage) {
    return Image.asset(myImage);
  }

  String pageViewInfo(String info) {
    return info;
  }

  PageDecoration decorationText() {
    return PageDecoration(
      titleTextStyle: const TextStyle(
        fontSize: ProjectFontSize.introSize,
        fontWeight: Weight.bold,
      ),
      imagePadding: EdgeInsets.zero,
      titlePadding: const ProjectPadding.allEight().copyWith(bottom: 0),
      bodyPadding: const ProjectPadding.allEight().copyWith(bottom: 0),
      bodyTextStyle: const TextStyle(
        fontSize: ProjectFontSize.bigSize,
      ),
    );
  }

  DotsDecorator dotsDecorator() {
    return const DotsDecorator(
      color: MyColor.osloGrey,
      activeColor: MyColor.purplishBlue,
      size: Size(10, 10),
      activeSize: Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: ProjectBorders.bigAll(),
      ),
    );
  }
}
