import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

import '../Systems/TFQuestion.dart';

class QStudyLatin {
  int _questionNumber = 0;
  final List<TFQuestion> _questionBank = [
    TFQuestion("Studying Latin improves a student’s overall performance in school.", "True", "False"),
    TFQuestion("Studying Latin improves verbal, analytic, and problem-solving skills.", "True", "False"),
    TFQuestion("Studying Latin develops critical thinking, problem solving skills, and attention to detail.", "True", "False"),
    TFQuestion("Studying Latin improves grammar, vocabulary, spelling, and speaking skills.", "True", "False"),
    TFQuestion("Studying Latin helps students more easily understand complex academic subjects.", "True", "False"),
    TFQuestion("Studying Latin promotes simultaneous learning and decreases the effort needed to learn many other subjects.", "True", "False"),
    TFQuestion("Studying Latin is a head start to studying all 5 of the Romance languages, including French, Italian, Portuguese, Romanian, and Spanish because they were all derived from Latin.", "True", "False"),
    TFQuestion("Studying Latin helps students on standardized tests.", "True", "False"),
    TFQuestion("Studying Latin and Classics helps maximize LSAT scores and is a great head start to the legal profession.", "True", "False"),
    TFQuestion("Studying Latin and Classics, as a major or double-major, results in a higher success rate of getting into medical school than for students who concentrate solely in biology, microbiology, and other branches of science alone.", "True", "False"),
  ];
  List<TFQuestion> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QStudyLatin() {
    _originalBank = List.from(_questionBank);
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      //so that there's no out of bounds error
      _questionNumber++;
    }
  }

  TFQuestion getQuestion() {
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

  void addQuestion(TFQuestion q) {
    _questionBank.add(q);
  }

  void swapAll() {
    for (int i = 0; i < _questionBank.length; i++) {
      if (_questionBank[i].isWord()) {
        _questionBank[i].reverse();
      }
    }
  }

  void newCycle(List<TFQuestion> wrongQuestions) {
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
