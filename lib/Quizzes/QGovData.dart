import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QGovData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("The U.S. Constitution contains approximately 4,500 words. Other than English, what one other language is included?", "Latin", "Greek", "French", "Italian", "There are three Latin phrases used in the U.S. Constitution, including pro tempore, ex post facto, and habeas corpus."),
    Question("America’s Founding Fathers wanted to create a republic and modeled what aspects of America’s government system after the Roman Republic?", "All of the above", "Separation of power", "The U.S. Senate", "Elections", "Inspired by the Roman Republic and its ability to preserve liberty for hundreds of years, the Founding Fathers used history as a guide for creating the U.S. Constitution."),
    Question("Which Latin word was a included in the Roman constitution before the U.S. Constitution?", "All of the above", "Capitol", "Committee", "Senate", "America’s Founding Fathers were well-versed in the Roman constitution and borrowed many Latin words and ideas when creating the U.S. Constitution."),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QGovData() {
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
