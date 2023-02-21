import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigator_key.dart';
import 'package:hrapp/product/constant/string_data.dart';
import '../../Product/Constant/colors.dart';
import '../../Product/widgets/sized_box/box_space.dart';
import '../../feature/auth/register/register_view.dart';
import '../../feature/company/company_main_page/company_main_view.dart';
import '../../product/Constant/weight.dart';
import '../../product/constant/font_size.dart';
import '../Constant/radius.dart';
import '../Constant/size.dart';
import '../constant/project_padding.dart';

class NavigationService {
  showLoading(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              color: MyColor.purplishBlue,
            ),
          ),
        );
      },
    );
  }

  callSnackbar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<bool?> checkDialog(alertTitle, text) async {
    return showDialog<bool>(
      context: NavigationKey.instance.navigatorKey.currentContext!,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            title: Center(child: Text(alertTitle)),
            content: Text(text),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(
                  StringData.no,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  StringData.yes,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  alertWithButon(alertTitle, text, [buttonText = "Tamam", Function? onPress]) {
    showDialog(
      context: NavigationKey.instance.navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text(alertTitle)),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                if (onPress != null) {
                  onPress();
                }
                back();
              },
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }

  void back() {
    Navigator.of(
      NavigationKey.instance.navigatorKey.currentContext!,
    ).pop(true);
  }

  void hideLoading(context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  showBottomModal(context, String title, String subtitle) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: ProjectRadius.bigOnly(),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              const Positioned(
                top: -15,
                child: SizedBox(
                  height: 7,
                  width: 60,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: MyColor.white,
                      borderRadius: ProjectRadius.mediumAll(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const ProjectPadding.allEightTeen().copyWith(
                  bottom: const ProjectPadding.edgeZero().bottom,
                ),
                child: ListView(
                  controller: scrollController,
                  shrinkWrap: true,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: ProjectFontSize.mainSize, fontWeight: Weight.bold),
                    ),
                    BoxSpace(
                      height: ProjectSize.normalHeight().height,
                    ),
                    Text(
                      subtitle,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: ProjectFontSize.mainSize,
                        fontWeight: Weight.light,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  showBottomSelect(
    context,
    void Function() choice, [
    String? title,
    IconData? icon,
    IconData? icon2,
    String? text,
    String? text2,
    void Function()? choice2,
  ]) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => BottomSheet(
        onClosing: () {},
        enableDrag: false,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const ProjectPadding.allEight(),
                child: Text(
                  title ?? "",
                  textScaleFactor: ProjectFontSize.oneToFour,
                  style: const TextStyle(fontWeight: Weight.midium),
                ),
              ),
              ListTile(
                onTap: choice,
                leading: Icon(icon),
                title: Text(
                  text ?? "",
                  style: const TextStyle(fontWeight: Weight.midium),
                ),
              ),
              ListTile(
                onTap: choice,
                leading: Icon(icon2),
                title: Text(
                  text2 ?? "",
                  style: const TextStyle(fontWeight: Weight.midium),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void navigateToRegister(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => const RegisterView()),
      ),
    );
  }

  void navigteToCompany(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CompanyMainView(),
      ),
    );
  }
}
