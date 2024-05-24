import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle headerTextStyle({required double fontSize}){
    return GoogleFonts.signikaNegative(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: Colors.white
    );
  }

  static TextStyle montserratStyle({required Color color, required double fontSize}){
    return GoogleFonts.montserrat(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: fontSize,
);
  }

  static TextStyle headingStyles({double fontsize = 30.0, Color color = Colors.white}){
    return GoogleFonts.rubikMoonrocks(
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 2.0
    );
  }

  static TextStyle normalStyle(){
    return GoogleFonts.signikaNegative(
      fontWeight: FontWeight.w500,
      fontSize: 17.0,
      color: Colors.white,
      letterSpacing: 1.0
    );
  }


  static TextStyle comfortaaStyle() {
    return GoogleFonts.comfortaa(
        fontSize: 18.0, fontWeight: FontWeight.w800, color: Colors.grey);
  }

}
