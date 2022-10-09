import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTextStyle extends StatelessWidget {
  var text;
  var color;
  var fontSize;

  FontTextStyle({this.color, this.fontSize, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.robotoMono(
            textStyle: TextStyle(color: color, fontSize: fontSize)));
  }
}

class LanguageIcons extends StatelessWidget {
  
  var image;

  LanguageIcons({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset(image));
  }
}
