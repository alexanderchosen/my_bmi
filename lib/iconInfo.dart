import 'package:flutter/material.dart';
import 'constants.dart';

class IconInfo extends StatelessWidget {
  IconInfo({this.icon, this.genderText});

  final IconData icon;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox (
          height: 10.0,
        ),
        Text(
          genderText,
          style: kGenderTextStyle,
          ),
        ],
    );
  }
}