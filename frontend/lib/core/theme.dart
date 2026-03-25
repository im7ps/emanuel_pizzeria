import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFFFDF5E6); // Old Lace
  static const Color accent = Color(0xFFC04000); // Terracotta
  static const Color secondary = Color(0xFF556B2F); // Olive Green
  static const Color text = Color(0xFF2F2F2F); // Anthracite
  static const Color cardBg = Color(0xFFF4F1E8); // Lighter Olive/Stone

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        primary: accent,
        secondary: secondary,
        surface: background,
        onSurface: text,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 48,
          fontWeight: FontWeight.w900,
          color: accent,
          letterSpacing: -1,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: accent,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: text,
        ),
        bodyLarge: GoogleFonts.merriweather(
          fontSize: 18,
          color: text,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.merriweather(
          fontSize: 15,
          color: text.withValues(alpha: 0.8),
          height: 1.5,
        ),
      ),
      // Bottoni con angoli netti e stile "Insegna"
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: Colors.white,
          elevation: 0,
          textStyle: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Angoli netti
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: secondary,
          elevation: 0,
          side: const BorderSide(color: secondary, width: 2.5),
          textStyle: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Angoli netti
          ),
        ),
      ),
    );
  }
}
