import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QBaldData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("Mount Baldhead, also known as Mt. Baldy and Radar Hill, is a sand dune located on a narrow strip of land between Lake Michigan (to its west) and what river (to its east)?", "Kalamazoo River", "Saugatuck River", "Douglas River", "Michigan River", "Kalamazoo River"),
    Question("In what year did Mt. Baldhead become a Saugatuck Village Park?", "1882", "1830", "1861", "1894", "1882"),
    Question("How tall is Mt. Baldhead?", "230 feet", "170 feet", "200 feet", "260 feet", "230 feet"),
    Question("How many stairs lead up the east side of the Mt. Baldhead dune from the parking lot?", "302", "280", "288", "296", "302"),
    Question("The popular Mt. Baldhead Challenge is an annual, multi-terrain 5K foot race with 302 steps, 750+ feet of elevation, 50% trails, and 50% water views held in what month?", "September", "October", "May", "June", "September"),
    Question("Some stories claim that Mt. Baldhead was named because it wasn’t always covered in trees, thus bald. Others claim that Native Americans named the dune because it is home to what bird?", "Bald Eagle", "Turkey Vulture", "Golden Eagle", "Sand Hill Crane", "Bald Eagle"),
    Question("Mt. Baldhead wasn’t always covered with trees. The trees were planted on the bare sand, starting in 1887, to help stabilize the dune. This was done after an old lumber and ship-building town was buried in sand after clear cutting removed the trees that once prevented erosion. What was the name of the town?", "Singapore", "Oval", "Manistee", "Butler", "Singapore"),
    Question("What is the white ball atop Mt. Baldhead called?", "Saugatuck Gap Filler Annex", "Saugatuck Water Tower", "Saugatuck Rain Dome", "Saugatuck Geodesic Radar", "Saugatuck Gap Filler Annex"),
    Question("The Saugatuck Gap Filler Annex, or large white golf ball, atop Mt. Baldhead is a decommissioned SAGE air defense radar installation built for the United States Air Force. Of the hundreds of SAGE radars, Saugatuck’s is one of how many that remain nearly completely intact?", "1-2", "5-6", "9-10", "13-15", "1-2"),
    Question("The Saugatuck Gap Filler Annex was built during which era?", "Cold War", "Korean War", "WWII", "Vietnam War", "Cold War"),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QBaldData() {
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
