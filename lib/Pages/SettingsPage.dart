import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';
import 'package:flutter_app/Components/StandardButton.dart';
import 'package:flutter_app/Pages/HomePage.dart';
import 'dart:async';

class SettingsPage extends StatefulWidget {
  double volumeLevel;
  Function callback;

  SettingsPage({required this.volumeLevel, required this.callback});

  @override
  SettingsPageState createState() => SettingsPageState();
}


class SettingsPageState extends State<SettingsPage> {
  static double musicVolume = 1;

  SettingsPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteBackround,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'M PLUS Code Latin',
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 35,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.buttonColor,
                    border: Border.all(
                        color: Colors.deepPurple
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  child: Center(
                    child: Text(
                      'Volume:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'M PLUS Code Latin',
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                  child: Slider(value: musicVolume,min:0,max:1,divisions: 100,onChanged:(newMusicVolume){
                    musicVolume = newMusicVolume;
                    setState(() {});
                    widget.callback(musicVolume);
                  })
              ),
            ]
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Container(
          padding: EdgeInsets.only(bottom: 15),
          child: OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  ),
                },
              ),
        ),
      ),
    );
  }
}
