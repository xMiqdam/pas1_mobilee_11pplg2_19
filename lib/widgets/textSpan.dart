import 'package:flutter/material.dart';

class MyTextSpan extends StatelessWidget {
  final TextStyle? style;
  final TextAlign? textAlign;
  final String firstText;
  final String? secondText;
  final Color firstColor;
  final Color? secondColor;
  final double fontSize;

  MyTextSpan(
      {required this.style,
      this.textAlign,
      required this.firstText,
      required this.secondText,
      required this.firstColor,
      required this.secondColor,
      required this.fontSize,});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: TextStyle(color: firstColor, fontSize: fontSize,fontFamily: 'Montserrat'),
        children: <TextSpan>[
          TextSpan(
            text: secondText,
            style: TextStyle(color: secondColor, fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
