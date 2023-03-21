import 'package:flutter/material.dart';
import 'package:hrapp/feature/auth/chose_auth.dart';
import 'package:hrapp/feature/company/company_create_advert/company_create_advert_view.dart';
import 'package:hrapp/product/data/auth.dart';
import 'package:hrapp/product/data/company_repo/advert_repo.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/models/general_company_model.dart';
import '../../../product/models/worker_model/worker_model.dart';
import '../../../product/service/api.dart';
import '../../../product/service/data_service.dart';
import '../company_profile/company_profile_view.dart';
import '../saved_advert/saved_advert_view.dart';
import 'company_main_view.dart';

abstract class CopmanyMainViewModel extends State<CompanyMainView> with TickerProviderStateMixin {
  @override
  void initState() {
    Future(() => nav.showLoading(context));
    getWorkers();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    updateList();
    Future(() => nav.hideLoading(context));
    super.initState();
  }

  final Map bottomBar = {
    StringData.homePage: MyIcons.home,
    StringData.myAdvertisement: MyIcons.listAlt,
  };
  bool status = false;
  List<Job> adverts = [];
  List<Job> activeAdverts = [];
  List<Job> passiveAdverts = [];

  Future<void> updateList() async {
    List<Job> jobsAll = await getJobs(ApiUri.getAdvertAll);
    List<Job> jobsActive = await getJobs(ApiUri.getAdvertActive);
    List<Job> jobsPassive = await getJobs(ApiUri.getAdvertPassive);

    setState(() {
      adverts = jobsAll;
      activeAdverts = jobsActive;
      passiveAdverts = jobsPassive;
    });
  }

  Future<List<Job>> getJobs(String endpoint) async {
    var response = await dt.fetchData(endpoint);
    Iterable data = response["data"];

    List<Job> jobs = data.map((json) => Job.fromJson(json)).toList();
    return jobs;
  }

  void navigateProfile() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CompanyProfileView(),
    ));
  }

  void logout() async {
    Auth.instance.resetToken = {};
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const ChoseAuth(),
      ),
      (route) => false,
    );

    setState(() {});
  }

  void navigateSavedAdvert() async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SavedAdvertView(),
    ));

    setState(() {});
  }

  void navigateCreateAdvert() async {
    status = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CompanyCreateJobView(),
    ));

    if (status) {
      updateList();

      setState(() {});
    }
  }

  final AdvertRepo jobList = AdvertRepo();
  late TabController tabController;
  void getWorkers() async {
    Future(() {
      nav.showLoading(context);
    });

    futureWorker = await dt.fetchData(ApiUri.workerApi);
    setState(() {
      if (futureWorker != null) {
        workers = futureWorker!.map((e) => Worker.fromJson(e)).toList();
      } else {
        dontReachApi = StringData.connectionError;
      }
    });

    Future(() {
      nav.hideLoading(context);
    });
  }

  String? dontReachApi;
  Iterable? futureWorker;
  List<Worker>? workers;
  DataService dt = DataService();
  NavigationService nav = NavigationService();
}
