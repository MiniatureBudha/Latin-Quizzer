import 'dart:math';

import '../Systems/TFQuestion.dart';

class QFactsData {
  int _questionNumber = 0;
  final List<TFQuestion> _questionBank = [
    TFQuestion("Ancient literature written in Latin is considered some of the best and most influential literature in the world.", "True", "False"),
    TFQuestion("Latin was the official language of the Roman Empire.", "True", "False"),
    TFQuestion("Words from the Latin language are still used today on a daily basis.", "True", "False"),
    TFQuestion("Latin and Italian are the two official languages of Vatican City, a sovereign state surrounded by Rome.", "True", "False"),
    TFQuestion("50% of all English words, and 80-90% of all multi-syllable words, are derived from Latin.", "True", "False"),
    TFQuestion("90% of the vocabulary of the 5 Romance Languages are derived from Latin.", "True", "False"),
    TFQuestion("The US one dollar bill includes 3 Latin phrases on the Great Seal of the United States.", "True", "False"),
    TFQuestion("Harvard University’s college arms include a shield with the word “VERITAS” = Latin for truth.", "True", "False"),
    TFQuestion("AM and PM are abbreviations of the Latin words Ante Meridiem (before midday) and Post Meridiem (after midday).", "True", "False"),
    TFQuestion("The highest Roman numeral that can be written is 3,999 (4,000 = MMMM and 4 of the same consecutive letters is not allowed).", "True", "False"),
  ];
  List<TFQuestion> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QFactsData() {
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
