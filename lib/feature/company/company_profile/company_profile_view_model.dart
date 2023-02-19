import 'package:flutter/material.dart';

import '../../../core/navigation/navigation_service.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/models/company_model/company_model.dart';
import 'company_profile_view.dart';

abstract class CompanyProfileWiewModel extends State<CompanyProfileView> {
  var company = Company(
    phoneNumber: "05333333333",
    mail: "info@info.com",
    website: "www.blablabla.com",
    sector: "Yazılım Geliştirme",
    companyName: "PAÜ",
    numberWorker: "200-300",
    address: "Bahçelievler Mahallesi, Atatürk Caddesi, No:34, 16370 Nilüfer/Bursa, Türkiye.",
  );
  bool isEditContact = false;
  void changeImage() {
    print("image değiştir");
  }

  void contactInfoTitleEdit() {
    if (isEditContact) {
      company.mail = mailControoler.text;
      company.phoneNumber = phoneController.text;
      company.website = webController.text;
      company.address = locationController.text;

      isEditContact = !isEditContact;

      nav.callSnackbar(context, StringData.saved);
    } else {
      mailControoler.text = company.mail ?? "";
      phoneController.text = company.phoneNumber ?? "";
      webController.text = company.website ?? "";
      locationController.text = company.address ?? "";

      isEditContact = !isEditContact;
    }
    setState(() {});
  }

  void changeInfoTitle() {
    if (isEditGeneralInfo) {
      StringData.companyInfo = generalInfoController.text;
      isEditGeneralInfo = !isEditGeneralInfo;

      nav.callSnackbar(context, StringData.saved);
    } else {
      generalInfoController.text = StringData.companyInfo;

      isEditGeneralInfo = !isEditGeneralInfo;
    }
    setState(() {});
  }

  bool isEditGeneralInfo = false;
  NavigationService nav = NavigationService();
  TextEditingController generalInfoController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController mailControoler = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController webController = TextEditingController();
}
