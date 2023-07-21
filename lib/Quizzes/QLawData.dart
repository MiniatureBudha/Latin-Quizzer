import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QLawData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("The U.S. legal system has its roots in what ancient civilization?", "Ancient Rome", "Ancient Egypt", "Ancient Mesopotamia", "Ancient Greece", "A significant amount of Latin carryover is seen in the U.S. legal system which descends from Europe, and in turn Ancient Rome."),
    Question("The extensive use of Latin terminology in the medical field has what benefit?", "All of the above", "Provides continuity between past and present", "Provides continuity around the world", "Provides consistent terms", "The continued use of Latin in the medical profession provides consistency and continuity worldwide."),
    Question("Learning Latin is often compared to what other subject?", "Mathematics", "Politics", "Biology", "Law", "Latin is a highly organized and logical language like math."),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QLawData() {
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
