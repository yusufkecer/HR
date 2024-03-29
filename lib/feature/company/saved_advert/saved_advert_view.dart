import 'package:flutter/material.dart';
import 'package:hrapp/feature/company/saved_advert/saved_advert_view_model.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/not_found.dart';

import '../../../product/widgets/advert_vertical_list.dart';

class SavedAdvertView extends StatefulWidget {
  const SavedAdvertView({super.key});

  @override
  State<SavedAdvertView> createState() => _SavedAdvertViewState();
}

class _SavedAdvertViewState extends SavedAdvertViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogoTitle(),
      ),
      body: advertInstance.savedAdverts.isNotEmpty
          ? SingleChildScrollView(
              child: AdvertVerticalList(
                isSave: true,
                advertRepo: advertInstance.savedAdverts,
                saveFunc: deleteSave,
                saveIndex: saveIndex,
              ),
            )
          : const Center(child: NotFound(text: StringData.saveNotFound)),
    );
  }
}
