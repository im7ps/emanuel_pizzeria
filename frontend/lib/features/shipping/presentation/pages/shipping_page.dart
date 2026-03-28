import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:emanuel_pizzeria/core/theme.dart';
import 'package:emanuel_pizzeria/core/widgets/navbar.dart';
import 'package:emanuel_pizzeria/core/widgets/footer.dart';
import 'package:emanuel_pizzeria/features/shipping/presentation/providers/shipping_notifier.dart';
import 'package:emanuel_pizzeria/features/shipping/presentation/widgets/product_card.dart';
import 'package:emanuel_pizzeria/features/shipping/presentation/widgets/trust_section.dart';
import 'package:emanuel_pizzeria/features/shipping/presentation/widgets/faq_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ShippingPage extends ConsumerWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(shippingProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Navbar
          const SliverToBoxAdapter(child: Navbar()),

          // Hero Narrative
          SliverToBoxAdapter(child: _HeroSection(theme: theme)),

          // Trust Section
          const SliverToBoxAdapter(child: TrustSection()),

          // Products Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'I Nostri Prodotti',
                    style: AppTheme.menuCategoryTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Container(width: 60, height: 3, color: AppTheme.accent),
                ],
              ),
            ),
          ),

          // Product Grid
          productsAsync.when(
            data: (products) => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ResponsiveValue<int>(
                    context,
                    conditionalValues: [
                      const Condition.equals(name: MOBILE, value: 1),
                      const Condition.equals(name: TABLET, value: 2),
                      const Condition.largerThan(name: TABLET, value: 4),
                    ],
                  ).value,
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 32,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ProductCard(product: products[index]),
                  childCount: products.length,
                ),
              ),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (err, stack) => SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Errore nel caricamento: $err'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          ref.read(shippingProvider.notifier).refresh(),
                      child: const Text('Riprova'),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // FAQ Section
          const SliverToBoxAdapter(child: FAQSection()),

          // Footer
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final ThemeData theme;

  const _HeroSection({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/shippings/shippings_header.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.2),
              Colors.black.withValues(alpha: 0.7),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'La Nostra Dispensa a Casa Tua',
              style: theme.textTheme.displayLarge?.copyWith(
                color: Colors.white,
                shadows: [
                  const Shadow(
                    offset: Offset(0, 2),
                    blurRadius: 10,
                    color: Colors.black45,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Selezioniamo le migliori materie prime campane per portarti il sapore autentico di Emanuel ovunque tu sia.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
