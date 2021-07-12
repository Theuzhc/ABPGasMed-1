import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:abpgasmed/models/question.dart';

class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url =
          'https://script.google.com/macros/s/AKfycbzkvezkSPtIoPk-BD-bLP-9nTCEql8i7VArstvESX8L1yOybp63Qfj6ptuG-zoI2P2T/exec';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(
            data["questions"].map((x) => Question.fromMap(x)));
      } else {
        return <Question>[];
      }
    } catch (error) {
      print(error);
      return <Question>[];
    }
  }
}
