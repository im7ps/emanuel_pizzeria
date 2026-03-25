import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme.dart';
import '../../../../core/widgets/app_buttons.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  // Funzione per aprire Google Maps con una posizione precisa
  Future<void> _openMaps() async {
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=38.071914,15.658033");
    
    try {
      final bool launched = await launchUrl(
        googleMapsUrl,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        debugPrint("Impossibile aprire la mappa: $googleMapsUrl");
      }
    } catch (e) {
      debugPrint("Errore durante l'apertura della mappa: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 100, horizontal: 24),
      color: AppTheme.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                "DOVE TROVARCI",
                style: GoogleFonts.playfairDisplay(
                  color: AppTheme.accent,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              // Box interattivo per la mappa
              InkWell(
                onTap: _openMaps,
                child: Container(
                  height: isMobile ? 300 : 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.gold.withValues(alpha: 0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Sfondo stilizzato che simula una mappa (senza asset esterni)
                      Positioned.fill(
                        child: Container(
                          color: const Color(0xFFE5E3DF), // Colore tipico Google Maps
                          child: CustomPaint(
                            painter: _MapGridPainter(),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on, color: AppTheme.accent, size: 60),
                            const SizedBox(height: 20),
                            Text(
                              "Via Roma, 123",
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.text,
                              ),
                            ),
                            Text(
                              "Reggio Calabria (RC)",
                              style: GoogleFonts.merriweather(
                                fontSize: 16,
                                color: AppTheme.text.withValues(alpha: 0.6),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SquareIconButton(
                                  icon: Icons.directions,
                                  onPressed: _openMaps,
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  "OTTIENI INDICAZIONI",
                                  style: GoogleFonts.playfairDisplay(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    color: AppTheme.accent,
                                  ),
                                ),
                              ],
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
    );
  }
}

// Painter per disegnare una griglia di strade stilizzata
class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 20;

    // Disegna alcune "strade" casuali per dare l'idea della mappa
    canvas.drawLine(Offset(0, size.height * 0.3), Offset(size.width, size.height * 0.4), paint);
    canvas.drawLine(Offset(size.width * 0.3, 0), Offset(size.width * 0.4, size.height), paint);
    canvas.drawLine(Offset(0, size.height * 0.7), Offset(size.width, size.height * 0.6), paint);
    canvas.drawLine(Offset(size.width * 0.7, 0), Offset(size.width * 0.8, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
