import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:flutter_app/Pages/HomePage.dart';

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
                  'The purpose of Latin Learner is to encourage more students to study Latin and the classics by educating them on the significant role that Latin and Roman culture have had in shaping Western civilization and the modern United States; '
                      'Latin it is very much alive and well, you just have to know where to look and how to use it!',
                ),
              )
          ),
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
