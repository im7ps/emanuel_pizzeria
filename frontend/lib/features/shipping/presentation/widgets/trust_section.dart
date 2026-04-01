import 'package:flutter/material.dart';
import 'package:emanuel_pizzeria/src/core/theme/app_theme.dart';

class TrustSection extends StatelessWidget {
  const TrustSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: const BoxDecoration(color: Colors.white),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 48,
        runSpacing: 32,
        children: const [
          _TrustItem(
            icon: Icons.local_shipping_outlined,
            title: 'Consegna Rapida',
            description: 'In tutta Italia in 24/48h con corriere espresso.',
          ),
          _TrustItem(
            icon: Icons.inventory_2_outlined,
            title: 'Packaging Sicuro',
            description: 'Imballaggi certificati per preservare la freschezza.',
          ),
          _TrustItem(
            icon: Icons.verified_user_outlined,
            title: 'Qualità Garantita',
            description: 'Solo prodotti artigianali selezionati da noi.',
          ),
        ],
      ),
    );
  }
}

class _TrustItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _TrustItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Column(
        children: [
          Icon(icon, size: 48, color: AppTheme.secondary),
          const SizedBox(height: 16),
          Text(title, style: AppTheme.menuTitle, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTheme.menuIngredients,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
