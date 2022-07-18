import 'dart:math';
import 'package:flutter/cupertino.dart';

class CalculatorBrain{

  CalculatorBrain({@required this.height,@required this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateMyBmi(){
    _bmi = weight / pow (height/100, 2);
    return _bmi.toStringAsFixed(2);

  }

  String displayBmiResult(){
    if (_bmi <= 15){
      return 'UnderWeight';
    }else if(_bmi <= 25){
      return 'Normal';
    } else{
      return 'OverWeight';
    }
  }

  String displayResultText(){
    if (_bmi <= 15){
      return ' You need to eat more balanced diet. Please see a Nutritionist!';
    }else if(_bmi <= 25){
      return ' You ae good to go. Keep eating well!';
    } else{
      return 'You need to see a Nutritionist for prescribed diets to help reduce your weight!';
    }
  }
}