import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/weight.dart';

import '../../core/constant/project_padding.dart';

class ProfileList extends StatelessWidget {
  final String? image;
  final String? userName;
  final String? userSurName;
  final String? department;
  final String? experience;
  final String? jobType;
  final String? jobPosition;
  final bool? itemCount;
  const ProfileList({
    Key? key,
    this.image = "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
    this.userName = "Yusuf",
    this.userSurName = "Keçer",
    this.department = "Yazılım Departmanı",
    this.experience = "3 Yıl Deneyimli",
    this.jobType = "Tam Zamanlı",
    this.jobPosition = "Web Geliştirici",
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List worker = [("${userName!} ${userSurName!}"), department, jobPosition, experience, jobType];
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: ProjectBorders.smallAll(),
      ),
      clipBehavior: Clip.antiAlias,
      child: ColoredBox(
        color: MyColor.tints,
        child: SizedBox(
          child: Column(
            children: [
              profileImage(),
              itemCount!
                  ? workerInfo(worker)
                  : Row(
                      children: [
                        workerInfo(worker),
                        Container(
                          color: Colors.white,
                          height: 120,
                          width: 1.5,
                        ),
                        workerInfo(worker),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Expanded workerInfo(List<dynamic> worker) {
    return Expanded(
      child: Padding(
        padding: const ProjectPadding.horizontalTwelve(),
        child: Column(
          crossAxisAlignment: itemCount! ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            const Text(
              "Bilgiler",
              style: TextStyle(fontWeight: Weight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemCount! ? 3 : worker.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: itemCount! ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${worker[index]}",
                        style: const TextStyle(fontWeight: Weight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }

  Padding profileImage() {
    return Padding(
      padding: const ProjectPadding.allEight().copyWith(bottom: 4),
      child: SizedBox(
        height: 55,
        width: 55,
        child: CircleAvatar(
          backgroundImage: NetworkImage(image!),
        ),
      ),
    );
  }
}
 // child: ListTile(
        //   leading: CircleAvatar(
        //     backgroundImage: NetworkImage(
        //       image!,
        //     ),
        //   ),
        //   title: Text(
        //     userName ?? "-",
        //   ),
        //   subtitle: Text(
        //     department ?? "-",
        //   ),
        // ),