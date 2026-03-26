import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme.dart';
import '../../../../core/widgets/hover_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    double heroHeight = isMobile ? 700 : (isTablet ? 850 : 950);

    return Stack(
      children: [
        // Background Image
        Container(
          height: heroHeight,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/homepage/pizza_homepage.jpg"),
              fit: BoxFit.cover,
              opacity: 0.7,
            ),
            color: Colors.black,
          ),
        ),
        // Content
        Positioned.fill(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isMobile
                            ? 260
                            : 550, // Ridotto da 320 a 260 per mobile
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Titolo Tipografico a "Quadrato"
                          const _SquareTitle(
                            lines: ["GUSTO", "AUTENTICO", "DEL SUD"],
                          ),
                          const SizedBox(height: 24),
                          // Linea sottile di accento
                          Container(
                            height: 2,
                            width: 60,
                            color: AppTheme.gold.withValues(alpha: 0.8),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "LA TRADIZIONE PROFUMA DI CASA",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cinzel(
                              color: Colors.white,
                              fontSize: isMobile ? 16 : 22,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2, // Ridotto per maggiore densità
                              shadows: [
                                Shadow(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  offset: const Offset(0, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: isMobile ? double.infinity : 1000),
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          _ResponsiveHeroButton(
                            label: "IL NOSTRO MENÙ",
                            baseColor: AppTheme.gold,
                            isMobile: isMobile,
                            onPressed: () => context.push('/menu'),
                          ),
                          _ResponsiveHeroButton(
                            label: "PRENOTA UN TAVOLO",
                            baseColor: AppTheme.accent,
                            isMobile: isMobile,
                            onPressed: () => context.push('/bookings'),
                          ),
                          _ResponsiveHeroButton(
                            label: "ORDINA A CASA",
                            baseColor: AppTheme.secondary,
                            isMobile: isMobile,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SquareTitle extends StatelessWidget {
  final List<String> lines;

  const _SquareTitle({
    required this.lines,
  });

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
              height: 0.75, // Molto più compatto verticalmente
              fontWeight: FontWeight.w900,
              color: AppTheme.gold,
              letterSpacing: -1, // Lettere molto vicine per effetto blocco
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

class _ResponsiveHeroButton extends StatelessWidget {
  final String label;
  final Color baseColor;
  final bool isMobile;
  final VoidCallback onPressed;

  const _ResponsiveHeroButton({
    required this.label,
    required this.baseColor,
    required this.isMobile,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isMobile ? double.infinity : 240,
      child: HoverButton(
        label: label,
        baseColor: baseColor,
        onPressed: onPressed,
      ),
    );
  }
}
