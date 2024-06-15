import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:flutter_app/Quizzes/QGovData.dart';
import 'package:flutter_app/Systems/question.dart';
import 'package:flutter_app/Components/ExpandableButton.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'dart:math';
import 'dart:async';

class QGov extends StatefulWidget {
  const QGov({super.key});

  @override
  QGovState createState() => QGovState();
}

class QGovState extends State<QGov> {
  QGovData q = QGovData();
  List<String> answerChoicesList = [
    "",
    "",
    "",
    ""
  ]; //saves choices when answerChoices() is called
  List<Question> wrongQuestions = []; //could be both vocab + other questions
  List<Question> allQuestions = [];
  List<Color> answerChoiceColors = [
    ColorConstants.buttonColor,
    ColorConstants.buttonColor,
    ColorConstants.buttonColor,
    ColorConstants.buttonColor
  ];
  int correctChoiceIndex = -1;
  double progressPercent = 0;
  int nQuest = 1;
  int correctlyAnswered = 0;
  List<VoidCallback> buttonFunctions = [];

  QGovState() {
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
                'Congrats!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.blueAccent,
                  fontFamily: 'Lato',
                ),
              ),
              content: Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '$correctlyAnswered out of ${q.size()} correct.',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Lato',
                        ),
                      ),
                      const SizedBox(width: 50, height: 50),
                      goodImage(),
                    ],
                  )
              ),
              backgroundColor: Colors.white,
              actionsAlignment: MainAxisAlignment.center,
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    q.reset();
                    nQuest = 1;
                    progressPercent = 0;
                    correctlyAnswered = 0;
                    Navigator.of(context).pop();
                    setState(() {
                      initialize();
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ColorConstants.buttonColor,
                  ),
                  child: const Text(
                    'Again',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
                  style: TextButton.styleFrom(
                    backgroundColor: ColorConstants.buttonColor,
                  ),
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Lato',
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
        nQuest++;
        q.nextQuestion();
        changeAnswerChoices();
      }
    );
    return null;
  }

  AlertDialog? qInfo() {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text(
              'Answer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.blueAccent,
                fontFamily: 'Lato',
              ),
            ),
            content: Text(
              textAlign: TextAlign.center,
              allQuestions[allQuestions.length-1].infoText,
            ),
          );
        }
    );
    return null;
  }

  void changeAnswerChoices() {
    //only works if there's more than 4 questions in the question bank
    answerChoicesList.clear();

    List<String> choices = ["", "", "", ""];
    List<String> wrongChoices = ["", "", ""];

    if(q.getCorrectAnswer() == "All of the above"){
      choices[3] = q.getCorrectAnswer();
      correctChoiceIndex = 3;
    }
    else{
      correctChoiceIndex = Random().nextInt(4);
      choices[correctChoiceIndex] = q.getCorrectAnswer();
    }

    for (int i = 0; i < 3; i++) {
      String wrongAns = "";
      if(i == 0){
        wrongAns = q.getQuestion().wrongAns1;
      }
      else if(i == 1){
        wrongAns = q.getQuestion().wrongAns2;
      }
      else if(i == 2){
        wrongAns = q.getQuestion().wrongAns3;
      }
      while (wrongAns == q.getCorrectAnswer()) {
        wrongAns = q.randomAnswer();
      }
      wrongChoices[i] = wrongAns;
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
    allQuestions.add(q.getQuestion());
    answerChoiceColors[correctChoiceIndex] = ColorConstants
        .correctGreen; //so that right answer displayed when question wrong

    if (choiceIndex != correctChoiceIndex) {
      answerChoiceColors[choiceIndex] = ColorConstants.logoRed;
      wrongQuestions.add(q.getQuestion());
    }
    else {
      correctlyAnswered++;
    }
  }

  Widget goodImage(){
    if(correctlyAnswered/q.size() >= .8){
      return const Image(image: ResizeImage(AssetImage('assets/BlueStar.jpg'), width: 150, height: 120));
    }
    else{
      return const SizedBox(
        width: 100,
        height: 100,
      );
    }
  }

  void questionAnimation(int choiceIndex) {
    int time = 1;

    setState(() {
      check(choiceIndex);
    });

    if (choiceIndex != correctChoiceIndex) time = 2;

    for (int i = 0; i < 4; i++) {
      buttonFunctions[i] =
          () {}; //locks out buttons after user answers question
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
      backgroundColor: ColorConstants.whiteBackround,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Saugatuck Chain Ferry',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FAProgressBar(
                size: 5,
                progressColor: Colors.yellowAccent,
                currentValue: progressPercent,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '$nQuest of ${q.size()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      q.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Lato',
                      ),
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
        color: Colors.blueAccent,
        child: Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}