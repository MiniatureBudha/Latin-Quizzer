import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QLangData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("What percentage of multi-syllable words in English are derived from Latin?", "80-90%", "20-30%", "40-50%", "60-70%", "50% of all English words and 80-90% of all multi-syllable words are derived from Latin."),
    Question("What percentage of vocabulary in the 5 Romance languages come from Latin (French, Spanish, Latin, Portuguese, Romanian)?", "90%", "30%", "50%", "70%", "Romance languages evolved from Latin; 90% of their vocabulary stems from Latin."),
    Question("Where do we see Roman numerals today?", "All of the above", "Books", "Clocks", "Plays", "We see Roman numerals on clocks, as book chapters, as acts of a play, and in the Olympics and Super Bowl titles."),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QLangData() {
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
