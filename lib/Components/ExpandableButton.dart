import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';

class ExpandableButton extends StatelessWidget {
  ExpandableButton(this.text, this.onPressed, [this.color]);
  final String text;
  VoidCallback onPressed;
  Color? color;

  void changeFunction(VoidCallback newFunction) {
    onPressed = newFunction;
  }

  @override
  Widget build(BuildContext context) {
    color ??= ColorConstants.deepPurple;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: OutlinedButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Neohellenic',
            ),
          ),
        ),
      ),
    );
  }
}
