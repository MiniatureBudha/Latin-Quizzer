import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/FillBlankPage.dart';

import '../Components/StandardButton.dart';
import '../Constants/color_constants.dart';
import 'ChatPage.dart';
import 'MinigamePage.dart';
import 'QuizzerPage.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueBackground,
      appBar: AppBar(
        title: const Text('Quiz Options',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'M PLUS Code Latin',
          ),
        ),
        backgroundColor: ColorConstants.blueBackground,
      ),
    body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Chat", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatPage();
                }));
              }),
            ),
          ), //Chat button
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Minigame", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MinigamePage();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Quizzer", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QuizzerPage();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Fill In The Blank", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FillBlankPage();
                }));
              }),
            ),
          ),
        ]
    )
    );
  }
}
