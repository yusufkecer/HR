import 'package:flutter/material.dart';

import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/data/company_repo/advert_repo.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/sub_title.dart';
import 'package:hrapp/product/widgets/text_field/custom_text_field.dart';

import '../../../product/constant/icons.dart';
import '../../../product/models/company_model/company_model.dart';
import '../../../product/models/job_model/job_model.dart';
import '../../../product/widgets/costom_dropdown.dart';
import 'company_create_advert_view_model.dart';

class CompanyCreateJobView extends StatefulWidget {
  final AdvertRepo? advertRepo;
  const CompanyCreateJobView({
    Key? key,
    required this.advertRepo,
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarLogoTitle(),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                initController();

                var data = Company(
                  companyName: "PAÜ",
                  sector: "Yazılım",
                  jobs: Jobs(
                    isSaveJob: false,
                    jobTitle: jobTitle,
                    skills: skills,
                    lowerWage: upperAndLowerWage?[0] != null ? double.parse(upperAndLowerWage?[0]) : null,
                    upperWage: upperAndLowerWage?[1] != null ? double.parse(upperAndLowerWage?[1]) : null,
                    timing: timing,
                    currency: currencyValue,
                    level: level,
                  ),
                );
                setState(() {
                  widget.advertRepo?.adverts.add(data);
                });
              },
              icon: const Icon(MyIcons.confirm),
            ),
          ],
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
                child: SubTitle(
                  title: StringData.createAdvert,
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: jobQualities.length - 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const ProjectPadding.createJob(),
                    child: CustomTextField(
                      maxLine: 1,
                      title: jobQualities[index][0],
                      hint: jobQualities[index][2],
                      icon: jobQualities[index][1],
                      //  width: textFieldWidth,
                      textEditingController: textController[index],
                    ),
                  );
                },
              ),
              Padding(
                padding: const ProjectPadding.createJob(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        maxLine: 1,
                        textEditingController: textController[jobQualities.length - 2],
                        title: jobQualities[jobQualities.length - 2][0],
                        icon: jobQualities[jobQualities.length - 2][1],
                        hint: jobQualities[jobQualities.length - 2][2],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 100,
                      child: CustomDropdown(
                        selected: currencyItem,
                        onChange: (p0) {
                          if (p0 != null) {
                            setState(() {
                              currencyItem = p0;
                            });
                          } else {
                            currencyItem = StringData.turkishLiraSymbol;
                          }
                        },
                        hint: StringData.currencyUnit,
                        items: currency,
                      ),
                    ),
                  ],
                ),
              ),
              province != null
                  ? Padding(
                      padding: const ProjectPadding.createJob(),
                      child: CustomDropdown(
                          selected: provinceItem,
                          onChange: (p0) {
                            setState(() {
                              provinceItem = p0;
                            });
                          },
                          hint: StringData.province,
                          items: province),
                    )
                  : const SizedBox(),
              Padding(
                padding: const ProjectPadding.createJob(),
                child: CustomTextField(
                  maxLine: null,
                  title: jobQualities[jobQualities.length - 1][0],
                  textEditingController: textController[jobQualities.length - 1],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
