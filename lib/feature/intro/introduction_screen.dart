import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/core/constant/size.dart';
import 'package:hrapp/feature/auth/chose_auth.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../Product/Constant/colors.dart';
import '../../core/navigation/local_service.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        curve: Curves.easeInCirc,
        pages: [
          pageView(StringData.titleFirst, StringData.subtitleFirst, ImagePath.contact),
          pageView(StringData.titleSecond, StringData.subtitleSecond, ImagePath.join),
          pageView(StringData.titleEnd, StringData.subtitleEnd, ImagePath.user),
        ],
        done: doneText(),
        dotsDecorator: dotsDecorator(),
        showBackButton: true,
        next: routeButton(MyIcons.nextIOSIcon),
        back: routeButton(MyIcons.backIOSIcon),
        onDone: () {
          LocalStorage.instance.setBool("isFirstTime", true);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const ChoseAuth(),
              ),
              (route) => false);
        },
        controlsPadding: const ProjectPadding.allEight(),
      ),
    );
  }

  SizedBox routeButton(IconData routeIcon) {
    return SizedBox(
      height: ProjectSize.veryBigHeight().height,
      child: Icon(
        routeIcon,
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
      imagePadding: const ProjectPadding.edgeZero(),
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
        borderRadius: ProjectRadius.bigAll(),
      ),
    );
  }
}
