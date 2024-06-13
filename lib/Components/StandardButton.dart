import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/color_constants.dart';

class StandardButton extends StatelessWidget {
  const StandardButton(this.text, this.onPressed, {super.key});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      height: 60,
      child: OutlinedButton(
        style: TextButton.styleFrom(
          backgroundColor: ColorConstants.buttonColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }
}
