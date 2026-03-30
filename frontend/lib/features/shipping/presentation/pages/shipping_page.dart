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
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../menu/presentation/providers/cart_notifier.dart';
import '../../../menu/domain/models/menu_models.dart';

class ShippingPage extends ConsumerStatefulWidget {
  const ShippingPage({super.key});

  @override
  ConsumerState<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends ConsumerState<ShippingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(shippingProvider);
    final theme = Theme.of(context);
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _buildCartDrawer(),
      body: Stack(
        children: [
          CustomScrollView(
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 48,
                    horizontal: 24,
                  ),
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
          if (cartItems.isNotEmpty)
            Positioned(bottom: 30, left: 20, child: _buildCartFAB()),
        ],
      ),
    );
  }

  Widget _buildCartFAB() {
    final count = ref.watch(cartProvider.notifier).totalItemsCount;
    final total = ref.watch(cartProvider.notifier).totalCartPrice;

    return GestureDetector(
      onTap: () => _scaffoldKey.currentState?.openEndDrawer(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.secondary,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_basket, color: Colors.white),
                Positioned(
                  right: -8,
                  top: -8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppTheme.accent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "$count",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Text(
              "€ ${total.toStringAsFixed(2)}",
              style: GoogleFonts.arvo(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartDrawer() {
    final cart = ref.watch(cartProvider);
    final total = ref.watch(cartProvider.notifier).totalCartPrice;

    return Drawer(
      width: 400,
      backgroundColor: AppTheme.background,
      child: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                const Icon(
                  Icons.shopping_basket_outlined,
                  color: AppTheme.accent,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Text(
                  "IL TUO ORDINE",
                  style: AppTheme.menuTitle.copyWith(fontSize: 24),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text(
                      "IL CARRELLO È VUOTO",
                      style: AppTheme.menuIngredients,
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(
                          item.product.name,
                          style: AppTheme.menuTitle.copyWith(fontSize: 16),
                        ),
                        subtitle: Text(
                          "${item.quantity}x - ${item.product.type == ProductType.local ? 'Locale' : 'Spedizione'}",
                          style: AppTheme.menuIngredients.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "€ ${item.totalPrice.toStringAsFixed(2)}",
                              style: AppTheme.menuPrice.copyWith(fontSize: 14),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                                size: 20,
                              ),
                              onPressed: () => ref
                                  .read(cartProvider.notifier)
                                  .removeItem(index),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTALE PARZIALE",
                      style: AppTheme.menuIngredients.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "€ ${total.toStringAsFixed(2)}",
                      style: AppTheme.menuPrice.copyWith(
                        color: AppTheme.accent,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: cart.isEmpty
                        ? null
                        : () => context.push('/checkout'),
                    child: const Text("PROCEDI AL CHECKOUT"),
                  ),
                ),
              ],
            ),
          ),
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
