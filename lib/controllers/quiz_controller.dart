import 'package:abpgasmed/models/question.dart';
import 'package:abpgasmed/services/quiz_api.dart';

class QuizController {
  List<Question> _questionBank;

  int questionIndex = 0;
  int hitNumber = 0;

  int get questionsNumber => _questionBank?.length ?? 0;
  Question get question => _questionBank[questionIndex];

  Future<void> initialize() async {
    questionIndex = 0;
    hitNumber = 0;
    _questionBank = await QuizApi.fetch();
    print('Number of questions: ${_questionBank.length}');
    _questionBank.shuffle();
  }

  void nextQuestion() {
    questionIndex = ++questionIndex % _questionBank.length;
  }

  void prevQuestion() {
    questionIndex = --questionIndex % _questionBank.length;
  }

  String getQuestion() {
    return _questionBank[questionIndex].question;
  }

  String getAnswer1() {
    return _questionBank[questionIndex].answer1;
  }

  String getAnswer2() {
    return _questionBank[questionIndex].answer2;
  }

  String getAnswer3() {
    return _questionBank[questionIndex].answer3;
  }

  bool correctAnswer(String answer) {
    var correct = _questionBank[questionIndex].answer1 == answer;
    hitNumber = hitNumber + (correct ? 1 : 0);
    return correct;
  }
}