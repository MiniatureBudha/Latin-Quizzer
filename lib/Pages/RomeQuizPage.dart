import 'package:flutter/material.dart';

import '../Components/StandardButton.dart';
import '../Constants/color_constants.dart';
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
            'Ancient Rome in Our Modern World',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Neohellenic',
            ),
          ),
          backgroundColor: Colors.deepPurple,
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
                  child: StandardButton("Latin Language", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const QLang();
                    }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Law, Medicine & Science", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const QLaw();
                    }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Literature & Art", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const QLit();
                    }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Infrastructure & Architecture", () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return const QSociety();
                        }));
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StandardButton("Government", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const QGov();
                    }));
                  }),
                ),
              ),
        ]
        )
    );
  }
}
