import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resultpage.dart';
import 'iconInfo.dart';
import 'reusableCard.dart';
import 'constants.dart';
import 'roundIconButton.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';


enum Gender{
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int startingHeight = 200;
  int startingWeight = 40;
  int startingAge = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY BMI CALCULATOR',
          style: kAppBarTextStyle,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male? kActiveCardColor: kInactiveCardColor,
                    cardChild: IconInfo(
                      icon: FontAwesomeIcons.mars,
                      genderText: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female? kActiveCardColor: kInactiveCardColor,
                    cardChild: IconInfo(
                      icon: FontAwesomeIcons.venus,
                      genderText: 'Female',
                    ),
                ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kGenderTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                            startingHeight.toString(),
                            style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kGenderTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20.0),
                            activeTrackColor: Color(0xFFFFFFFF),
                            inactiveTrackColor: Color(0xFF8D8E98),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x25EB1555),
                          ),
                          child: Slider(
                            value: startingHeight.toDouble(),
                            min: 100.0,
                            max: 300.0,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newValue){
                              setState(() {
                                startingHeight = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kGenderTextStyle,
                        ),
                        Text(
                          startingWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        // buttons here with a Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyRoundIconButton(icons: FontAwesomeIcons.minus,
                            onPress: (){
                              setState(() {
                                startingWeight--;
                              });
                            },),
                            SizedBox(
                              width: 10.0,
                            ),
                            MyRoundIconButton(
                              icons: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  startingWeight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour:kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kGenderTextStyle,
                        ),
                        Text(
                          startingAge.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyRoundIconButton(
                              icons: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  startingAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            MyRoundIconButton(
                              icons: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  startingAge++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPress: (){

              CalculatorBrain calculate = CalculatorBrain(height: startingHeight, weight: startingWeight);
              // Navigator.pushNamed(context, 'secondscreen');
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                          calculateMyBmi: calculate.calculateMyBmi(),
                          displayBmiResult: calculate.displayBmiResult(),
                          displayResultText: calculate.displayResultText(),
                      );
                    },
                ),
              );
            },
            bottomButtonText: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}







