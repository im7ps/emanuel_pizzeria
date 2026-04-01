import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../src/core/theme/app_theme.dart';

class SquareTitle extends StatelessWidget {
  final List<String> lines;
  final Color? color;

  const SquareTitle({super.key, required this.lines, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: lines.map((line) {
        return FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            line,
            style: GoogleFonts.cinzel(
              height: 0.75,
              fontWeight: FontWeight.w900,
              color: color ?? AppTheme.pGold,
              letterSpacing: -1,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  offset: const Offset(2, 2),
                  blurRadius: 15,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
