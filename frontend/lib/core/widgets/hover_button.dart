import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HoverButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isOutline;

  const HoverButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isOutline = false,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final backgroundColor = theme.scaffoldBackgroundColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: widget.isOutline
                ? (_isHovered ? primaryColor : Colors.transparent)
                : (_isHovered
                      ? primaryColor.withValues(alpha: 0.8)
                      : primaryColor),
            border: Border.all(color: primaryColor, width: 2),
          ),
          child: Text(
            widget.label.toUpperCase(),
            style: GoogleFonts.montserrat(
              color: widget.isOutline
                  ? (_isHovered ? backgroundColor : primaryColor)
                  : backgroundColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
