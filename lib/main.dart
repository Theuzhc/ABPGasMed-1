import 'package:abpgasmed/pages/quiz_page.dart';
import 'package:abpgasmed/pages/result_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABPGásMed',
      theme: ThemeData(primarySwatch: Colors.green),
      home: QuizPage(), //QuizPage
    );
  }
}
