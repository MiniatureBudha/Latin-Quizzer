import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QNumeralsData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("V", "5", "1", "10", "100", ""),
    Question("IX", "9", "10", "11", "4", ""),
    Question("X", "10", "5", "50", "100", ""),
    Question("L", "50", "5", "10", "100", ""),
    Question("C", "100", "1", "10", "1,000", ""),
    Question("D", "500", "10", "100", "1,000", ""),
    Question("M", "1,000", "10", "100", "10,000", ""),
    Question("LVII", "57", "107", "157", "557", ""),
    Question("MMXXIII", "2023", "1003", "1113", "1223", ""),
    Question("MMMCMXCIX", "3,999", "3,110", "3,119", "3,910", ""),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QNumeralsData() {
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
