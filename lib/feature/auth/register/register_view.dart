import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/extensions/string_extension.dart';
import 'package:hrapp/product/widgets/button/elevated_icon.dart';
import 'package:hrapp/product/widgets/text_field/auth_field.dart';
import 'package:hrapp/product/widgets/title.dart';
import '../../../Product/Constant/colors.dart';
import '../../../core/constant/size.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/constant/weight.dart';
import '../../../product/widgets/sized_box/box_space.dart';
import 'register_model.dart';

class RegisterView extends StatefulWidget {
  final bool? isCompany;
  const RegisterView({
    Key? key,
    this.isCompany,
  }) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends RegisterViewModel {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        closeKeyboard();
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const ProjectPadding.allEightTeen().copyWith(top: 26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  apptitle(),
                  BoxSpace(
                    height: ProjectSize.veryBigHeight().height,
                  ),
                  Column(
                    children: [
                      forms(),
                      Divider(
                        color: MyColor.veryLightBlack,
                        height: ProjectSize.bigHeight().height,
                      ),
                      termsAndConditions(context),
                      BoxSpace(
                        height: ProjectSize.bigHeight().height,
                      ),
                      registerButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container termsAndConditions(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Text.rich(
          TextSpan(
            text: StringData.termsText,
            style: const TextStyle(
              fontSize: ProjectFontSize.mainSize,
              color: MyColor.black,
            ),
            children: [
              TextSpan(
                text: StringData.terms,
                style: const TextStyle(
                  fontSize: ProjectFontSize.mainSize,
                  color: MyColor.purplishBlue,
                  fontWeight: Weight.bold,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    nav.showBottomModal(
                      context,
                      TermsAndConditions.termsSheetTitle,
                      TermsAndConditions.termsSheetText,
                    );
                  },
              ),
              TextSpan(
                text: StringData.and,
                style: const TextStyle(
                  fontSize: ProjectFontSize.mainSize,
                  color: MyColor.black,
                ),
                children: [
                  TextSpan(
                    text: StringData.condition,
                    style: const TextStyle(
                      fontSize: ProjectFontSize.mainSize,
                      color: MyColor.purplishBlue,
                      fontWeight: Weight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        nav.showBottomModal(
                          context,
                          TermsAndConditions.conditionsTitle,
                          TermsAndConditions.conditionsText,
                        );
                      },
                  ),
                ],
              ),
              const TextSpan(
                text: StringData.termsTextEnd,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align apptitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: title(),
    );
  }

  Titles title() {
    return const Titles(
      title: StringData.registerHere,
      subtitle: StringData.registerNow,
    );
  }

  Form forms() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          nameView(),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          webSiteView(),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          emailView(),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          widget.isCompany == false ? datePicker() : const SizedBox(),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          phoneNumber(),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          passwordView(),
        ],
      ),
    );
  }

  AuthField datePicker() {
    return AuthField(
      controller: dateController,
      textType: TextInputType.none,
      listener: (value) {
        birthOfDay = value;
        print(birthOfDay);
      },
      validation: (value) {
        if (value == null) {
          return StringData.selectBirthOfDay;
        }
        return null;
      },
      titlePadding: const ProjectPadding.textFieldTitle(),
      onTap: openPicker,
      icon: const Icon(
        MyIcons.date,
        color: MyColor.black,
      ),
      fontWeight: Weight.midium,
      info: StringData.birthOfDay,
    );
  }

  AuthField passwordView() {
    return AuthField(
      validation: (value) {
        // if (!value.passwordValid()) {
        //   return StringData.writePassword;
        // }
        return null;
      },
      listener: (value) {
        password = value;
      },
      titlePadding: const ProjectPadding.textFieldTitle(),
      icon: const Icon(
        MyIcons.password,
        color: MyColor.black,
      ),
      secure: isVisible,
      suffixButton: IconButton(
        onPressed: () {
          changeVisibility();
        },
        icon: isVisible
            ? const Icon(
                MyIcons.visibilityOn,
              )
            : const Icon(
                MyIcons.visibilityOff,
              ),
        color: MyColor.black,
      ),
      fontWeight: Weight.midium,
      info: StringData.password,
    );
  }

  AuthField nameView() {
    return AuthField(
      listener: (value) {
        name = value;
        return;
      },
      validation: (value) {
        if (!value.nameValid() && widget.isCompany == false) {
          return StringData.writeName;
        }
        return null;
      },
      titlePadding: const ProjectPadding.textFieldTitle(),
      icon: Icon(
        widget.isCompany! ? MyIcons.company : MyIcons.user,
        color: MyColor.black,
      ),
      fontWeight: Weight.midium,
      info: widget.isCompany! ? StringData.companyName : StringData.name,
    );
  }

  AuthField phoneNumber() {
    return AuthField(
      textType: TextInputType.number,
      listener: (value) {
        phone = value;
        return;
      },
      validation: (value) {
        if (value.phoneValid()) {
          return null;
        }
        return StringData.writePhone;
      },
      titlePadding: const ProjectPadding.textFieldTitle(),
      icon: const Icon(
        MyIcons.phone,
        color: MyColor.black,
      ),
      fontWeight: Weight.midium,
      info: StringData.phoneNumber,
    );
  }

  AuthField webSiteView() {
    return AuthField(
      textType: widget.isCompany! ? TextInputType.url : TextInputType.text,
      listener: (value) {
        siteOrName = value;
        return;
      },
      validation: (value) {
        if (widget.isCompany! ? !value.urlValid() : value.nameValid()) {
          return widget.isCompany! ? StringData.writeWebSite : StringData.writeSurname;
        }
        return null;
      },
      titlePadding: const ProjectPadding.textFieldTitle(),
      icon: Icon(
        widget.isCompany! ? MyIcons.website : MyIcons.position,
        color: MyColor.black,
      ),
      fontWeight: Weight.midium,
      info: widget.isCompany! ? StringData.webSite : StringData.surname,
    );
  }

  AuthField emailView() {
    return AuthField(
      textType: TextInputType.emailAddress,
      listener: (value) {
        email = value;
        return;
      },
      validation: (value) {
        if (!value.emailValid()) {
          return StringData.writeEmail;
        }
        return null;
      },
      titlePadding: const ProjectPadding.textFieldTitle(),
      icon: const Icon(
        MyIcons.mail,
        color: MyColor.black,
      ),
      fontWeight: Weight.midium,
      info: StringData.email,
    );
  }

  MyElevatedIcons registerButton() {
    return MyElevatedIcons(
      buttonName: StringData.register,
      icons: const Icon(MyIcons.addPerson),
      onPressed: onpressed,
    );
  }
}
