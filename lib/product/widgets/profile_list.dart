import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/models/worker_model/worker_model.dart';

import '../../core/constant/project_padding.dart';
import '../constant/colors.dart';

class ProfileList extends StatelessWidget {
  final double? aspectRatio;
  final bool? itemCount;
  final List<Worker>? workerList;
  final bool? check;
  final String? connectionError;
  final int maxLine = 6;
  const ProfileList({
    Key? key,
    this.aspectRatio,
    this.itemCount,
    this.workerList,
    this.check,
    this.connectionError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return workerList != null
        ? GridView.builder(
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
                  borderRadius: ProjectRadius.smallAll(),
                ),
                clipBehavior: Clip.antiAlias,
                child: ColoredBox(
                  color: MyColor.tints,
                  child: SizedBox(
                    child: Column(
                      children: [
                        profileImage(index, workerList!),
                        itemCount!
                            ? workerInfo(workerList!, index, StringData.info)
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  workerInfo(workerList!, index, StringData.info),
                                  Container(
                                    color: Colors.white,
                                    height: 120,
                                    width: 1.5,
                                  ),
                                  workerCV(workerList!, index, StringData.cv),
                                ],
                              )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : Padding(
            padding: const ProjectPadding.bottomTwentySix().copyWith(bottom: 50),
            child: SizedBox(
              child: Center(
                child: Text(
                  connectionError ?? "",
                  textScaleFactor: ProjectFontSize.oneToThree,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: MyColor.osloGrey),
                ),
              ),
            ),
          );
  }

  Widget workerCV(List<Worker> workerList, index, cv) {
    return Expanded(
      child: Padding(
        padding: const ProjectPadding.horizontalTwelve(),
        child: Column(
          crossAxisAlignment: itemCount! ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Text(
              cv,
              style: const TextStyle(fontWeight: Weight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              workerList[index].cv ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: maxLine,
            )
          ],
        ),
      ),
    );
  }

  Expanded workerInfo(List<Worker> workerList, int gridIndex, String info) {
    return Expanded(
      child: Padding(
        padding: const ProjectPadding.horizontalTwelve().copyWith(left: 22),
        child: Column(
          crossAxisAlignment: itemCount! ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Text(
              info,
              style: const TextStyle(fontWeight: Weight.bold),
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
                            overflow: TextOverflow.ellipsis,
                            maxLines: maxLine,
                          ),
                        )
                      : Text(
                          "${workerList[gridIndex].fullName}\n${workerList[gridIndex].department}\n${workerList[gridIndex].jobType}\n",
                          style: const TextStyle(fontWeight: Weight.normal),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
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




      