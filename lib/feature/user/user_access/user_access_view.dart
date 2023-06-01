import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/feature/user/user_access/user_access_view_model.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/uri.dart';

import '../../../product/constant/string_data.dart';
import '../../../product/widgets/user_profile_settings.dart';
import '../user_profile/user_profile_view.dart';

class UserAccess extends StatefulWidget {
  final Map<String, dynamic>? userInfo;
  const UserAccess({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<UserAccess> createState() => _UserAccessState();
}

class _UserAccessState extends UserAccessViewModel {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserProfileSettings(
          ontap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserProfileView(
                  userInfo: widget.userInfo,
                ),
              ),
            );
          },
          leading: MyIcons.user,
          title: "Profil",
          trailing: MyIcons.nextIOSIcon,
        ),
        UserProfileSettings(
          ontap: () {},
          leading: MyIcons.company,
          title: "Başvurduğum İlanlar",
          trailing: MyIcons.nextIOSIcon,
        ),
        UserProfileSettings(
          ontap: () {},
          leading: MyIcons.saved,
          title: "Favori İlanlarım",
          trailing: MyIcons.nextIOSIcon,
        ),
        UserProfileSettings(
          ontap: () {},
          leading: MyIcons.wage,
          title: "Gelir Vergisi Hesapla",
          trailing: MyIcons.nextIOSIcon,
        ),
        UserProfileSettings(
          ontap: () async {
            final Uri url = Uri.https(WebUri.contactUs, "/contact");
            await launchUrl(url);
          },
          leading: MyIcons.message,
          title: "İletişim ",
          trailing: MyIcons.nextIOSIcon,
        ),
        UserProfileSettings(
          ontap: () {},
          leading: MyIcons.settings,
          title: "Ayarlar",
          trailing: MyIcons.nextIOSIcon,
        ),
        SizedBox(
          height: 70,
          child: Padding(
            padding: const ProjectPadding.allTwelve(),
            child: InkWell(
              onTap: logOut,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MyIcons.logout,
                    size: 27,
                    color: MyColor.red,
                  ),
                  Text(
                    " ${StringData.logout}",
                    textScaleFactor: ProjectFontSize.oneToOne,
                    style: TextStyle(color: MyColor.red),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
