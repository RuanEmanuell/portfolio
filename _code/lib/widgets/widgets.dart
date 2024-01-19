import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTextStyle extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const FontTextStyle({super.key, required this.color, required this.fontSize, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.robotoMono(
            textStyle: TextStyle(color: color, fontSize: fontSize)));
  }
}

class LanguageIcons extends StatelessWidget {
  
  final String image;
  final String message;

  const LanguageIcons({super.key, required this.image, required this.message});

  @override
  Widget build(BuildContext context) {
    return  Expanded(child: Tooltip(
      message: message, child: Image.asset(image)));
  }
}
