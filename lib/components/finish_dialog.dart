import 'package:abpgasmed/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:abpgasmed/pages/quiz_page.dart';
import 'package:share/share.dart';

final String hit = '';

class FinishDialog {
  static Future show(
    BuildContext context, {
    @required int corrects,
    @required int aplicable,
    @required int questionNumber,
  }) {
    double perc = corrects / aplicable;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 35.0,
            child: Icon(
              Icons.favorite,
              color: Colors.grey.shade900,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Parabéns',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Você acertou ${(perc * 100).toStringAsFixed(2)}% de $questionNumber questões!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              child: const Text(
                'COMPARTILHAR',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Share.share(
                    'Quiz ABPGÁSMED. Você acertou ${corrects} de $questionNumber questões!');
              },
            ),
            FlatButton(
              child: const Text(
                'VER RESULTADOS',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Conformidade(value: perc)),
                );
              },
            ),
            FlatButton(
              child: const Text(
                'SAIR',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
            )
          ],
        );
      },
    );
  }
}
