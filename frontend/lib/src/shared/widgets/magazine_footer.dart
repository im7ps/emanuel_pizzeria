import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/theme_notifier.dart';

class MagazineFooter extends ConsumerWidget {
  const MagazineFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mood = ref.watch(themeMoodProvider);
    final isPizzeria = mood == AppMood.pizzeria;

    return Container(
      padding: const EdgeInsets.all(60),
      color: isPizzeria ? AppTheme.pBackground : AppTheme.sBackground,
      child: Column(
        children: [
          Container(height: 1, width: 40, color: isPizzeria ? AppTheme.pAccent : AppTheme.sAccent),
          const SizedBox(height: 40),
          Text(
            "EMANUEL",
            style: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.w900,
              fontSize: 32,
              letterSpacing: 10,
              color: isPizzeria ? AppTheme.pAccent : AppTheme.sAccent,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "PIZZERIA & DISPENSA CAMPANA",
            style: GoogleFonts.lato(
              fontSize: 10,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerLink("INSTAGRAM", isPizzeria),
              const SizedBox(width: 30),
              _footerLink("FACEBOOK", isPizzeria),
              const SizedBox(width: 30),
              _footerLink("TWITTER", isPizzeria),
            ],
          ),
          const SizedBox(height: 60),
          Text(
            "© 2026 EMANUEL PIZZERIA. ALL RIGHTS RESERVED.",
            style: GoogleFonts.lato(fontSize: 8, color: Colors.grey, letterSpacing: 1),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String label, bool isPizzeria) {
    return Text(
      label,
      style: GoogleFonts.lato(
        fontSize: 10,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
        color: isPizzeria ? AppTheme.pAccent : AppTheme.sAccent,
      ),
    );
  }
}
