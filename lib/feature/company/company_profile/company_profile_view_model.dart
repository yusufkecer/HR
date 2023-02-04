import 'package:flutter/material.dart';

import '../../../core/navigation/navigation_service.dart';
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
  bool isEditGeneralInfo = false;
  NavigationService nav = NavigationService();
  TextEditingController generalInfoController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController mailControoler = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController webController = TextEditingController();
}
