import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/sub_title.dart';
import 'package:hrapp/product/widgets/text_field/custom_text_field.dart';
import '../../../product/constant/icons.dart';
import '../../../product/widgets/costom_dropdown.dart';
import 'company_create_advert_view_model.dart';

class CompanyCreateJobView extends StatefulWidget {
  const CompanyCreateJobView({super.key});

  @override
  State<CompanyCreateJobView> createState() => _CompanyCreateJobViewState();
}

class _CompanyCreateJobViewState extends CompanyCreateJobViewModel {
  @override
  void initState() {
    getProvince();
    // ignore: avoid_function_literals_in_foreach_calls
    jobQualities.forEach((element) {
      textController.add(TextEditingController());
    });
    super.initState();
  }

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
          actions: [
            IconButton(
              onPressed: () {
                print(province?.keys);
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
                itemCount: jobQualities.length - 1,
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
                        textEditingController: textController[jobQualities.length - 1],
                        title: jobQualities[jobQualities.length - 1][0],
                        icon: jobQualities[jobQualities.length - 1][1],
                        hint: jobQualities[jobQualities.length - 1][2],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 100,
                      child: CustomDropdown(
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
                      child: CustomDropdown(hint: StringData.province, items: province),
                    )
                  : const SizedBox(),
              const Padding(
                padding: ProjectPadding.createJob(),
                child: CustomTextField(
                  maxLine: 15,
                  title: "",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
