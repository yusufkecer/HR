import 'package:flutter/material.dart';
import 'package:hrapp/feature/company/saved_advert/saved_advert_view.dart';
import 'package:hrapp/product/data/company_repo/advert_repo.dart';

abstract class SavedAdvertViewModel extends State<SavedAdvertView> {
  final advertInstance = AdvertRepo.instance;
  void deleteSave(int index, int parentIndex) async {
    print("index $index");
    print("parentindex $parentIndex");
    print(saveIndex);
    setState(() {
      AdvertRepo.instance.savedAdverts.removeAt(index);
      saveIndex.removeAt(index);
      AdvertRepo.instance.adverts[parentIndex].jobs?.isSaveJob = false;
    });
  }

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
    print("saveindex $saveIndex");
  }
}
