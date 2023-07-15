import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:flutter_app/Components/StandardButton.dart';
import 'package:flutter_app/Pages/SettingsPage.dart';
import 'package:flutter_app/Pages/SnippetsQuizPage.dart';
import 'package:flutter_app/Pages/StatsPage.dart';
import 'QuizPage.dart';
import 'RomeQuizPage.dart';
import 'LatinQuiz.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteBackround,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.red,
            fontFamily: 'M PLUS Code Latin',
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 125, 0, 150),
              child: const Text(
                'Latin Learner',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                  fontFamily: 'Cedarville Cursive',
                ),
              ),
            ),
          ), //says Latin Learner
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Introduction to Latin", () {
                Colors.yellow;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QuizPage(); //Make text pages later
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Ancient Rome in our Modern World", () {
                Colors.yellow;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RomeQuizPage();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Latin Snippets", () {
                Colors.yellow;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SnippetsQuizPage();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Why Study Latin", () {
                Colors.yellow;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LatinQuiz();
                }));
              }),
            ),
          ),
        ],
      ),
    );
  }
}