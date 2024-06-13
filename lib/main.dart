import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:flutter_app/Components/StandardButton.dart';

import 'Pages/InfoPage.dart';
import 'Pages/QBald.dart';
import 'Pages/QBeach.dart';
import 'Pages/QGov.dart';
import 'Pages/QStar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double num = 1;

  callback(newValue){
    setState(() {
      num = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConstants.whiteBackround,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: const Text(
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
            ),
            "Home"
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstants.buttonColor,
                    fontSize: 40,
                    fontFamily: 'Lato',
                  ),
                  'Saugatuck Douglas'
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                  ),
                  'Test your knowledge! \n'
                      'Take a 10 question quiz to learn more about some of the Art Coast’s most iconic attractions. \n'
                      'Scores of 8 or higher earn a STAR. \n'
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Saugatuck Chain Ferry", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QGov();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Star of Saugatuck", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QStar();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Mount Baldhead", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QBald();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Oval Beach and Lake Michigan", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QBeach();
                }));
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const InfoPage();
                      },
                    ),
                  ),
                },
                child: const Icon(
                  Icons.info,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
