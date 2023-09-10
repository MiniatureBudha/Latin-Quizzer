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
                  'The purpose of Latin Learner is to encourage more students to study Latin and the classics by educating them on the significant role that Latin and Roman culture have had in shaping Western civilization and the modern United States; \n\n\n '
                      'Latin it is very much alive and well, you just have to know where to look and how to use it!'
                  'Latin Learner should be used by middle and high school students, as well as teachers and curriculum advisors. \n\n\n'
                    'Scores of 80% or higher on quizzes earn a high performance badge in the form of a Roman laurel wreath crown. \n'
                ),
              ),
          ),
          const Center(
              child: Image(image: ResizeImage(AssetImage('assets/LaurelPic.png'), width: 150, height: 120)),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
            onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
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
