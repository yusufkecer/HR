import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/widgets/text_with_icon.dart';

import '../constant/icons.dart';
import '../constant/string_data.dart';

class CVCard extends StatefulWidget {
  const CVCard({super.key});

  @override
  State<CVCard> createState() => _CVCardState();
}

class _CVCardState extends State<CVCard> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const ProjectPadding.createJob(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: context.width,
          height: !isExpanded ? 95 : 200,
          decoration: const CVDecoration(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const ProjectPadding.allTen().copyWith(top: 0, left: 13),
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
                        padding: const ProjectPadding.allTen().copyWith(top: 0, left: 0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Full Stack Developer",
                                textScaleFactor: ProjectFontSize.oneToTwo,
                                style: TextStyle(fontWeight: Weight.midium),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Deneyim: 3 Yıl",
                                textScaleFactor: ProjectFontSize.oneToTwo,
                                style: TextStyle(fontWeight: Weight.midium),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const ProjectPadding.rightEight().copyWith(top: 10),
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
                                () {},
                                0,
                              ),
                              popupItem(
                                MyIcons.delete,
                                StringData.delete,
                                () {},
                                1,
                              ),
                            ];
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 57.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: const Icon(
                      MyIcons.downIOSIcon,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem popupItem(IconData icon, String info, Function? onTap, int value) {
    return PopupMenuItem(
        value: value,
        child: TextWithIcon(
          icon: icon,
          text: info,
        ),
        onTap: () {});
  }
}

class CVDecoration extends BoxDecoration {
  const CVDecoration({Color cardColor = MyColor.white})
      : super(
          borderRadius: const ProjectRadius.mediumAll(),
          color: cardColor,
        );
}
