import 'package:flutter/material.dart';

import '../constants/color.dart';

class MyDrawer extends StatelessWidget {
  final IconData icon;
  final String title;
  final String onPress;

  MyDrawer(this.icon, this.title, this.onPress, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.popAndPushNamed(context, onPress);
      },
      leading: Icon(
        icon,
        color: ColorConstants.white,
      ),
      title: Text(
        title,
        style: TextStyle(letterSpacing: 0.5),
      ),
    );
  }
}
