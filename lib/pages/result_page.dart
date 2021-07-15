import 'package:abpgasmed/pages/inconformity_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'quiz_page.dart';

class Conformidade extends StatelessWidget {
  var answers = Map();
  String hospital;
  String name;

  Conformidade(
      {Key key,
      @required this.answers,
      @required this.hospital,
      @required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Percentual de Conformidades '),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.green.shade300,
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      "$hospital",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey.shade200,
                          semanticsValue: perc().toString(),
                          semanticsLabel: 'Conformidades',
                          strokeWidth: 30,
                          value: perc(),

                          // receber porcentagem da pg anterior
                        ),
                      )),
                ),
                Text(
                  (perc() * 100).toStringAsPrecision(2) + '%',
                  style: TextStyle(fontSize: 30),
                ),
                _buildAnswerButton('Verificar inconformidades', context, name,
                    hospital, 'Inconformidades'),
                _buildAnswerButton('Evolução', context, name, hospital, ''),
                _buildAnswerButton(
                    'Responda novamente', context, name, hospital, 'QuizPage'),
              ]))),
    );
  }

  _buildAnswerButton(String answer, BuildContext context, String name,
      String hospital, String page) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: GestureDetector(
              child: Container(
                height: 50,
                // width: 30,
                padding: EdgeInsets.all(1.0),
                color: Colors.green.shade300,
                child: Center(
                  child: AutoSizeText(
                    answer,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizPage(
                            name: name,
                            hospital: hospital,
                          )),
                );
              }),
        ),
      ),
    );
  }

  double perc() {
    int cont = 0;
    int na = 0;
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == 'Sim') ++cont;
      if (answers[i] == 'Não se aplica') ++na;
    }
    double perc = cont / (answers.length - na);
    print(perc);
    return perc;
  }
}
