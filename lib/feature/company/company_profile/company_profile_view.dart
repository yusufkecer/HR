import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hrapp/core/Constant/radius.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/feature/company/company_profile/company_profile_view_model.dart';
import 'package:hrapp/product/Constant/weight.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/models/company_model/company_model.dart';
import 'package:hrapp/product/widgets/card_listtile.dart';
import 'package:hrapp/product/widgets/text_field/custom_text_field.dart';
import 'package:hrapp/product/widgets/title_text_button.dart';
import '../../../product/Constant/colors.dart';
import '../../../product/widgets/app_bar_logo.dart';

class CompanyProfileView extends StatefulWidget {
  const CompanyProfileView({super.key});

  @override
  State<CompanyProfileView> createState() => _CompanyProfileViewState();
}

class _CompanyProfileViewState extends CompanyProfileWiewModel {
  @override
  void dispose() {
    mailControoler.dispose();
    generalInfoController.dispose();
    phoneController.dispose();
    webController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.desertStorm,
      appBar: AppBar(
        title: const AppBarLogoTitle(),
        centerTitle: true,
      ),
      body: ColoredBox(
        color: MyColor.desertStorm,
        child: Padding(
          padding: const ProjectPadding.horizontalEight(),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  profileImage(),
                  nameAndInfo(),
                ],
              ),
              sizedSpace(),
              infoTitle(),
              sizedSpace(height: 15),
              generalInfo(),
              sizedSpace(),
              contactInfoTItle(),
              sizedSpace(height: 15),
              contactInfo(),
              sizedSpace(),
            ],
          ),
        ),
      ),
    );
  }

  TitleWithTextButton contactInfoTItle() {
    return TitleWithTextButton(
      buttonName: !isEditContact ? StringData.edit : StringData.save,
      onPress: isEditContact
          ? () {
              company.mail = mailControoler.text;
              company.phoneNumber = phoneController.text;
              company.website = webController.text;
              company.address = locationController.text;
              setState(() {
                isEditContact = !isEditContact;
              });
              nav.callSnackbar(context);
            }
          : () {
              mailControoler.text = company.mail ?? "";
              phoneController.text = company.phoneNumber ?? "";
              webController.text = company.website ?? "";
              locationController.text = company.address ?? "";
              setState(() {
                isEditContact = !isEditContact;
              });
            },
      title: StringData.contactInfo,
    );
  }

  Padding profileImage() {
    return Padding(
      padding: const ProjectPadding.allTen(),
      child: Align(
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: const ProjectRadius.mediumAll(),
            image: const DecorationImage(
              image: NetworkImage(ImagePath.temporaryImage),
            ),
            boxShadow: [
              BoxShadow(
                color: MyColor.osloGrey.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding nameAndInfo() {
    return Padding(
      padding: const EdgeInsets.all(5.0).copyWith(top: 8),
      child: SizedBox(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                company.companyName!,
                textScaleFactor: ProjectFontSize.oneToFive,
                style: const TextStyle(
                  fontWeight: Weight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${company.sector}\n${company.numberWorker} Kişi",
                textAlign: TextAlign.start,
                textScaleFactor: ProjectFontSize.oneToTwo,
                style: const TextStyle(
                  fontWeight: Weight.midium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TitleWithTextButton infoTitle() {
    return TitleWithTextButton(
      buttonName: isEditGeneralInfo ? StringData.save : StringData.edit,
      title: StringData.generalInfo,
      onPress: isEditGeneralInfo
          ? () {
              setState(() {
                StringData.companyInfo = generalInfoController.text;
                isEditGeneralInfo = !isEditGeneralInfo;
              });
              nav.callSnackbar(context);
            }
          : () {
              generalInfoController.text = StringData.companyInfo;
              setState(() {
                isEditGeneralInfo = !isEditGeneralInfo;
                log(isEditGeneralInfo.toString());
              });
            },
    );
  }

  Container generalInfo() {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(color: MyColor.white, borderRadius: const ProjectRadius.mediumAll(), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 20,
          offset: const Offset(1, 3),
        ),
      ]),
      child: Padding(
        padding: const ProjectPadding.allSixteen(),
        child: !isEditGeneralInfo
            ? RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "${StringData.aboutCompany}\n\n",
                      style: TextStyle(
                        color: MyColor.black,
                        fontWeight: Weight.midium,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      style: const TextStyle(
                        color: MyColor.black,
                        fontSize: 16,
                      ),
                      text: StringData.companyInfo,
                    ),
                  ],
                ),
              )
            : CustomTextField(
                hint: StringData.aboutCompany,
                maxLine: null,
                textEditingController: generalInfoController,
              ),
      ),
    );
  }

  Widget contactInfo() {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(color: MyColor.white, borderRadius: const ProjectRadius.mediumAll(), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(1, 3),
        ),
      ]),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          !isEditContact
              ? ContactCard(
                  textColor: MyColor.osloGrey,
                  color: MyColor.ocianLavender,
                  iconLeading: MyIcons.mail,
                  text: company.mail,
                )
              : Padding(
                  padding: const ProjectPadding.allEight(),
                  child: CustomTextField(
                    hint: StringData.email,
                    maxLine: 1,
                    textInputType: TextInputType.emailAddress,
                    textEditingController: mailControoler,
                  ),
                ),
          const Divider(
            color: MyColor.ocianLavender,
            indent: 20,
            endIndent: 20,
          ),
          !isEditContact
              ? ContactCard(
                  textColor: MyColor.osloGrey,
                  color: MyColor.hollandOrange,
                  iconLeading: MyIcons.phone,
                  text: company.phoneNumber,
                )
              : Padding(
                  padding: const ProjectPadding.allEight(),
                  child: CustomTextField(
                    textInputType: TextInputType.number,
                    hint: StringData.phoneNumber,
                    maxLine: 1,
                    textEditingController: phoneController,
                  ),
                ),
          const Divider(
            color: MyColor.ocianLavender,
            indent: 20,
            endIndent: 20,
          ),
          !isEditContact
              ? ContactCard(
                  color: MyColor.darkYellow,
                  textColor: MyColor.osloGrey,
                  iconLeading: MyIcons.website,
                  text: company.website,
                )
              : Padding(
                  padding: const ProjectPadding.allEight(),
                  child: CustomTextField(
                    hint: StringData.webSite,
                    maxLine: 1,
                    textEditingController: webController,
                  ),
                ),
          const Divider(
            color: MyColor.ocianLavender,
            indent: 20,
            endIndent: 20,
          ),
          !isEditContact
              ? ContactCard(
                  scale: 1,
                  color: MyColor.recycleGreen,
                  textColor: MyColor.osloGrey,
                  iconLeading: MyIcons.location,
                  text: company.address,
                )
              : Padding(
                  padding: const ProjectPadding.allEight(),
                  child: CustomTextField(
                    hint: StringData.address,
                    maxLine: null,
                    textEditingController: locationController,
                  ),
                ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  SizedBox sizedSpace({double height = 10}) {
    return SizedBox(
      height: height,
    );
  }
}

class DecorationProfile extends BoxDecoration {
  const DecorationProfile({
    Color? color,
  }) : super(
          color: color,
          borderRadius: const ProjectRadius.mediumAll(),
        );
}
