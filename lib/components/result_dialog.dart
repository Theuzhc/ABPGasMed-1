import 'package:flutter/material.dart';
import 'package:abpgasmed/models/question.dart';

class ResultDialog {
  static Future show(
    BuildContext context, {
    @required Question question,
    @required bool correct,
    @required Function onNext,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          actions: [
            FlatButton(
              child: const Text(
                'PRÓXIMO',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onNext();
              },
            )
          ],
        );
      },
    );
  }
}
