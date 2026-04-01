import 'package:flutter/material.dart';

class SquareIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const SquareIconButton({super.key, required this.icon, this.onPressed});

  @override
  State<SquareIconButton> createState() => _SquareIconButtonState();
}

class _SquareIconButtonState extends State<SquareIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Determiniamo il colore basandoci sul tema corrente (Material3)
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: _isHovered
                ? primaryColor.withValues(alpha: 0.7)
                : primaryColor,
          ),
          child: Icon(widget.icon, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}
