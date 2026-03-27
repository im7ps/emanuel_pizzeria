import 'package:flutter/material.dart';
import 'package:emanuel_pizzeria/core/theme.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      child: Column(
        children: [
          Text(
            'Domande Frequenti',
            style: AppTheme.menuCategoryTitle,
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: const [
                _FAQTile(
                  question: 'Quanto costa la spedizione?',
                  answer: 'La spedizione è gratuita per ordini superiori a 50€. Per ordini inferiori, il costo è di 6.90€ in tutta Italia.',
                ),
                _FAQTile(
                  question: 'Come vengono spediti i prodotti freschi?',
                  answer: 'Utilizziamo contenitori isotermici e ghiaccio sintetico per garantire che la catena del freddo non venga mai interrotta fino a casa tua.',
                ),
                _FAQTile(
                  question: 'Posso tracciare il mio ordine?',
                  answer: 'Certamente. Riceverai un\'email con il codice di tracciamento non appena il corriere prenderà in carico il pacco.',
                ),
                _FAQTile(
                  question: 'Quali sono i tempi di consegna?',
                  answer: 'Gli ordini vengono elaborati in 24h e consegnati mediamente in 24/48h lavorative (isole escluse).',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FAQTile extends StatelessWidget {
  final String question;
  final String answer;

  const _FAQTile({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.gold.withValues(alpha: 0.3))),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: AppTheme.menuTitle.copyWith(fontSize: 18),
        ),
        iconColor: AppTheme.gold,
        collapsedIconColor: AppTheme.secondary,
        tilePadding: const EdgeInsets.symmetric(vertical: 8),
        childrenPadding: const EdgeInsets.only(bottom: 16),
        children: [
          Text(
            answer,
            style: AppTheme.menuIngredients.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
