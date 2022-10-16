import 'package:flutter/material.dart';
import '../../../login/RegisterPage.dart';

import '../../constant/colors.dart';

class TextButtonIcon extends StatelessWidget {
  final FontWeight weight;
  final String buttonName;
  const TextButtonIcon(this.weight, this.buttonName, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(foregroundColor: MyColor.lightBlack),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Register(),
          ),
        );
      },
      icon: const Icon(Icons.lock_person_outlined),
      label: Text(
        buttonName,
        textAlign: TextAlign.right,
        style: TextStyle(fontWeight: weight),
      ),
    );
  }
}
