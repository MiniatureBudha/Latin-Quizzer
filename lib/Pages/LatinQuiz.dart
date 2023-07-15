import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:flutter_app/Systems/Quizzer.dart';
import 'package:flutter_app/Systems/question.dart';
import 'package:flutter_app/Components/ExpandableButton.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'dart:math';
import 'dart:async';
import 'HomePage.dart';

class LatinQuiz extends StatefulWidget {
  const LatinQuiz({super.key});

  @override
  LatinQuizState createState() => LatinQuizState();
}

class LatinQuizState extends State<LatinQuiz> {
  Quizzer q = Quizzer();
  List<String> answerChoicesList = [
    "",
    "",
    "",
    ""
  ]; //saves choices when answerChoices() is called
  List<Question> wrongQuestions = []; //could be both vocab + other questions
  List<Color> answerChoiceColors = [
    ColorConstants.buttonColor,
    ColorConstants.buttonColor,
    ColorConstants.buttonColor,
    ColorConstants.buttonColor
  ];
  int correctChoiceIndex = -1;
  double progressPercent = 0;
  int correctlyAnswered = 0;
  List<VoidCallback> buttonFunctions = [];

  QuizzerPageState() {
    initialize();
  }

  AlertDialog? nextQuestion() {
    if (q.isFinished()) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'COMPLETE',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'M PLUS Code Latin',
                ),
              ),
              content: Text(
                '$correctlyAnswered out of ${q.size()} correct.',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'M PLUS Code Latin',
                ),
              ),
              backgroundColor: ColorConstants.blueBackground,
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    if (correctlyAnswered == q.size()) {
                      q.reset();
                      progressPercent = 0;
                      correctlyAnswered = 0;
                      Navigator.of(context).pop();
                      setState(() {
                        initialize();
                      });
                    } else {
                      q.newCycle(wrongQuestions);
                      progressPercent = 0;
                      correctlyAnswered = 0;
                      Navigator.of(context).pop();
                      setState(() {
                        initialize();
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ColorConstants.buttonColor,
                  ),
                  child: const Text(
                    'Take Quiz Again',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'M PLUS Code Latin',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  })),
                  style: TextButton.styleFrom(
                    backgroundColor: ColorConstants.buttonColor,
                  ),
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'M PLUS Code Latin',
                    ),
                  ),
                ),
              ],
            );
          });
    }

    setState(() {
      progressPercent += (100 * (1 / q.size()));
      for (int i = 0; i < 4; i++) {
        //resets answer choice colors to default
        answerChoiceColors[i] = ColorConstants.buttonColor;
      }
      q.nextQuestion();
      changeAnswerChoices();
    });
  }

  void changeAnswerChoices() {
    //only works if there's more than 4 questions in the question bank
    answerChoicesList.clear();

    List<String> choices = ["", "", "", ""];
    List<String> wrongChoices = ["", "", ""];

    correctChoiceIndex = Random().nextInt(4);
    choices[correctChoiceIndex] = q.getCorrectAnswer();

    for (int i = 0; i < 3; i++) {
      String randomAnswer = q.randomAnswer();

      while (randomAnswer ==
          q.getCorrectAnswer()) {
        //makes sure it's not the right answer
        randomAnswer = q.randomAnswer();
      }

      wrongChoices[i] = randomAnswer;
    }

    while (wrongChoices[0] == wrongChoices[1] ||
        wrongChoices[0] == wrongChoices[2] ||
        wrongChoices[1] == wrongChoices[2]) {
      if (wrongChoices[0] == wrongChoices[1]) {
        String randomAnswer = q.randomAnswer();

        while (randomAnswer == q.getCorrectAnswer()) {
          randomAnswer = q.randomAnswer();
        }

        wrongChoices[1] = randomAnswer;
      }

      if (wrongChoices[0] == wrongChoices[2]) {
        String randomAnswer = q.randomAnswer();

        while (randomAnswer == q.getCorrectAnswer()) {
          randomAnswer = q.randomAnswer();
        }

        wrongChoices[2] = randomAnswer;
      }

      if (wrongChoices[1] == wrongChoices[2]) {
        String randomAnswer = q.randomAnswer();

        while (randomAnswer == q.getCorrectAnswer()) {
          randomAnswer = q.randomAnswer();
        }

        wrongChoices[2] = randomAnswer;
      }
    } //makes sure choices all distinct

    int j = 0;
    for (int i = 0; i < 4; i++) {
      //potential trouble spot
      if (i != correctChoiceIndex) {
        choices[i] = wrongChoices[j];
        j++;
      }
    }

    for (int i = 0; i < 4; i++) {
      answerChoicesList.add(choices[i]);
    }
  }

  void initialize() {
    changeAnswerChoices();
    for (int i = 0; i < 4; i++) {
      buttonFunctions.add(() => questionAnimation(i));
    }
  }

  void check(int choiceIndex) {
    answerChoiceColors[correctChoiceIndex] = ColorConstants
        .correctGreen; //so that right answer displayed when question wrong

    if (choiceIndex != correctChoiceIndex) {
      answerChoiceColors[choiceIndex] = ColorConstants.logoRed;
      wrongQuestions.add(q.getQuestion());
    } else
      correctlyAnswered++;
  }

  void questionAnimation(int choiceIndex) {
    int time = 1;

    setState(() {
      check(choiceIndex);
    });

    if (choiceIndex != correctChoiceIndex) time = 5;

    for (int i = 0; i < 4; i++) {
      buttonFunctions[i] =
          () => null; //locks out buttons after user answers question
    }

    Timer(Duration(seconds: time), () {
      nextQuestion();
      for (int i = 0; i < 4; i++) {
        buttonFunctions[i] = () => questionAnimation(i);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Quizzer',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'M PLUS Code Latin',
          ),
        ),
        backgroundColor: ColorConstants.blueBackground,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FAProgressBar(
                size: 5,
                progressColor: ColorConstants.deepPurple,
                currentValue: progressPercent,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    q.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'M PLUS Code Latin',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ExpandableButton(
                            answerChoicesList[0],
                            buttonFunctions[0],
                            answerChoiceColors[
                                0]), //make function for onPressed
                        ExpandableButton(answerChoicesList[1],
                            buttonFunctions[1], answerChoiceColors[1]),
                        ExpandableButton(answerChoicesList[2],
                            buttonFunctions[2], answerChoiceColors[2]),
                        ExpandableButton(answerChoicesList[3],
                            buttonFunctions[3], answerChoiceColors[3]),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.blueBackground,
        child: Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorConstants.blueBackground,
                ),
                child: Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
              OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorConstants.blueBackground,
                ),
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return HomePage();
                })),
              ),
              OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorConstants.blueBackground,
                ),
                child: Icon(
                  Icons.info,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
