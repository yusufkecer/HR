import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/widgets/subtitle.dart';

import '../../core/extensions/date_extension.dart';
import '../Constant/colors.dart';
import '../constant/font_size.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  void initState() {
    getDatePeriod();
    super.initState();
  }

  String? imagePath;
  TimePeriod currentTime = TimePeriod.morning;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.rightEight(),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleWithName(),
            Image(
              image: AssetImage(imagePath!),
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  Padding titleWithName() {
    return Padding(
      padding: const ProjectPadding.allEight(),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Yusuf\n",
              style: TextStyle(color: MyColor.osloGrey, fontSize: 21),
            ),
            TextSpan(
              style: const TextStyle(fontWeight: Weight.midium, fontSize: 25, color: Colors.black),
              text: currentTime == TimePeriod.evening
                  ? TimePeriod.evening.time
                  : currentTime == TimePeriod.morning
                      ? TimePeriod.morning.time
                      : currentTime == TimePeriod.noon
                          ? TimePeriod.noon.time
                          : TimePeriod.night.time,
            ),
          ],
        ),
      ),
    );
  }

  Subtitle subTitle() {
    return Subtitle(
      fontSize: ProjectFontSize.oneToSix,
      title: currentTime == TimePeriod.evening
          ? TimePeriod.evening.time
          : currentTime == TimePeriod.morning
              ? TimePeriod.morning.time
              : currentTime == TimePeriod.noon
                  ? TimePeriod.noon.time
                  : TimePeriod.night.time,
    );
  }

  void getDatePeriod() {
    DateTime date = DateTime.now();
    int hour = date.hour;
    if (hour >= 7 && hour <= 11) {
      currentTime = TimePeriod.morning;
    } else if (hour >= 12 && hour <= 18) {
      currentTime = TimePeriod.noon;
    } else if (hour >= 19 && hour <= 22) {
      currentTime = TimePeriod.evening;
    } else {
      currentTime = TimePeriod.night;
    }
    getImge();
  }

  void getImge() {
    if (currentTime == TimePeriod.morning) {
      imagePath = "assets/images/morning.png";
    } else if (currentTime == TimePeriod.noon) {
      imagePath = "assets/images/noon.png";
    } else if (currentTime == TimePeriod.evening) {
      imagePath = "assets/images/evening.png";
    } else {
      imagePath = "assets/images/night.png";
    }
  }
}
