import 'package:flutter/material.dart';
import 'TFQuestion.dart';
import 'question.dart';

class Word extends TFQuestion {
  Word(String questionText, String answerText, String infoText)
      : super(questionText, answerText, infoText);

  @override
  void reverse() {
    String temp = questionText;
    questionText = answerText;
    answerText = temp;
  }

  @override
  bool isWord() {
    return true;
  }
}
