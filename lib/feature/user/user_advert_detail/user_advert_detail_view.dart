import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/company/company_profile/company_profile_view.dart';
import 'package:hrapp/feature/user/user_advert_detail/user_advert_detail_view_model.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/constant/weight.dart';
import 'package:hrapp/product/service/data_service.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/button/elevated_icon.dart';
import 'package:hrapp/product/widgets/subtitle.dart';
import '../../../Product/Constant/colors.dart';
import '../../../product/constant/icons.dart';
import '../../../product/models/general_company_model.dart';
import '../../../product/service/api.dart';

class UserAdvertDetailView extends StatefulWidget {
  final Job? job;
  const UserAdvertDetailView({
    Key? key,
    this.job,
  }) : super(key: key);

  @override
  State<UserAdvertDetailView> createState() => _UserAdvertDetailViewState();
}

class _UserAdvertDetailViewState extends UserAdvertDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      appBar: AppBar(
        title: const AppBarLogoTitle(),
        actions: [
          IconButton(
            onPressed: () async {
              Job? companyInfo;
              DataService dt = DataService();
              NavigationService nav = NavigationService();
              nav.showLoading();
              try {
                var res = await dt.fetchData(ApiUri.companyInfoById + widget.job!.companyId.toString());
                print(res);
                nav.hideLoading();
                if (res == null) {
                  nav.alertWithButon(StringData.error, StringData.infoNotAvaible);

                  return;
                }

                Map<String, dynamic> data = res["data"];
                companyInfo = Job.fromJsonCompanyInfo(data);
              } catch (e) {
                rethrow;
              }

              Future(() => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CompanyProfileView(companyInfo: companyInfo),
                    ),
                  ));
            },
            icon: const Icon(MyIcons.company),
          ),
        ],
      ),
      body: Padding(
        padding: const ProjectPadding.allTwelve().copyWith(top: 0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: context.height - 154,
              width: context.width,
              decoration: const BoxDecoration(
                color: MyColor.white,
                borderRadius: ProjectRadius.mediumAll(),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: ProjectPadding.allEight(),
                      child: ClipRRect(
                        borderRadius: ProjectRadius.smallAll(),
                        child: Image(
                          height: 90,
                          image: NetworkImage(ImagePath.temporaryImage),
                        ),
                      ),
                    ),
                    Text(
                      widget.job?.companyName ?? "",
                      style: const TextStyle(fontWeight: Weight.midium),
                      textScaleFactor: ProjectFontSize.oneToThree,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: ProjectPadding.horizontalTwelve(),
                      child: Divider(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Subtitle(title: "Aranan Nitelikler"),
                    ),
                    Padding(
                      padding: const ProjectPadding.allEight().copyWith(left: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            advertInfo("Pozisyon: ", widget.job?.jobTitle ?? ""),
                            const SizedBox(
                              height: 8,
                            ),
                            advertInfo("Aranan Yetenekler: ", widget.job?.skills?.join(", ") ?? ""),
                            const SizedBox(
                              height: 8,
                            ),
                            advertInfo("Çalışma Türü: ", widget.job?.timing ?? ""),
                            const SizedBox(
                              height: 8,
                            ),
                            advertInfo("Açık Pozisyon Sayısı: ", widget.job?.positionOpen.toString() ?? ""),
                            const SizedBox(
                              height: 8,
                            ),
                            advertInfo("Tecrübe: ", widget.job?.level ?? ""),
                            const SizedBox(
                              height: 8,
                            ),
                            advertInfo("Şehir: ", widget.job?.province ?? ""),
                            const SizedBox(
                              height: 8,
                            ),
                            advertInfo("Son Başvuru Tarihi: ", date ?? ""),
                            const SizedBox(
                              height: 8,
                            ),
                            advertInfo(
                              "Maaş: ",
                              "${widget.job?.currency}${widget.job?.lowerWage} - ${widget.job?.upperWage}",
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            advertInfo(
                              "Açıklama: ",
                              "${widget.job?.description}",
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyElevatedIcons(
                onPressed: () {},
                buttonName: "Başvur",
                icons: const Icon(MyIcons.confirm),
              ),
            )
          ],
        ),
      ),
    );
  }

  RichText advertInfo(String title, String info) {
    return RichText(
      textScaleFactor: ProjectFontSize.oneToTwo,
      text: TextSpan(
        style: const TextStyle(fontWeight: Weight.midium, color: MyColor.black),
        text: title,
        children: [
          TextSpan(
            text: info,
            style: const TextStyle(
              fontWeight: Weight.normal,
            ),
          )
        ],
      ),
    );
  }
}
