import 'package:flutter/material.dart';

class MyTextt extends StatelessWidget {
  final String text; // Properti untuk menyimpan teks
  final TextStyle style; // Properti untuk menyimpan gaya teks
 final TextAlign? textAlign; 
  MyTextt({required this.text, required this.style, this.textAlign}); // Konstruktor

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: style, 
      textAlign: textAlign,
    );
  }
}
