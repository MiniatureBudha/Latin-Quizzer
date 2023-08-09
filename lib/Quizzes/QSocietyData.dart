import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QSocietyData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("What buildings in Washington D.C. are inspired by Roman and Greek style architecture?", "All of the above", "Capitol Building", "White House", "Lincoln Memorial", "Roman and Greek art & architecture have influenced government and public buildings for thousands of years."),
    Question("Romans are known for their advances in what types of infrastructure?", "All of the above", "Roads, bridges & tunnels", "Water systems", "Concrete & buildings", "Romans were great engineers, building structural marvels 2,500 years ago that are still in use and inspiring engineering projects today. Sections of Via Appia (The Appian Way), the most strategically important Roman Road, still have original cobbles dating from 312 BC."),
    Question("Architect Daniel Burham modeled the what 1907 building after buildings in Ancient Roman?", "Union Station (Chicago)", "Grand Central Terminal (NYC)", "Union Station (DC)", "Pennsylvania Station (NYC)", "Burnham modeled the arches in Union Station after the Arch of Constantine and the grand vaulted spaces after the Baths of Diocletian, both in Rome. Often used in Roman Architecture, he also included elaborate marble, columns, sculptures, and gold leaf in the building.",),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QSocietyData() {
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
