import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.7),
            Colors.black.withValues(alpha: 0.3),
            Colors.transparent,
          ],
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: isMobile ? 80 : 100,
        centerTitle: false,
        title: Text(
          "EMANUEL",
          style: GoogleFonts.playfairDisplay(
            color: AppTheme.gold, // Colore dorato come richiesto
            fontWeight: FontWeight.w900,
            fontSize: isMobile ? 24 : 28,
            letterSpacing: 2,
          ),
        ),
        actions: isMobile
            ? [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
              ]
            : [
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _NavButton(label: "IL MENÙ", onTap: () {}),
                        _NavButton(label: "SPEDIZIONI", onTap: () {}),
                        _NavButton(label: "LAVORA CON NOI", onTap: () {}),
                        _NavButton(label: "CONTATTI", onTap: () {}),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      child: Text(
        label,
        style: GoogleFonts.playfairDisplay(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          fontSize: 13,
        ),
      ),
    );
  }
}
