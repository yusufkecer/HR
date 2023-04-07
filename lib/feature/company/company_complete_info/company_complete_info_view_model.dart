import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/data/auth.dart';
import 'package:hrapp/product/service/api.dart';
import 'package:hrapp/product/service/data_service.dart';
import '../../../product/models/general_company_model.dart';
import 'company_complete_info_view.dart';

abstract class CompaynCompleteInfoViewModel extends State<CompaynCompleteInfoView> {
  TextEditingController departmentController = TextEditingController();
  TextEditingController sectorController = TextEditingController();
  TextEditingController totalWorkerController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController siteController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  DataService dt = DataService();
  Job? jobs;
  String? tax;
  List department = [];
  NavigationService nav = NavigationService();
  List<String>? sectorList;
  String? totalWorker;
  String? phoneNumber;
  String? site;
  String? companyName;
  String? companyMail;
  @override
  void initState() {
    jobs = widget.info;
    infoAddField();
    super.initState();
  }

  Future<void> getCompany() async {
    Future(() => nav.showLoading());
    var res = await dt.fetchData(ApiUri.companyInfoById + Auth.instance.getId!);
    if (res == null) {
      return;
    }

    Map<String, dynamic> data = res["data"];
    jobs = Job.fromJsonCompanyInfo(data);
    await infoAddField();
    Future(() => nav.hideLoading());
  }

  Future<void> infoAddField() async {
    for (var i = 0; i < jobs!.departments!.length; i++) {
      departmentController.text += jobs!.departments![i]["name"];
      departmentController.text += ":${jobs!.departments![i]["numberOfEmployees"]}";
    }

    sectorController.text = jobs?.sector?.join(",") ?? "";
    totalWorkerController.text = jobs?.totalWorker ?? "";
    phoneController.text = jobs?.companyPhone ?? "";
    siteController.text = jobs?.webSite ?? "";
    nameController.text = jobs?.companyName ?? "";
    mailController.text = jobs?.email ?? "";
  }
}
