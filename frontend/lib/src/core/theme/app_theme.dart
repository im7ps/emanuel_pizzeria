import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppMood { pizzeria, shop }

class AppTheme {
  // --- Colors Pizzeria (Warm/Active) ---
  static const Color pBackground = Color(0xFFFDF5E6);
  static const Color pAccent = Color(0xFFC04000);
  static const Color pSecondary = Color(0xFF556B2F);
  static const Color pGold = Color(0xFFC5A021);
  static const Color pText = Color(0xFF2F2F2F);

  // --- Colors Shop (Cool/Editorial) ---
  static const Color sBackground = Colors.white;
  static const Color sAccent = Colors.black;
  static const Color sSecondary = Color(0xFF8E8E8E);
  static const Color sGold = Color(0xFFD4AF37);
  static const Color sText = Color(0xFF1A1A1A);

  // --- UI Helpers for Legacy/Direct Access ---
  static Color get accent => sAccent;
  static Color get secondary => sSecondary;
  
  static TextStyle get menuCategoryTitle => GoogleFonts.bodoniModa(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: sAccent,
  );

  static TextStyle get menuTitle => GoogleFonts.bodoniModa(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: sAccent,
  );

  static TextStyle get menuIngredients => GoogleFonts.lato(
    fontSize: 16,
    color: sSecondary,
  );

  static ThemeData getPizzeriaTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: pBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: pAccent,
        primary: pAccent,
        secondary: pSecondary,
        surface: pBackground,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 64,
          fontWeight: FontWeight.w900,
          color: pAccent,
          letterSpacing: -2,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 42,
          fontWeight: FontWeight.bold,
          color: pAccent,
        ),
        bodyLarge: GoogleFonts.merriweather(
          fontSize: 18,
          color: pText,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }

  static ThemeData getShopTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: sBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: sAccent,
        primary: sAccent,
        secondary: sSecondary,
        surface: sBackground,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.bodoniModa(
          fontSize: 72,
          fontWeight: FontWeight.normal,
          color: sAccent,
          letterSpacing: -1,
        ),
        displayMedium: GoogleFonts.bodoniModa(
          fontSize: 38,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          color: sAccent,
        ),
        bodyLarge: GoogleFonts.lato(
          fontSize: 16,
          color: sText,
          letterSpacing: 0.5,
          height: 1.8,
        ),
        labelLarge: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          letterSpacing: 3,
          color: sAccent,
        ),
      ),
    );
  }
}
