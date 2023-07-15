import 'package:flutter/material.dart';

class Intro1 extends StatefulWidget {
  const Intro1({super.key});

  @override
  Intro1State createState() => Intro1State();
}

class Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Blah Blah Blah',
                  ),
                ),
              )
            ],
        )
    );
  }
}