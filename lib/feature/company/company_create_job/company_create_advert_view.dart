import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/project_padding.dart';
import 'package:hrapp/core/extensions/context_extension.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:hrapp/product/widgets/app_bar_logo.dart';
import 'package:hrapp/product/widgets/sub_title.dart';
import 'package:hrapp/product/widgets/text_field/custom_text_field.dart';
import '../../../product/constant/icons.dart';
import '../../../product/widgets/text_field/resize_text_field.dart';
import 'company_create_advert_view_model.dart';

class CompanyCreateJobView extends StatefulWidget {
  const CompanyCreateJobView({super.key});

  @override
  State<CompanyCreateJobView> createState() => _CompanyCreateJobViewState();
}

class _CompanyCreateJobViewState extends CompanyCreateJobViewModel {
  @override
  void initState() {
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
                print(jobQualities.length);
              },
              icon: const Icon(MyIcons.confirm),
            ),
          ],
        ),
        body: SizedBox(
          width: context.width,
          child: ListView(
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
                    padding: const EdgeInsets.all(7).copyWith(right: 13, left: 13),
                    child: CustomTextField(
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
                padding: const EdgeInsets.all(7).copyWith(right: 13, left: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        textEditingController: textController[jobQualities.length - 1],
                        title: jobQualities[jobQualities.length - 1][0],
                        icon: jobQualities[jobQualities.length - 1][1],
                        hint: jobQualities[jobQualities.length - 1][2],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(
                      width: 80,
                      child: CustomTextField(
                        title: "",
                      ),
                    ),
                  ],
                ),
              ),
              ExpandableTextField(
                  child: CustomTextField(
                title: "",
              )),
            ],
          ),
        ),
      ),
    );
  }
}
