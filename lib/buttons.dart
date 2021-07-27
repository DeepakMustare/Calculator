import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {required this.color,
      required this.textColor,
      required this.buttonText,
      required this.buttontapped});
  final color;
  final textColor;
  final String buttonText;
  final VoidCallback buttontapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: EdgeInsets.all(0.2),
        child: ClipRect(
          child: Container(
            color: color,
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
