import 'package:flutter/material.dart';
import 'package:hrapp/core/navigation/navigator_key.dart';
import 'package:hrapp/feature/user/user_main_page/user_main_view.dart';
import 'package:hrapp/product/constant/string_data.dart';
import 'package:lottie/lottie.dart';
import '../../Product/Constant/colors.dart';
import '../../Product/widgets/sized_box/box_space.dart';
import '../../feature/company/company_main_page/company_main_view.dart';
import '../../product/Constant/weight.dart';
import '../../product/constant/font_size.dart';
import '../Constant/radius.dart';
import '../Constant/size.dart';
import '../constant/project_padding.dart';

class NavigationService {
  showLoading([context]) {
    showDialog(
      barrierDismissible: false,
      context: context ?? NavigationKey.instance.navigatorKey.currentContext,
      builder: (context) {
        return Center(
          child: SizedBox(
            child: Lottie.asset(
              "assets/splash.json",
            ),
          ),
        );
      },
    );
  }

  callSnackbar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<String?> displayTextInputDialog(alertTitle, text, textFieldController) async {
    return showDialog<String>(
        context: NavigationKey.instance.navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: Text(alertTitle),
            content: TextField(
              maxLines: null,
              controller: textFieldController,
              decoration: InputDecoration(hintText: text),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: const Text(StringData.cancel),
                onPressed: () {
                  Navigator.of(context).pop("false");
                },
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: const Text(StringData.ok),
                onPressed: () {
                  Navigator.of(context).pop(textFieldController.text);
                },
              ),
            ],
          );
        });
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

  Future<DateTime?> showDate(BuildContext context, [DateTime? initialDate]) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: const Locale("tr", "TR"),
      initialDate: initialDate ?? DateTime.now().subtract(const Duration(days: 30)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
                primary: Theme.of(context).primaryColor, // header background color
                onPrimary: MyColor.white, // header text color
                surface: MyColor.white, // background color
                onSurface: MyColor.black // text color
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                iconColor: Theme.of(context).primaryColor, // button text color
              ),
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
    return picked;
  }

  void alertWithButon(alertTitle, text, [buttonText = StringData.ok, Function()? onPress]) {
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

  void hideLoading([context]) {
    Navigator.of(context ?? NavigationKey.instance.navigatorKey.currentContext, rootNavigator: true).pop();
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
    void Function() choice,
    void Function()? choice2, [
    String? title,
    IconData? icon,
    IconData? icon2,
    String? text,
    String? text2,
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
                onTap: choice2,
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

  void closeKeyboard() {
    FocusScope.of(NavigationKey.instance.navigatorKey.currentContext!).requestFocus(FocusNode());
  }

  void navigteToUser(context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const UserMainView(),
      ),
      (route) => false,
    );
  }

  void navigteToCompany(context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const CompanyMainView(),
      ),
      (route) => false,
    );
  }
}
