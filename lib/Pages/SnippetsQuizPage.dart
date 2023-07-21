import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/NovellaPage.dart';

import '../Components/StandardButton.dart';
import '../Constants/color_constants.dart';
import 'ChatBotPage.dart';
import 'QWords.dart';
import 'QNumerals.dart';
import 'QPhrases.dart';
import 'ChatBotPage.dart';
import 'QFacts.dart';


class SnippetsQuizPage extends StatelessWidget {
  const SnippetsQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteBackround,
        appBar: AppBar(
          title: const Text(
            'Latin Snippets',
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'M PLUS Code Latin',
            ),
          ),
          backgroundColor: ColorConstants.buttonColor,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: ColorConstants.whiteBackround,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Common Words", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return QWords();
                    }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Cool Phrases", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return QPhrases();
                    }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Roman Numerals", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return QNumerals();
                    }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Fun Facts", () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return QFacts();
                        }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Latin AI Chatbot", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ChatBotPage();
                    }));
                  }),
                ),
              ),
        ]
        )
    );
  }
}
