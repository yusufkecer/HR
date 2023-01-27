import 'package:flutter/cupertino.dart';

class TextWithIcon extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const TextWithIcon({
    Key? key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Icon(icon), Text(" $text")],
    );
  }
}
