import 'package:flutter/material.dart';

class Question {
  String questionText;
  String answerText;

  Question(this.questionText, this.answerText);

  bool isWord() {
    return false;
  }

  void reverse() {}
}
