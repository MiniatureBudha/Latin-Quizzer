import 'package:flutter/material.dart';

import '../Constants/color_constants.dart';

//This one will be on questions for the novellas (small books) if we decide to add them
class NovellaPage2 extends StatelessWidget {
  const NovellaPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NovQ(),
    );
  }
}

class NovQ extends StatefulWidget {
  const NovQ({super.key});

  @override
  State<NovQ> createState() => _NovQState();
}

class _NovQState extends State<NovQ> {
  int pageN = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueBackground,
      body: Column(
        children:[
            Image.asset('images/PolyP$pageN')
        ],
      ),
    );
  }
}
