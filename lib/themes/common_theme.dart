import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final commonTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

TextTheme commonTextTheme(Color color) {
  return TextTheme(
    displayLarge: GoogleFonts.dmSerifDisplay(color: color),
    displayMedium: GoogleFonts.dmSerifDisplay(color: color),
    displaySmall: GoogleFonts.dmSerifDisplay(color: color),
    headlineLarge: GoogleFonts.tinos(color: color),
    headlineMedium: GoogleFonts.tinos(color: color),
    headlineSmall: GoogleFonts.tinos(color: color),
    titleLarge: GoogleFonts.tinos(color: color),
    titleMedium: GoogleFonts.tinos(color: color),
    titleSmall: GoogleFonts.tinos(color: color),
    labelLarge: GoogleFonts.tinos(color: color),
    labelMedium: GoogleFonts.tinos(color: color),
    labelSmall: GoogleFonts.tinos(color: color),
    bodyLarge: GoogleFonts.pangolin(color: color),
    bodyMedium: GoogleFonts.pangolin(color: color),
    bodySmall: GoogleFonts.pangolin(color: color),
  );
}
