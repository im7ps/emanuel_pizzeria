import 'package:flutter/material.dart';
import '../theme.dart';

class HoverButton extends StatelessWidget {
  final String label;
  final Color baseColor;
  final VoidCallback onPressed;

  const HoverButton({
    super.key,
    required this.label,
    required this.baseColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.hovered)) return AppTheme.background;
          return baseColor;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.hovered)) return baseColor;
          return Colors.white;
        }),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 44, vertical: 24),
        ),
        elevation: WidgetStateProperty.all(0),
        side: WidgetStateProperty.resolveWith<BorderSide>((states) {
          return BorderSide(color: baseColor, width: 1.5);
        }),
        shape: WidgetStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        )),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
