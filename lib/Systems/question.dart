import 'package:flutter/material.dart';

class Question {
  String questionText;
  String answerText;
  String wrongAns1;
  String wrongAns2;
  String wrongAns3;
  String infoText;

  Question(this.questionText, this.answerText, this.wrongAns1, this.wrongAns2, this.wrongAns3, this.infoText);

  bool isWord() {
    return false;
  }

  String getQuestionText() {
    return questionText;
  }

  String getAnswerText() {
    return answerText;
  }

  String getWrong1() {
    return wrongAns1;
  }

  String getWrong2() {
    return wrongAns2;
  }

  String getWrong3() {
    return wrongAns3;
  }

  String getInfoText() {
    return infoText;
  }

  void reverse() {}
}
