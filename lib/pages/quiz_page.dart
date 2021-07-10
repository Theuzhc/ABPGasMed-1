import 'package:abpgasmed/controllers/quiz_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:abpgasmed/components/centered_circular_progress.dart';
import 'package:abpgasmed/components/centered_message.dart';
import 'package:abpgasmed/components/finish_dialog.dart';
import 'package:abpgasmed/components/result_dialog.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _controller = QuizController();
  List<Widget> _scoreKeeper = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controller.initialize();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        title: Text(
            'Quiz ( ${_scoreKeeper.length}/${_controller.questionsNumber} )'),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.green.shade300,
      body: Container(
        child: SafeArea(
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: _buildQuiz(),
            ),
          ),
        ),
      ),
    );
  }

  _buildQuiz() {
    if (_loading) return CenteredCircularProgress();

    if (_controller.questionsNumber == 0)
      return CenteredMessage(
        'Sem questões',
        icon: Icons.warning,
      );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildQuestion(_controller.getQuestion()),
        _buildAnswerButton(_controller.getAnswer1(), Colors.green.shade800),
        _buildAnswerButton(_controller.getAnswer2(), Colors.red.shade700),
        _buildAnswerButton(_controller.getAnswer3(), Colors.grey.shade500),
        _buildScoreKeeper(_controller.getAnswer1()),
      ],
    );
  }

  _buildQuestion(String question) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildAnswerButton(String answer, Color cor) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: GestureDetector(
            child: Container(
              height: 30,
              width: 30,
              padding: EdgeInsets.all(15.0),
              color: cor,
              child: Center(
                child: AutoSizeText(
                  answer,
                  maxLines: 2,
                  minFontSize: 10.0,
                  maxFontSize: 32.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            onTap: () {
              bool correct = _controller.correctAnswer(answer);

              ResultDialog.show(
                context,
                question: _controller.question,
                correct: correct,
                onNext: () {
                  setState(() {
                    _scoreKeeper.add(
                      Icon(
                        correct ? Icons.check : Icons.close,
                      ),
                    );

                    if (_scoreKeeper.length < _controller.questionsNumber) {
                      _controller.nextQuestion();
                    } else {
                      FinishDialog.show(context,
                          hitNumber: _controller.hitNumber,
                          questionNumber: _controller.questionsNumber);
                    }
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }

  _buildScoreKeeper(String answer) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  _scoreKeeper.removeLast();

                  if (_scoreKeeper.length < _controller.questionsNumber &&
                      _scoreKeeper.length >= 0) {
                    _controller.prevQuestion();
                  }
                });
              },
            )),
            (IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                setState(() {
                  _scoreKeeper.add(Icon(Icons.check));

                  if (_scoreKeeper.length < _controller.questionsNumber) {
                    _controller.nextQuestion();
                  } else {
                    FinishDialog.show(context,
                        hitNumber: _controller.hitNumber,
                        questionNumber: _controller.questionsNumber);
                  }
                });
              },
            )),
          ],
        ),
      ),
    );
  }
}
