import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Home.dart';
import 'package:flutter_app/Constants/color_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
