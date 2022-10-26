import 'package:flutter/material.dart';

import '../../Product/Constant/colors.dart';
import '../../Product/widgets/sized_box/box_space.dart';
import '../../product/Constant/weight.dart';
import '../../product/constant/font_Size.dart';
import '../Constant/radius.dart';
import '../Constant/size.dart';
import '../constant/edge_insets.dart';

class NavigationService {
  showBottomModal(context, String title, String subtitle) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape:
          const RoundedRectangleBorder(borderRadius: ProjectBorders.bigOnly()),
      builder: (context) => DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                const Positioned(
                  top: -15,
                  child: SizedBox(
                    height: 7,
                    width: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: ProjectBorders.mediumAll(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const ProjectPadding.allEightteen().copyWith(
                    bottom: const ProjectPadding.edgeZero().bottom,
                  ),
                  child: ListView(
                    controller: scrollController,
                    shrinkWrap: true,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: ProjectFontSize.mainSize,
                            fontWeight: Weight.bold),
                      ),
                      BoxSpace(
                        height: ProjectSize.normalHeight().height,
                      ),
                      Text(
                        subtitle,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: ProjectFontSize.mainSize,
                          fontWeight: Weight.light,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
