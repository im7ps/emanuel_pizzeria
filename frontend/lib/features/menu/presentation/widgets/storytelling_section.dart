import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme.dart';

class StorytellingSection extends StatelessWidget {
  const StorytellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 1100;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 140, horizontal: 24),
      color: AppTheme.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
                  children: [
                    _buildStoryImage(),
                    const SizedBox(height: 60),
                    _buildStoryText(context, textAlign: TextAlign.center),
                  ],
                )
              : IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: _buildStoryImage()),
                      const SizedBox(width: 80),
                      Expanded(
                          flex: 1,
                          child: _buildStoryText(context,
                              textAlign: TextAlign.start)),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildStoryImage() {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/homepage/san_marzano_homepage.jpg"),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.text.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 20),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryText(BuildContext context, {required TextAlign textAlign}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "LA NOSTRA STORIA",
          style: GoogleFonts.playfairDisplay(
            color: AppTheme.accent,
            letterSpacing: 4,
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          "\"Lievito madre, 48 ore di attesa e solo pomodoro San Marzano DOP. Non è solo cibo, è il nostro modo di dirti benvenuto al Sud.\"",
          textAlign: textAlign,
          style: GoogleFonts.playfairDisplay(
            fontSize: 34,
            fontStyle: FontStyle.italic,
            color: AppTheme.text,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 40),
        const Icon(Icons.star, color: AppTheme.secondary, size: 30),
      ],
    );
  }
}
