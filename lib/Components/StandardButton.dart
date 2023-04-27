import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';

class StandardButton extends StatelessWidget {
  StandardButton(this.text, this.onPressed);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: OutlinedButton(
        style: TextButton.styleFrom(
          backgroundColor: ColorConstants.buttonColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'M PLUS Code Latin',
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
