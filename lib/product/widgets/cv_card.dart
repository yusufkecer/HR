import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/widgets/subtitle.dart';
import 'package:hrapp/product/widgets/text_with_icon.dart';

import '../constant/icons.dart';
import '../constant/string_data.dart';

class CVCard extends StatefulWidget {
  final void Function()? onTap;
  final Map<String, dynamic>? cv;
  final void Function()? deleteCv;
  final void Function()? updateCv;
  const CVCard({
    Key? key,
    required this.onTap,
    required this.cv,
    this.deleteCv,
    this.updateCv,
  }) : super(key: key);

  @override
  State<CVCard> createState() => _CVCardState();
}

class _CVCardState extends State<CVCard> with TickerProviderStateMixin {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const ProjectPadding.createJob(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: context.width,
            height: !isExpanded ? 95 : 300,
            decoration: const CVDecoration(),
            child: Stack(
              children: [
                Row(
                  children: [
                    Align(
                      alignment: !isExpanded ? Alignment.center : Alignment.topCenter,
                      child: Padding(
                        padding: const ProjectPadding.allTen().copyWith(top: !isExpanded ? 0 : 16, left: 13),
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            borderRadius: ProjectRadius.smallAll(),
                            image: DecorationImage(
                              image: NetworkImage(
                                ImagePath.temporaryImage,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const ProjectPadding.allTen().copyWith(top: !isExpanded ? 0 : 21, left: 13),
                        child: Column(
                          mainAxisAlignment: !isExpanded ? MainAxisAlignment.center : MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.cv?["information"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: ProjectFontSize.oneToTwo,
                              style: const TextStyle(fontWeight: Weight.midium),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Eğitim: ${widget.cv?["educations"].first["school"]}",
                              textScaleFactor: ProjectFontSize.oneToTwo,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(fontWeight: Weight.midium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    popupMenu(),
                  ],
                ),
                isExpanded
                    ? Padding(
                        padding: const ProjectPadding.allSixteen().copyWith(bottom: 40),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(12),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  child: SizedBox(
                                    height: 170,
                                    width: context.width,
                                    child: Column(
                                      children: [
                                        const Subtitle(title: StringData.levelD),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${widget.cv?["jobExperiences"].first["companyName"]}",
                                          style: const TextStyle(
                                            fontWeight: Weight.midium,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const ProjectPadding.leftFive(),
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        "Departman: ${widget.cv?["jobExperiences"].first["department"]}",
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding: const ProjectPadding.leftFive(),
                                                    child: Text(
                                                      "Pozisyon: ${widget.cv?["jobExperiences"].first["position"]}",
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: const ProjectPadding.leftFive(),
                                                      child: Text(
                                                        "Ayrılma Tarihi: ${widget.cv?["jobExperiences"].first["leaveWorkYear"]}",
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                color: Colors.black,
                                                height: 90,
                                                width: 1,
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  maxLines: 6,
                                                  overflow: TextOverflow.ellipsis,
                                                  "Açıklama: ${widget.cv?["jobExperiences"].first["description"]}",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                expandButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding popupMenu() {
    return Padding(
      padding: const ProjectPadding.rightEight().copyWith(top: 16),
      child: Align(
        alignment: Alignment.topRight,
        child: PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20).copyWith(
              topRight: const Radius.circular(0),
            ),
          ),
          color: Colors.grey.shade100,
          child: const Icon(
            MyIcons.popupMenu,
            color: MyColor.red,
          ),
          itemBuilder: (ctx) {
            return [
              popupItem(
                MyIcons.editNote,
                StringData.update,
                widget.updateCv,
                0,
              ),
              popupItem(
                MyIcons.delete,
                StringData.delete,
                widget.deleteCv,
                1,
              ),
            ];
          },
        ),
      ),
    );
  }

  PopupMenuItem popupItem(IconData icon, String info, void Function()? onTap, int value) {
    return PopupMenuItem(
      value: value,
      onTap: onTap,
      child: TextWithIcon(
        icon: icon,
        text: info,
      ),
    );
  }

  Padding expandButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 57.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: IconButton(
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          icon: Icon(
            !isExpanded ? MyIcons.downIOSIcon : MyIcons.upIOSIcon,
          ),
        ),
      ),
    );
  }
}

class CVDecoration extends BoxDecoration {
  const CVDecoration({Color cardColor = MyColor.white})
      : super(
          borderRadius: const ProjectRadius.mediumAll(),
          color: cardColor,
        );
}
