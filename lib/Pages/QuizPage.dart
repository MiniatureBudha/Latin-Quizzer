import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/NovellaPage.dart';

import '../Components/StandardButton.dart';
import '../Constants/color_constants.dart';
import 'ChatBotPage.dart';
import 'MinigamePage.dart';
import 'QuizzerPage.dart';
import 'NovellaPage2.dart';
import 'NovellaPage3.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteBackround,
        appBar: AppBar(
          title: const Text(
            'Quiz Options',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'M PLUS Code Latin',
            ),
          ),
          backgroundColor: ColorConstants.whiteBackround,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          /*
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
           */
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Reading Comprehension 1", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NovellaPage();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Reading Comprehension 2", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NovellaPage2();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Reading Comprehension 3", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NovellaPage3();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Common Words", () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return QuizzerPage();
                    }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Latin Chat AI", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatBotPage();
                }));
              }),
            ),
          ), //Chat button
        ]
        )
    );
  }
}
