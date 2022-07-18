import 'package:flutter/cupertino.dart';
import 'reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:my_bmi/constants.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.calculateMyBmi, @required this.displayBmiResult, @required this.displayResultText});

  final String calculateMyBmi;
  final String displayBmiResult;
  final String displayResultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT PAGE',
        style: kAppBarTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                ' Your Result',
                style: kResult,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  Text(
                    displayBmiResult.toUpperCase(),
                    style: kResultText,
                    ),
                  Text(
                    calculateMyBmi,
                    style: kNumberTextStyle,
                  ),
                  Text(
                  displayResultText,
                    textAlign: TextAlign.center,
                    style: kResultText,
                  ),
                  ],
                    ),
                ),
              ),
          BottomButton(
            onPress: () {
              Navigator.pop(context);
            },
            bottomButtonText: 'RE-CALCULATE',

          ),
            ],
      ),
    );
  }
}
