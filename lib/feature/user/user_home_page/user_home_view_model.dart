import 'package:flutter/material.dart';
import 'package:hrapp/feature/user/user_home_page/user_home_view.dart';
import 'package:hrapp/product/constant/colors.dart';

import '../../../product/data/company_repo/advert_repo.dart';

abstract class UserHomeViewModel extends State<UserHomeView> {
  FocusNode node = FocusNode();
  void saveJob(int index) async {
    setState(() {
      AdvertRepo.instance.saveJob(index);
    });
  }

  @override
  void initState() {
    node.addListener(refresh);
    super.initState();
  }

  List<Color> color = [MyColor.fuchsiaBlue, MyColor.butterflyBush, MyColor.darkLevander, MyColor.black];
  List imageList = [
    [
      "https://atiknakit.com/assets/images/atiknakitbeyaz.png",
      "Atık Nakit",
      "2 Yeni İlan",
    ],
    [
      "https://static.dezeen.com/uploads/2021/11/meta-facebook-rebranding-name-news_dezeen_2364_col_sq.jpg",
      "Meta",
      "3 Yeni İlan",
    ],
    [
      "https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1",
      "Google",
      "4 Yeni İlan",
    ],
    [
      "https://pbs.twimg.com/profile_images/1062993041324171265/CcUjyxc9_400x400.jpg",
      "Microsoft",
      "5 Yeni İlan",
    ]
  ];

  void refresh() {
    setState(() {});
  }
}
