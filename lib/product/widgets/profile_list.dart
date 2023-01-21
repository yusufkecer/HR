import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/models/worker_model/worker_model.dart';

import '../../core/constant/project_padding.dart';

class ProfileList extends StatelessWidget {
  final String? image;
  final int? gridIndex;
  final String? userName;
  final String? userSurName;
  final String? department;
  final String? experience;
  final String? jobType;
  final String? jobPosition;
  final bool? itemCount;
  final List<Worker>? workerList;
  const ProfileList({
    Key? key,
    this.image = "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
    this.gridIndex,
    this.userName = "Yusuf",
    this.userSurName = "Keçer",
    this.department = "Yazılım Departmanı",
    this.experience = "3 Yıl Deneyimli",
    this.jobType = "Tam Zamanlı",
    this.jobPosition = "Web Geliştirici",
    this.itemCount,
    this.workerList,
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
              workerList != null ? profileImage(gridIndex!, workerList!) : SizedBox(),
              workerList != null
                  ? itemCount!
                      ? workerInfo(worker, workerList!, gridIndex!)
                      : Row(
                          children: [
                            workerInfo(worker, workerList!, gridIndex!),
                            Container(
                              color: Colors.white,
                              height: 120,
                              width: 1.5,
                            ),
                            workerInfo(worker, workerList!, gridIndex!),
                          ],
                        )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Expanded workerInfo(List<dynamic> worker, List<Worker> workerList, int gridIndex) {
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
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  !itemCount!
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${workerList[gridIndex].fullName}\n${workerList[gridIndex].department}\n${workerList[gridIndex].jobType}\n"
                            "${workerList[gridIndex].jobPosition}\n${workerList[gridIndex].experience}",
                            style: const TextStyle(fontWeight: Weight.normal),
                            textAlign: TextAlign.start,
                          ),
                        )
                      : Text(
                          "${workerList[gridIndex].fullName}\n${workerList[gridIndex].department}\n${workerList[gridIndex].jobType}\n",
                          style: const TextStyle(fontWeight: Weight.normal),
                          textAlign: TextAlign.start,
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding profileImage(int i, List<Worker> list) {
    return Padding(
      padding: const ProjectPadding.allEight().copyWith(bottom: 4),
      child: SizedBox(
        height: 55,
        width: 55,
        child: CircleAvatar(
          backgroundImage: NetworkImage(list[i].image!),
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