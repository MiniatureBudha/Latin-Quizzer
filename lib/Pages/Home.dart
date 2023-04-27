import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:flutter_app/Components/StandardButton.dart';
import 'QuizPage.dart';
import 'ChatPage.dart';
import 'MinigamePage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueBackground,
      appBar: AppBar(
        title: Text(
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
              child: Text(
                'Latin Learner',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'Cedarville Cursive',
                ),
              ),
              margin: EdgeInsets.fromLTRB(0, 125, 0, 150),
            ),
          ), //says Latin Learner
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: StandardButton("Quizzer", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QuizPage();
                }));
              }),
            ),
          ), //Quizzer button
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
          ), //Minigame button
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.blueBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OutlinedButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorConstants.buttonColor,
              ),
              child: Icon(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'M PLUS Code Latin',
                ),
              ),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
