import 'question.dart';
import 'dart:math';

class Quizzer {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("1+1", "2"),
    Question("2+2", "4"),
    Question("10+10", "20"),
    Question("100+100", "200"),
    Question("10*10", "100"),
    Question("15*15", "225"),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  Quizzer() {
    _originalBank = List.from(_questionBank);
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      //so that there's no out of bounds error
      _questionNumber++;
    }
  }

  Question getQuestion() {
    return _questionBank[_questionNumber];
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].answerText;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void addQuestion(Question q) {
    _questionBank.add(q);
  }

  void swapAll() {
    for (int i = 0; i < _questionBank.length; i++) {
      if (_questionBank[i].isWord()) {
        _questionBank[i].reverse();
      }
    }
  }

  void newCycle(List<Question> wrongQuestions) {
    _questionNumber = 0;
    //removes questions user answered correctly
    _questionBank.clear();
    _questionBank.addAll(wrongQuestions);
  }

  void reset() {
    _questionNumber = 0;
  }

  String randomAnswer() {
    return _originalBank[Random().nextInt(_originalBank.length)]
        .getAnswerText();
  }

  int size() {
    return _questionBank.length;
  }
}
