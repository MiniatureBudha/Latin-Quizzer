import 'package:flutter_app/Systems/question.dart';
import 'dart:math';

class QBeachData {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question("Which of the following was Oval Beach NOT named one of?", "Top 10 Beaches Worldwide - Tripadvisor", "Top 25 Beaches in the World - Conde Nast Traveler", "Top 2 Freshwater Beaches in the USA - National Geographic Traveler", "Top 5 Beaches in the USA - MTV", "Top 10 Beaches Worldwide - Tripadvisor"),
    Question("Oval Beach is bordered on the north by what body of water?", "Kalamazoo River", "Douglas River", "Michigan River", "Saugatuck River", "Kalamazoo River"),
    Question("Approximately how many miles north is the walk on foot through the Saugatuck Harbor Natural Area from Oval Beach to the mouth of the Kalamazoo River?", "1 mile", "0.5 miles", "1,5 mile", "2 mile", "1 mile"),
    Question("Why was Oval Beach named Oval Beach?", "Its first parking lot was poured in the shape of an “oval”", "It was named after an old, nearby ghost town named “Oval”", "It was the hometown of Saugatuck’s first settler", "It was named after a popular dance hall in town named “Oval Pavillion”", "Its first parking lot was poured in the shape of an “oval”"),
    Question("Prior to becoming a permanent settlement in 1830, Oval Beach was a summer retreat for which Native American tribe?", "Pottawatomie", "Chippewa", "Odawa", "Menominee", "Pottawatomie"),
    Question("Which Great Lake is wholly located within the United States?", "Lake Michigan", "Lake Superior", "Lake Huron", "Lake Erie", "Lake Michigan"),
    Question("Lake Michigan is second in terms of volume of water to which Great Lake?", "Lake Superior", "Lake Ontario", "Lake Huron", "Lake Erie", "Lake Superior"),
    Question("How many miles of shoreline does Lake Michigan have for us to enjoy?", "1,638", "1,137", "1,943", "2,256", "1,638"),
    Question("Lake Michigan’s maximum depth is 925 feet. What is its average depth?", "279 feet", "179 feet", "379 feet", "479 feet", "279 feet"),
    Question("Lake Michigan is, uniquely, the best place to find what type of stone?", "Petoskey Stone", "Dolmine", "Pumice", " Quartz", "Petoskey Stone"),
  ];
  List<Question> _originalBank =
  []; //preserves original questions so that even after another round with less questions is started, random answer choices still draw from original bank (so that there's no repeats when there's less than 4 questions)

  QBeachData() {
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
