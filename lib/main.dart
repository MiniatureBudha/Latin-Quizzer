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
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
               child: const Image(image: ResizeImage(AssetImage('assets/Logo.png'), width: 220, height: 220)),
            ),
          ), //says Latin Learner
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Introduction to Latin", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Intro1(); //Make text pages later
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