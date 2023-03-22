import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/button/elevated_icon.dart';
import 'package:hrapp/product/widgets/subtitle.dart';
import 'package:hrapp/product/widgets/text_field/custom_text_field.dart';
import '../../../product/constant/icons.dart';
import '../../../product/models/general_company_model.dart';
import '../../../product/widgets/costom_dropdown.dart';
import 'company_create_advert_view_model.dart';

class CompanyCreateJobView extends StatefulWidget {
  final Job? updateJob;
  final int? index;
  const CompanyCreateJobView({
    Key? key,
    this.updateJob,
    this.index,
  }) : super(key: key);

  @override
  State<CompanyCreateJobView> createState() => _CompanyCreateJobViewState();
}

class _CompanyCreateJobViewState extends CompanyCreateJobViewModel {
  @override
  void dispose() {
    for (var i = 0; i < textController.length; i++) {
      textController[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(false);
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          appBar: AppBar(
            title: const AppBarLogoTitle(),
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            actions: updateJob?.isActive != null
                ? [
                    Padding(
                      padding: const ProjectPadding.rightEight(),
                      child: IconButton(
                        tooltip: isActive! ? StringData.pacify : StringData.activate,
                        onPressed: visibility,
                        icon: isActive! ? const Icon(MyIcons.visibilityOn) : const Icon(MyIcons.visibilityOff),
                      ),
                    ),
                  ]
                : null,
          ),
          body: SizedBox(
            width: context.width,
            child: ListView(
              shrinkWrap: true,
              physics: focusNode.hasFocus == false
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              children: [
                const Padding(
                  padding: ProjectPadding.allEight(),
                  child: Subtitle(
                    title: StringData.createAdvert,
                  ),
                ),
                inputs(),
                openPosition(),
                Padding(
                  padding: const ProjectPadding.createJob(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      wageInput(),
                      const SizedBox(
                        width: 15,
                      ),
                      currencyInput(),
                    ],
                  ),
                ),
                lastDateInput(),
                createDateInput(),
                province != null ? provinceInput() : const SizedBox(),
                descriptionInput(),
                saveButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding descriptionInput() {
    return Padding(
      padding: const ProjectPadding.createJob(),
      child: CustomTextField(
        maxLine: null,
        title: jobQualities[jobQualities.length - 1][0],
        textEditingController: textController[jobQualities.length - 1],
      ),
    );
  }

  ListView inputs() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: jobQualities.length - 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const ProjectPadding.createJob(),
          child: CustomTextField(
            maxLine: 1,
            title: jobQualities[index][0],
            icon: jobQualities[index][1],
            hint: jobQualities[index][2],
            textEditingController: textController[index],
          ),
        );
      },
    );
  }

  Padding saveButton() {
    return Padding(
      padding: const ProjectPadding.createJob(),
      child: MyElevatedIcons(
        buttonName: StringData.save,
        icons: const Icon(MyIcons.confirm),
        onPressed: saveAdvert,
      ),
    );
  }

  Padding provinceInput() {
    return Padding(
      padding: const ProjectPadding.createJob(),
      child: CustomDropdown(
          selected: provinceValue,
          onChange: (p0) {
            setState(() {
              provinceValue = p0;
            });
          },
          hint: StringData.province,
          items: province),
    );
  }

  Padding lastDateInput() {
    return Padding(
      padding: const ProjectPadding.createJob(),
      child: CustomTextField(
        selectionCursor: false,
        textInputType: TextInputType.none,
        maxLine: null,
        tap: getDate,
        title: jobQualities[jobQualities.length - 3][0],
        icon: jobQualities[jobQualities.length - 3][1],
        textEditingController: textController[jobQualities.length - 3],
      ),
    );
  }

  Padding createDateInput() {
    return Padding(
      padding: const ProjectPadding.createJob(),
      child: CustomTextField(
        selectionCursor: false,
        textInputType: TextInputType.none,
        maxLine: null,
        tap: createDate,
        title: jobQualities[jobQualities.length - 2][0],
        icon: jobQualities[jobQualities.length - 2][1],
        textEditingController: textController[jobQualities.length - 2],
      ),
    );
  }

  SizedBox currencyInput() {
    return SizedBox(
      width: 100,
      child: CustomDropdown(
        selected: currencyValue,
        onChange: (p0) {
          if (p0 != null) {
            setState(() {
              currencyValue = p0;
            });
          } else {
            currencyValue = StringData.turkishLiraSymbol;
          }
        },
        hint: StringData.currencyUnit,
        items: currency,
      ),
    );
  }

  Expanded wageInput() {
    return Expanded(
      child: CustomTextField(
        textInputType: TextInputType.number,
        maxLine: 1,
        textEditingController: textController[jobQualities.length - 4],
        title: jobQualities[jobQualities.length - 4][0],
        icon: jobQualities[jobQualities.length - 4][1],
        hint: jobQualities[jobQualities.length - 4][2],
      ),
    );
  }

  Padding openPosition() {
    return Padding(
      padding: const ProjectPadding.createJob(),
      child: CustomTextField(
        textInputType: TextInputType.number,
        maxLine: 1,
        textEditingController: textController[jobQualities.length - 5],
        title: jobQualities[jobQualities.length - 5][0],
        icon: jobQualities[jobQualities.length - 5][1],
        hint: jobQualities[jobQualities.length - 5][2],
      ),
    );
  }
}
