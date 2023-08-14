import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:flutter_app/Components/StandardButton.dart';
import 'package:flutter_app/Pages/SnippetsQuizPage.dart';
import 'package:flutter_app/Pages/RomeQuizPage.dart';
import 'package:flutter_app/Pages/LatinQuiz.dart';
import 'Pages/Intro1.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_app/Pages/SettingsPage.dart';

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

  final player = AudioPlayer();

  void setVolume(double newVolume){
    //player.stop();
    player.setVolume(newVolume);
    //player.play(AssetSource("CoverMusic.wav"));
  }


  callback(newValue){
    setState(() {
      num = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {

    SettingsPage(callback: this.callback, volumeLevel: SettingsPageState.musicVolume);

    player.play(AssetSource("CoverMusic.wav"));
    player.setVolume(num);

    return Scaffold(
      backgroundColor: ColorConstants.whiteBackround,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
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
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: const Image(
                  image: ResizeImage(AssetImage('assets/Logo2.png'),
                      width: 200, height: 200)),
            ),
          ), //says Latin Learner
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Introduction to Latin", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Intro1();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Ancient Rome in Our Modern World", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const RomeQuizPage();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Latin Snippets", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SnippetsQuizPage();
                }));
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StandardButton("Why Study Latin", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LatinQuiz();
                }));
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SettingsPage(callback: this.callback, volumeLevel: SettingsPageState.musicVolume);
                      },
                    ),
                  ),
                },
              ),
              OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: Icon(
                  Icons.stacked_bar_chart_sharp,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
              OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: Icon(
                  Icons.info,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
