import 'package:flutter/material.dart';
import 'package:hrapp/core/Constant/radius.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/feature/company/company_profile/company_profile_view_model.dart';
import 'package:hrapp/product/Constant/weight.dart';
import 'package:hrapp/product/constant/font_size.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/constant/image_path.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/info_card.dart';
import 'package:hrapp/product/widgets/card_listtile.dart';
import 'package:hrapp/product/widgets/text_field/custom_text_field.dart';
import 'package:hrapp/product/widgets/button/title_text_button.dart';
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
              titleAndImage(),
              sizedSpace(),
              infoTitle(),
              sizedSpace(height: 15),
              generalInfo(),
              sizedSpace(),
              contactInfoTitle(),
              sizedSpace(height: 15),
              contactInfo(),
              sizedSpace(),
            ],
          ),
        ),
      ),
    );
  }

  Row titleAndImage() {
    return Row(
      children: [
        profileImage(),
        nameAndInfo(),
      ],
    );
  }

  Widget profileImage() {
    return Stack(
      children: [
        Padding(
          padding: const ProjectPadding.allTen(),
          child: SizedBox(
            height: 130,
            width: 130,
            child: selectedImage != null
                ? CircleAvatar(backgroundImage: FileImage(selectedImage!))
                : const CircleAvatar(
                    backgroundImage: NetworkImage(ImagePath.temporaryImage),
                  ),
          ),
        ),
        SizedBox(
          height: 140,
          width: 140,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: MyColor.desertStorm,
              ),
              child: IconButton(
                onPressed: changeImage,
                icon: const Icon(
                  size: 28,
                  color: MyColor.purplishBlue,
                  MyIcons.camera,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding nameAndInfo() {
    return Padding(
      padding: const EdgeInsets.all(5.0).copyWith(top: 0),
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
    );
  }

  TitleWithTextButton infoTitle() {
    return TitleWithTextButton(
        buttonName: isEditGeneralInfo ? StringData.save : StringData.edit,
        title: StringData.generalInfo,
        onPress: changeInfoTitle);
  }

  InfoCard generalInfo() {
    return InfoCard(
      child: companyName(),
    );
  }

  TitleWithTextButton contactInfoTitle() {
    return TitleWithTextButton(
      buttonName: !isEditContact ? StringData.edit : StringData.save,
      onPress: contactInfoTitleEdit,
      title: StringData.contactInfo,
    );
  }

  Widget contactInfo() {
    return InfoCard(
      child: Column(
        children: [
          sizedSpace(
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
          sizedSpace(
            height: 15,
          ),
        ],
      ),
    );
  }

  Padding companyName() {
    return Padding(
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
