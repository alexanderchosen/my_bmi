import 'package:flutter/material.dart';
import 'inputPage.dart';
// import 'resultpage.dart';

void main() {
  runApp(DesignPage());
}

class DesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          )
        )
      ),
          home:InputPage(),

      // routes: {
      //   'firstscreen': (context) =>
      //       InputPage(),
      //   'secondscreen': (context) =>
      //       ResultPage(),
      //
      // },
    );
  }
}




