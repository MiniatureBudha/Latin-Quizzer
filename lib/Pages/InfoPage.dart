import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  static double musicVolume = 1;

  InfoPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteBackround,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Information',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Neohellenic',
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
                width: 50, height: 50, color: ColorConstants.whiteBackround),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Neohellenic',
                  ),
                  'The purpose of Latin Learner is to encourage more students to study Latin and the classics by educating them on the significant role that Latin and Roman culture have had in shaping Western Civilization and the modern United States. '
                  'It provides middle and high school students, as well as teachers, curriculum advisors, and Latin and classics teachers, a tool to aid in foreign language and elective class selection and introduction. \n\n'
                  'Scores of 80% or higher on quizzes earn a high performance badge in the form of a Roman laurel wreath crown. \n'),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 15),
              child: Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Neohellenic',
                  ),
                  'Latin Learner was written in Dart using Flutter. Viewing the web app in a Chrome browser is recommended, specifically for audio. '
                  'Please email LatinLearnerApp@gmail.com with any inquiries.'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: OutlinedButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName('/')),
            child: const Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
