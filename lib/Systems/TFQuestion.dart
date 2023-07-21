import 'package:flutter/material.dart';

class TFQuestion {
  String questionText;
  String answerText;
  String infoText;

  TFQuestion(this.questionText, this.answerText, this.infoText);

  bool isWord() {
    return false;
  }

  String getQuestionText() {
    return questionText;
  }

  String getAnswerText() {
    return answerText;
  }

  String getInfo() {
    return infoText;
  }

  void reverse() {}
}
