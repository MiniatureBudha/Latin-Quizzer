import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QWordsData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("Select the Latin words that mean: Created when special as needed", "ad hoc", "impromptu", "provisional", "special", "ad (to/for) + hoc (this) = for this situation"),
    Question("Select the Latin words that mean: Seize the day", "carpe diem", "celebrate", "enjoy", "proclaim", "carpe (pluck) + diem (day) = pluck the day"),
    Question("Select the Latin words that mean: And other similar things", "et cetera", "moreover", "furthermore", "including", "et (and) + cetera (the rest) = and the rest"),
    Question("Select the Latin words that mean: An allowance given each day", "per diem", "money", "quota", "aid", "per (through/during) + diem (day) = through the day"),
    Question("Select the Latin words that mean: A person's second or alternative personality", "alter ego", "doppelganger", "evil twin", "nemesis", "alter (the other) + ego (I) = the other I"),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QWordsData() {
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
    _questionBank.clear();
    _questionBank.addAll(_originalBank);
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
