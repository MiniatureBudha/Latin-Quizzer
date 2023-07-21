import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:flutter_app/Components/StandardButton.dart';
import 'package:flutter_app/Pages/SnippetsQuizPage.dart';
import 'package:flutter_app/Pages/RomeQuizPage.dart';
import 'package:flutter_app/Pages/LatinQuiz.dart';
import 'package:flutter_app/Pages/QuizPage.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';


import 'Constants/color_constants.dart';
import 'Pages/Intro1.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

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
            fontFamily: 'Neohellenic',
          ),
        ),
        backgroundColor: ColorConstants.buttonColor
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
               child: const Image(image: ResizeImage(AssetImage('assets/Logo2.png'), width: 200, height: 200)),
            ),
          ), //says Latin Learner
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Introduction to Latin", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Intro1();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Ancient Rome in Our Modern World", () {
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