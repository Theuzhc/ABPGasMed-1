import 'package:flutter/material.dart';

class Inconformidades extends StatelessWidget {
  var answers = Map();
  Inconformidades({ Key key, @required this.answers }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inconformidades'),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.green.shade300,
      body: Center(
        child: ListView(
          // _inconformidades();
        ),
      )
    );
  }
}