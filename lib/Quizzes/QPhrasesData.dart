import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QPhrasesData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("Veni, vidi, veci", "I came, I saw, I conquered", "I proclaim victory", "I want you", "Fight, win, prevail", "Attributed to Julius Caesar in a message he sent to the Roman Senate after a swift victory."),
    Question("Carpe diem", "Seize the day", "Seize the money", "Seize the victory", "Seize the wine", "A very popular Latin phrase used in modern times, although “carpe vinum” does mean seize the wine."),
    Question("Alea iacta est", "The die has been cast", "The moment of truth", "When push comes to shove", "What's done is done", "Said by Julius Caesar upon beginning a long civil war to indicate that there was no turning back."),
    Question("In vino veritas", "In wine, there is truth", "Love, like wine, gets better with time", "When there is no wine, there is no love", "Love the wine you’re with", "Often followed by “In aqua sanitas,” or in water there is health, this phrase refers to revealing your secrets if you drink too much wine."),
    Question("Et tu, Brute?", "And you, Brutus?", "Eggs for you, Brutus?", "What do you think, Brutus?", "How are you, Brutus?", "This phrase is used to jokingly call out a friend’s change of heart, quoted from Shakespeare‘s play “Julius Caesar” where Caesar is betrayed by his friend, Brutus."),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QPhrasesData() {
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
