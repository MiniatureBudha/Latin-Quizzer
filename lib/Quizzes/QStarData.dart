import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QStarData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("The Star of Saugatuck II is what type of paddleboat?", "Sternwheeler", "Sidewheeler", "Inboard Paddlewheeler", "Redwheeler", "Sternwheeler"),
    Question("The Star of Saugatuck II received US Coast Guard certification and opened for business in June of what year?", "2000", "1965", "1985", "1990", "2000"),
    Question("Prior to the Star of Saugatuck II going into service, another sternwheeler operated in Saugatuck along the Kalamazoo River from 1978-2000. What was the name of that paddleboat?", "The Queen of Saugatuck", "The Star of Saugatuck I", "The Lady of Saugatuck", "The Lady of the Kalamazoo", "The Queen of Saugatuck"),
    Question("The Star of Saugatuck II was built at the “Shag Shop” in what US City?", "Saugatuck", "Boston", "Providence", "Waco", "Saugatuck"),
    Question("The Star of Saugatuck II was made with just over how many pounds of steel?", "100,000", "50,000", "75,000", "125,000", "100,000"),
    Question("How many tons does the Star of Saugatuck II weigh?", "51 gross, 41 net", "31 gross, 41 net", "41 gross, 51 net", "61 gross, 51 net", "51 gross, 41 net"),
    Question("What is the total length of the Star of Saugatuck II, including vessel and paddlewheel?", "80 feet", "60 feet", "70 feet", "90 feet", "80 feet"),
    Question("How many passengers can the Star of Saugatuck II seat?", "120", "90", "100", "110", "120"),
    Question("A tour on the Star of Saugatuck II takes approximately how long?", "90 minutes", "30 minutes", "60 minutes", "120 minutes", "90 minutes"),
    Question("Which body of water does the Star of Saugatuck II NOT visit?", "The Saugatuck River", "Lake Michigan", "The Kalamazoo River", " LakeKalamazoo", "The Saugatuck River"),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QStarData() {
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
