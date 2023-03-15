import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hrapp/product/constant/icons.dart';
import 'package:hrapp/product/data/auth.dart';

import 'package:image_picker/image_picker.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/models/company_model/company_model.dart';
import 'company_profile_view.dart';

abstract class CompanyProfileWiewModel extends State<CompanyProfileView> {
  File? selectedImage;
  var company = Company(
    phoneNumber: "05333333333",
    website: "www.blablabla.com",
    sector: "Yazılım Geliştirme",
    companyName: "PAÜ",
    numberWorker: "200-300",
    address: "Bahçelievler Mahallesi, Atatürk Caddesi, No:34, 16370 Nilüfer/Bursa, Türkiye.",
  );
  bool isEditContact = false;

  void changeImage() async {
    nav.showBottomSelect(
      context,
      openCamera,
      openGallery,
      "Lütfen Seçiniz",
      MyIcons.camera,
      MyIcons.image,
      StringData.camera,
      StringData.gallery,
    );
  }

  void contactInfoTitleEdit() {
    if (isEditContact) {
      company.mail = mailController.text;
      company.phoneNumber = phoneController.text;
      company.website = webController.text;
      company.address = locationController.text;

      isEditContact = !isEditContact;

      nav.callSnackbar(context, StringData.saved);
    } else {
      mailController.text = Auth.instance.getEmail;
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
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController webController = TextEditingController();

  void openCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? xImage = await picker.pickImage(source: ImageSource.camera);
    nav.back();
    if (xImage == null) {
      return;
    }

    setState(() {
      selectedImage = File(xImage.path);
    });
  }

  void openGallery() async {
    final ImagePicker picker = ImagePicker();
    XFile? xImage = await picker.pickImage(source: ImageSource.gallery);
    nav.back();
    if (xImage == null) {
      return;
    }

    setState(() {
      selectedImage = File(xImage.path);
    });
  }
}
