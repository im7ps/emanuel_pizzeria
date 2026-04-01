import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../src/core/theme/app_theme.dart';
// import '../../../../core/widgets/hover_button.dart';

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
              opacity: 0.8, // Maggiore visibilità
            ),
            color: Colors.black,
          ),
        ),
        // Content
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: isMobile ? 180 : 260),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? 350 : 1000,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "GUSTO AUTENTICO DEL SUD",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cinzel(
                            fontSize: isMobile ? 28 : 58,
                            fontWeight: FontWeight.w900,
                            color: AppTheme.pGold,
                            height: 1.0,
                            letterSpacing: isMobile ? 2 : 4,
                            shadows: [
                              Shadow(
                                color: Colors.black.withValues(alpha: 0.6),
                                offset: const Offset(2, 2),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16), // Distanza ridotta
                        Text(
                          "LA TRADIZIONE PROFUMA DI CASA",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cinzel(
                            color: Colors.white,
                            fontSize: isMobile ? 14 : 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                color: Colors.black.withValues(alpha: 0.6),
                                offset: const Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class _ResponsiveHeroButton extends StatelessWidget {
//   final String label;
//   final Color baseColor;
//   final bool isMobile;
//   final VoidCallback onPressed;

//   const _ResponsiveHeroButton({
//     required this.label,
//     required this.baseColor,
//     required this.isMobile,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: isMobile ? double.infinity : 280,
//       child: HoverButton(
//         label: label,
//         baseColor: baseColor,
//         onPressed: onPressed,
//       ),
//     );
//   }
// }
