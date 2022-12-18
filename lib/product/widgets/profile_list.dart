import 'package:flutter/material.dart';
import 'package:hrapp/product/constant/colors.dart';

class ProfileList extends StatelessWidget {
  final String? image;

  final String? userName;
  final String? userSurName;
  final String? department;
  const ProfileList({
    Key? key,
    this.image = "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
    this.userName = "Yusuf",
    this.userSurName = "Keçer",
    this.department = "Mobile Developer",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ColoredBox(
        color: MyColor.tints,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              image!,
            ),
          ),
          title: Text(
            userName ?? "-",
          ),
          subtitle: Text(
            department ?? "-",
          ),
        ),
      ),
    );
  }
}
