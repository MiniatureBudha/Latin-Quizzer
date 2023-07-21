import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';

import '../Components/StandardButton.dart';
import 'Intro3.dart';

class Intro2 extends StatefulWidget {
  const Intro2({super.key});

  @override
  Intro2State createState() => Intro2State();
}

class Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteBackround,
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
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Studying Latin includes studying the Roman Empire, often considered one of the greatest and most influential civilizations in world history. The Western World, including North American, Europe, and Oceania, as well as the cultural, political, and economic characteristics associated with those worlds, was born on the back of Latin and Roman culture.',
                  ),
                ),
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
                      return const Intro3(); //Make text pages later
                    }));
                  }),
                ),
              ),
            ],
        )
    );
  }
}