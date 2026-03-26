import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme.dart';

class SoulCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;
  final bool isMobile;

  const SoulCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: isMobile ? 320 : 360,
          height: isMobile ? 480 : 540,
          decoration: BoxDecoration(
            color: AppTheme.background,
            border: Border.all(
                color: AppTheme.secondary.withValues(alpha: 0.3), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: isMobile ? 180 : 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                  child: Column(
                    children: [
                      Text(
                        title.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontSize: 22,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                          color: AppTheme.accent,
                          thickness: 1.5,
                          indent: 40,
                          endIndent: 40),
                      const SizedBox(height: 15),
                      Expanded(
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 16,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.text,
                                  overflow: TextOverflow.fade),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "SCOPRI DI PIÙ →",
                        style: GoogleFonts.playfairDisplay(
                          color: AppTheme.accent,
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          letterSpacing: 1.5,
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
