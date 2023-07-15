import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/NovellaPage.dart';

import '../Components/StandardButton.dart';
import '../Constants/color_constants.dart';
import 'ChatBotPage.dart';
import 'MinigamePage.dart';
import 'QuizzerPage.dart';
import 'NovellaPage2.dart';
import 'QSociety.dart';
import 'QGov.dart';
import 'QLang.dart';
import 'QLit.dart';
import 'QLaw.dart';


class RomeQuizPage extends StatelessWidget {
  const RomeQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteBackround,
        appBar: AppBar(
          title: const Text(
            'Ancient Rome in our Modern World',
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'M PLUS Code Latin',
            ),
          ),
          backgroundColor: ColorConstants.whiteBackround,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Language", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return QLang();
                    }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Law, Medicine & Science", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return QLaw();
                    }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Literature, Art & Architecture", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return QLit();
                    }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Infrastructure & Society", () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return QSociety();
                        }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Government", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return QGov();
                    }));
                  }),
                ),
              ),
        ]
        )
    );
  }
}
