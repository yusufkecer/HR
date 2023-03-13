import 'package:flutter/material.dart';
import 'package:hrapp/core/enum/advert_filter.dart';
import 'package:hrapp/core/navigation/navigation_service.dart';
import 'package:hrapp/product/service/data_service.dart';
import '../../../core/filter/filter.dart';
import '../../../product/models/general_company_model.dart';
import '../company_create_advert/company_create_advert_view.dart';
import 'company_advert_view.dart';

abstract class CompanyAdvertViewModel extends State<CompanyJobView> {
  DataService service = DataService();
  Filter filters = Filter.instance;
  List<Job>? adverts;
  NavigationService nav = NavigationService();
  @override
  void initState() {
    super.initState();
  }

  bool verticalDivider = true;

  void updateAdvert(int index, List<Job> advert) async {
    Future(() async {
      bool check = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CompanyCreateJobView(
            updateJob: advert[index],
            index: index,
          ),
        ),
      );

      if (check == true) {}
      print("yusuffff");
    });
  }

  Future<void> filter(AdvertFilterOptions options, api) async {
    // nav.showLoading(context);

    // var res = await service.fetchData(api);
    // Iterable list = res["data"];
    // adverts = list.map((e) => Job.fromJson(e)).toList();

    // Future(() => nav.hideLoading(context));

    setState(() {});
  }

  void deleteAdvert(int index) async {
    setState(() {
      // widget.adverts!.delete(index);
    });
  }
}
