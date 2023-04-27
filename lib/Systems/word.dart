import 'package:flutter/material.dart';
import 'question.dart';

class Word extends Question {
  Word(String questionText, String answerText)
      : super(questionText, answerText);

  void reverse() {
    String temp = questionText;
    questionText = answerText;
    answerText = temp;
  }

  bool isWord() {
    return true;
  }
}
