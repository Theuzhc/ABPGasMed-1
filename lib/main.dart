import 'package:abpgasmed/pages/home_page.dart';
import 'package:abpgasmed/pages/quiz_page.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABPGásMed',
      theme: ThemeData(primarySwatch: Colors.green),
      home: _introScreen(), //QuizPage
    );
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.white, Colors.green],
        ),
        navigateAfterSeconds: Home(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/android_icon.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
          child: Text(
            'ABPGásMed',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
  );
}
