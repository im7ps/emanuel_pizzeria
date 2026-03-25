import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme.dart';
import 'app_buttons.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    // Determiniamo se dobbiamo usare la colonna (mobile e tablet) o la riga (desktop)
    final bool useColumn = isMobile || isTablet;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 80,
        horizontal: isMobile ? 24 : 40,
      ),
      color: AppTheme.background,
      width: double.infinity,
      child: Column(
        children: [
          ResponsiveRowColumn(
            layout: useColumn
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnSpacing: 50,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo e Social
              ResponsiveRowColumnItem(
                rowFlex: 3,
                child: _FooterSection(
                  isDesktop: isDesktop && !isTablet,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: isDesktop && !isTablet ? Alignment.centerLeft : Alignment.center,
                      child: Text(
                        "EMANUEL PIZZERIA",
                        style: GoogleFonts.playfairDisplay(
                          color: AppTheme.gold,
                          fontSize: isMobile ? 20 : 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Passione del Sud, direttamente\nnel tuo piatto.",
                      textAlign: !useColumn ? TextAlign.start : TextAlign.center,
                      style: GoogleFonts.merriweather(
                        color: AppTheme.text.withValues(alpha: 0.6),
                        fontSize: isMobile ? 12 : 13,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SquareIconButton(
                          icon: Icons.facebook,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 12),
                        SquareIconButton(
                          icon: Icons.camera_alt,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 12),
                        SquareIconButton(
                          icon: Icons.alternate_email,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Orari
              ResponsiveRowColumnItem(
                rowFlex: 2,
                child: _FooterSection(
                  title: "ORARI D'APERTURA",
                  isDesktop: isDesktop && !isTablet,
                  fontSize: isMobile ? 16 : 18,
                  children: [
                    _FooterHourRow(
                        day: "Lun - Gio", hours: "19:00 - 23:30", isMobile: isMobile),
                    _FooterHourRow(
                        day: "Ven - Sab", hours: "19:00 - 00:30", isMobile: isMobile),
                    _FooterHourRow(day: "Domenica", hours: "19:00 - 23:30", isMobile: isMobile),
                  ],
                ),
              ),

              // Contatti
              ResponsiveRowColumnItem(
                rowFlex: 2,
                child: _FooterSection(
                  title: "CONTATTI",
                  isDesktop: isDesktop && !isTablet,
                  fontSize: isMobile ? 16 : 18,
                  children: [
                    _FooterContactRow(
                      icon: Icons.phone,
                      label: "+39 0965 123456",
                      isMobile: isMobile,
                    ),
                    _FooterContactRow(
                      icon: Icons.email,
                      label: "info@emanuelpizzeria.it",
                      isMobile: isMobile,
                    ),
                    _FooterContactRow(
                      icon: Icons.location_on,
                      label: "Via Roma, 123 - RC",
                      isMobile: isMobile,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Divider(color: AppTheme.text.withValues(alpha: 0.1), thickness: 1),
          const SizedBox(height: 20),
          Text(
            "© 2024 Emanuel Pizzeria. Tutti i diritti riservati.",
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              color: AppTheme.text.withValues(alpha: 0.4),
              fontSize: isMobile ? 10 : 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final bool isDesktop;
  final double fontSize;

  const _FooterSection({
    this.title,
    required this.children,
    required this.isDesktop,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        if (title != null) ...[
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title!,
              style: GoogleFonts.playfairDisplay(
                color: AppTheme.accent,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
        ...children,
      ],
    );
  }
}


class _FooterHourRow extends StatelessWidget {
  final String day;
  final String hours;
  final bool isMobile;

  const _FooterHourRow({required this.day, required this.hours, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            "$day: ",
            style: GoogleFonts.merriweather(
              color: AppTheme.text.withValues(alpha: 0.8),
              fontSize: isMobile ? 12 : 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            hours,
            style: GoogleFonts.merriweather(
              color: AppTheme.text.withValues(alpha: 0.6),
              fontSize: isMobile ? 12 : 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isMobile;

  const _FooterContactRow({required this.icon, required this.label, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppTheme.gold, size: isMobile ? 16 : 18),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              style: GoogleFonts.merriweather(
                color: AppTheme.text.withValues(alpha: 0.6),
                fontSize: isMobile ? 12 : 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

