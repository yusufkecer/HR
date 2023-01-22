import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/models/worker_model/worker_model.dart';

import '../../core/constant/project_padding.dart';

class ProfileList extends StatelessWidget {
  final double? aspectRatio;
  final bool? itemCount;
  final List<Worker>? workerList;
  final bool? check;
  const ProfileList({
    Key? key,
    this.aspectRatio,
    this.itemCount,
    this.workerList,
    this.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const ProjectPadding.bottomTwentySix(),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: check! ? aspectRatio! : aspectRatio! * 1.5,
        crossAxisCount: check! ? 2 : 1,
      ),
      itemCount: workerList != null ? workerList!.length : 0,
      itemBuilder: (context, index) {
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
                  workerList != null ? profileImage(index, workerList!) : const SizedBox(),
                  workerList != null
                      ? itemCount!
                          ? workerInfo(workerList!, index)
                          : Row(
                              children: [
                                workerInfo(workerList!, index),
                                Container(
                                  color: Colors.white,
                                  height: 120,
                                  width: 1.5,
                                ),
                                workerInfo(workerList!, index),
                              ],
                            )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded workerInfo(List<Worker> workerList, int gridIndex) {
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




      