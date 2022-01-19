import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.indigo;
  static const String headText = "Ortalama Hesapla";
  static final TextStyle headStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);

  static BorderRadius borderRadius = BorderRadius.circular(24);
  static BorderRadius borderSmallRadius = BorderRadius.circular(16);
  static final TextStyle showAverageBodyStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: mainColor);

  static const dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const horizantalPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
