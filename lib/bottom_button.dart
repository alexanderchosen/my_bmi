import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton ({@required this.onPress, @required this.bottomButtonText});

  final Function onPress;
  final String bottomButtonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            bottomButtonText,
            style: kBottomText,
          ),
        ),
        margin: EdgeInsets.only(top:10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
