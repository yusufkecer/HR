import 'package:flutter/material.dart';
import 'package:hrapp/feature/company/saved_advert/saved_advert_view.dart';
import 'package:hrapp/product/data/company_repo/advert_repo.dart';

abstract class SavedAdvertViewModel extends State<SavedAdvertView> {
  final advertInstance = AdvertRepo.instance;
  void saveJob(int index) async {
    print("function içi $index");
    setState(() {
      AdvertRepo.instance.saveJob(index);
      getSaveAdvert();
    });
    // getWorkers();
  }

// @override
//   void didUpdateWidget(covariant SavedAdvertView oldWidget) {
//     // TODO: implement didUpdateWidget
//     super.didUpdateWidget(oldWidget);
//   }
  List saveIndex = [];
  @override
  void initState() {
    getSaveAdvert();

    super.initState();
  }

  void getSaveAdvert() {
    advertInstance.savedAdverts = [];
    for (var i = 0; i < advertInstance.adverts.length; i++) {
      if (advertInstance.adverts[i].jobs?.isSaveJob == true) {
        saveIndex.add(i);
        advertInstance.savedAdverts.add(advertInstance.adverts[i]);
      }
    }
  }
}
