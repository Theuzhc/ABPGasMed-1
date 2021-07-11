class AnswerController {
  int id_question;
  String answer;

  AnswerController(this.id_question, this.answer);
  

  @override
  String toString() {
    return '{ ${this.id_question}, ${this.answer} }';
  }
}
