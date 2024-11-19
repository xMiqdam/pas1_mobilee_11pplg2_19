import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? imagePath;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color sideColor;
  final TextStyle? style;
  final TextAlign? textAlign;
  final double? height;
  final double? width;

  const MyButton({
    Key? key,
    this.imagePath,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue, 
    this.sideColor = Colors.transparent, 
    this.style,
    this.textAlign,
    this.height = 50.0, 
    this.width = double.infinity, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3, 
          side: BorderSide(color: sideColor),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: 30,
                height: 30,
              ),
            if (imagePath != null) SizedBox(width: 16), // Hanya berikan jarak jika ada gambar
            Text(
              text,
              textAlign: textAlign ?? TextAlign.center,
              style: style ??
                  const TextStyle(
                    fontSize: 16, // Ukuran font standar
                    fontWeight: FontWeight.bold, // Teks yang lebih tebal
                    color: Colors.white, // Warna teks umum untuk button registrasi
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
