import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QGovData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("In which year was the Saugatuck Chain Ferry established?", "1857", "1875", "1956", "1965", "1857"),
    Question("Prior to carrying people across the river, what did the Saugatuck Chain Ferry mostly carry?", "Horses", "Lumber", "Flowers", "Peaches", "Horses"),
    Question("The new Saugatuck Chain Ferry vessel, Diane, currently in use today was built by an engineer in 1965. Whom did he name the vessel after?", "His wife", "His mother", "His daughter", "His horse", "His wife"),
    Question("The steel-hulled, open-topped ferry is 8 feet wide and how many feet long?", "25", "20", "22", "28", "25"),
    Question("The Saugatuck Chain Ferry is one of how many remaining hand cranked chain ferries in the US?", "1", "2", "3", "5", "1"),
    Question("The Saugatuck Chain Ferry crew wear shirts with what tagline?", "Let Us Crank Your Chain", "Ball and Chain", "Human-Powered Chain Ferry", "Don’t Yank My Chain", "Let Us Crank Your Chain"),
    Question("How far across the Kalamazoo River does the Saugatuck Chain Ferry travel?", "350 feet", "400 feet", "450 feet", "500 feet", "350 feet"),
    Question("The Saugatuck Chain Ferry is propelled by a slender chain with 1-inch links fed through a sprocket as the hand crank rotates. How far below the surface of the Kalamazoo River does the chain rise and fall as the ferry passes?", "15 feet", "10 feet", "20 feet", "25 feet", "15 feet"),
    Question("How long does it take to travel across the river on the Saugatuck Chain Ferry?", "1.5 - 3.0 minutes", "3.0 - 4.5 minutes", "4.5 - 6.0 minutes", "6.0 - 7.5 minutes", "1.5 - 3.0 minutes"),
    Question("Who owns the Saugatuck Chain Ferry?", "The City of Saugatuck", "An local individual owner", "A national ferry company", "The Star of Saugatuck", "The City of Saugatuck"),
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
