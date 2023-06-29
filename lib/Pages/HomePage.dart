import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:flutter_app/Components/StandardButton.dart';
import 'package:flutter_app/Pages/SettingsPage.dart';
import 'package:flutter_app/Pages/StatsPage.dart';
import 'QuizPage.dart';
import 'ChatPage.dart';
import 'MinigamePage.dart';
import 'StatsPage.dart';
import 'SettingsPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
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
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 125, 0, 150),
              child: const Text(
                'Latin Learner',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'Cedarville Cursive',
                ),
              ),
            ),
          ), //says Latin Learner
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Quizzing Options", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QuizPage();
                }));
              }),
            ),
          ), //Quizzer
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Chat", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatPage();
                }));
              }),
            ),
          ), //Chat Button
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
              child: StandardButton("Stats", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StatsPage();
                }));
              }),
            ),
          ), //Stats Page
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Settings", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingsPage();
                }));
              }),
            ),
          ), //Settings Page
        ],
      ),
    );
  }
}

/*
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.blueBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OutlinedButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorConstants.buttonColor,
              ),
              onPressed: (){},
              child: Icon(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'M PLUS Code Latin',
                ),
              ),
            ),
          ],
        ),
      ),
       */
