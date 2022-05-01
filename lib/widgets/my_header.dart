import 'package:flutter/material.dart';
import '../constants/images_constants.dart';

class MyHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;

  MyHeader(this.title, this.subTitle, this.titleStyle, this.subTitleStyle)
      : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 28),
        Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstants.APP_LOGO),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(title, style: titleStyle),
        Text(subTitle, style: subTitleStyle),
      ],
    );
  }
}
