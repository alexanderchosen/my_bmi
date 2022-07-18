import 'package:flutter/material.dart';

class MyRoundIconButton extends StatelessWidget {
  MyRoundIconButton({@required this.icons, @required this.onPress});

  final IconData icons;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      child: Icon(icons),
      elevation: 5.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}