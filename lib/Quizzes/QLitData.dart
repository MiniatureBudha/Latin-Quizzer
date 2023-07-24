import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QLitData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("William Shakespeare was heavily influenced by Roman theater. Which of the following was not one of Shakespeare’s 3 famous Roman tragedies?", "Twelfth Night", "Julius Caesar", "Antony and Cleopatra", "Coriolanus", "Twelfth Night is a comedy, not a tragedy, by William Shakespeare."),
    Question("Latin literature, particularly poems, include some of the most influential and celebrated works in history. Which one of the following poets was not Roman?", "Homer", "Virgil", "Ovid", "Horace", "Although an equally great literary poet, Homer was Greek, not Roman."),
    Question("Which of the following famous English authors studied and reflected Latin vigorously in their work?", "All of the above", "Tolkien", "Swift", "Milton", "Early English literature was heavily influenced by Latin, and these authors are often listed as some of the best in history."),
    Question("Gladiator, The Hunger Games, and Clash of the Titans are examples of modern entertainment that showcase Roman “heroes.” Which of the following was not a Roman God or Goddesses?", "Spartacus", "Cupid", "Apollo", "Venus", "Apollo, Cupid, and Venus are Roman Gods and Goddesses, but Spartacus is a famous Roman gladiator."),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QLitData() {
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
