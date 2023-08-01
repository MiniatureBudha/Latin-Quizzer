import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';

import '../Components/StandardButton.dart';
import 'Intro2.dart';

class Intro1 extends StatefulWidget {
  const Intro1({super.key});

  @override
  Intro1State createState() => Intro1State();
}

class Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteBackround,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Introduction to Latin',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Neohellenic',
            ),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  width: 50,
                  height: 50,
                  color: ColorConstants.whiteBackround
                ),
              ),
              const Center(
                  child: Padding(padding: EdgeInsets.all(15.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Neohellenic',
                      ),
                      'Why study Latin? Isn’t it a dead language? \n \n While the language of Latin is no longer spoken by anyone as their native language, it is still very much alive and embedded in the world around us. '
                          '\n \nThe language of Latin never died; it just evolved. It evolved in language and in culture.',
                    ),
                  )
              ),
              Center(
                child: Container(
                    width: 50,
                    height: 50,
                    color: ColorConstants.whiteBackround
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StandardButton("Next", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Intro2(); //Make text pages later
                    }));
                  }),
                ),
              ),
            ],
        )
    );
  }
}