import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:emanuel_pizzeria/src/core/theme/app_theme.dart';
// import 'package:emanuel_pizzeria/src/core/theme/theme_notifier.dart';
import 'package:emanuel_pizzeria/features/shipping/presentation/providers/shipping_notifier.dart';
import 'package:emanuel_pizzeria/features/shipping/domain/models/shipping_product.dart';
import 'package:emanuel_pizzeria/src/shared/widgets/magazine_footer.dart';
import 'package:emanuel_pizzeria/src/shared/widgets/fade_in_animation.dart';

class ShippingPage extends ConsumerWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(shippingProvider);
    // final mood = ref.watch(themeMoodProvider);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final shopTheme = AppTheme.getShopTheme();

    return Scaffold(
      backgroundColor: AppTheme.sBackground,
      body: CustomScrollView(
        slivers: [
          // 1. Editorial Hero Section
          _buildEditorialHero(context),

          // 2. Asymmetric Manifesto Section
          _buildManifestoSection(shopTheme, isMobile),

          // 3. Global Shipping Banner (Gold Accent)
          _buildGlobalShippingBanner(shopTheme),

          // 4. Curated Collections Header
          _buildSectionHeader(
            shopTheme,
            "CURATED COLLECTIONS",
            "Le Nostre Selezioni",
          ),

          // 5. Products Grid (The "Still Life" Boutique)
          productsAsync.when(
            data: (products) => SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 60,
                vertical: 40,
              ),
              sliver: _buildBoutiqueGrid(products, shopTheme, isMobile),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(color: AppTheme.sGold),
              ),
            ),
            error: (err, stack) => SliverFillRemaining(
              child: Center(child: Text("ERROR LOADING COLLECTIONS: $err")),
            ),
          ),

          // 6. Journal / Storytelling Section
          _buildJournalSection(shopTheme, isMobile),

          // 7. Footer
          const SliverToBoxAdapter(child: MagazineFooter()),
        ],
      ),
    );
  }

  Widget _buildEditorialHero(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.85,
      backgroundColor: AppTheme.sBackground,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/shippings/shippings_header.png',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.6),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 40,
              right: 40,
              child: FadeInAnimation(
                delay: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "L'ECCELLENZA CAMPANA",
                      style: GoogleFonts.lato(
                        color: AppTheme.sGold,
                        letterSpacing: 8,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Dalla Nostra Terra\nAl Vostro Tavolo.",
                      style: AppTheme.getShopTheme().textTheme.displayLarge
                          ?.copyWith(color: Colors.white, height: 1.1),
                    ),
                    const SizedBox(height: 40),
                    _buildGoldCTA("ESPLORA LA DISPENSA"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManifestoSection(ThemeData theme, bool isMobile) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 120,
          horizontal: isMobile ? 30 : 100,
        ),
        child: FadeInAnimation(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile)
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Text(
                      "01 / MANIFESTO",
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.sGold,
                      ),
                    ),
                  ),
                ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "L'Arte della Lentezza",
                      style: theme.textTheme.displayMedium,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Ogni prodotto nella nostra dispensa è selezionato secondo i criteri dell'artigianalità estrema. Non spediamo cibo, spediamo la memoria di un territorio, racchiusa in barattoli di vetro e confezioni di carta non patinata. Un'esperienza sensoriale che attraversa i confini.",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        height: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlobalShippingBanner(ThemeData theme) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 60),
        decoration: const BoxDecoration(color: Color(0xFF121212)),
        child: FadeInAnimation(
          child: Column(
            children: [
              Text(
                "INTERNATIONAL SHIPPING",
                style: GoogleFonts.lato(
                  color: AppTheme.sGold,
                  letterSpacing: 10,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "DA NAPOLI AL MONDO IN 48 ORE",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(height: 1, width: 60, color: AppTheme.sGold),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String subtitle, String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(60, 100, 60, 40),
        child: Column(
          children: [
            Text(
              subtitle,
              style: GoogleFonts.lato(
                fontSize: 12,
                letterSpacing: 6,
                fontWeight: FontWeight.w900,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 16),
            Text(title, style: theme.textTheme.displayMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildBoutiqueGrid(
    List<ShippingProduct> products,
    ThemeData theme,
    bool isMobile,
  ) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        mainAxisSpacing: 100,
        crossAxisSpacing: 80,
        childAspectRatio: 0.75,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final p = products[index];
        return FadeInAnimation(
          delay: Duration(milliseconds: index * 150),
          child: _buildEditorialProductCard(p, theme),
        );
      }, childCount: products.length),
    );
  }

  Widget _buildEditorialProductCard(ShippingProduct p, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFFF9F9F9)),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Hero(
                      tag: 'product_${p.id}',
                      child: Image.asset(
                        p.imageUrl.isEmpty
                            ? 'assets/images/shippings/shippings_header.png'
                            : p.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Icon(
                    Icons.favorite_border,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                p.name.toUpperCase(),
                style: GoogleFonts.bodoniModa(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Text(
              "€ ${p.price.toStringAsFixed(2)}",
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "COLLEZIONE AUTUNNO 2026",
          style: GoogleFonts.lato(
            fontSize: 10,
            letterSpacing: 2,
            color: AppTheme.sGold,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget _buildJournalSection(ThemeData theme, bool isMobile) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 60),
        child: Column(
          children: [
            FadeInAnimation(
              child: Column(
                children: [
                  Text(
                    "THE JOURNAL",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      letterSpacing: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 60),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (isMobile) {
                        return Column(
                          children: [
                            _buildJournalItem(
                              "L'Origine del Gusto: Il San Marzano DOP",
                              "assets/images/homepage/san_marzano_homepage.jpg",
                            ),
                            const SizedBox(height: 40),
                            _buildJournalItem(
                              "L'Arte del Packaging Sostenibile",
                              "assets/images/homepage/impasto_homepage.jpg",
                            ),
                          ],
                        );
                      }
                      return Row(
                        children: [
                          Expanded(
                            child: _buildJournalItem(
                              "L'Origine del Gusto: Il San Marzano DOP",
                              "assets/images/homepage/san_marzano_homepage.jpg",
                            ),
                          ),
                          const SizedBox(width: 60),
                          Expanded(
                            child: _buildJournalItem(
                              "L'Arte del Packaging Sostenibile",
                              "assets/images/homepage/impasto_homepage.jpg",
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJournalItem(String title, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: GoogleFonts.bodoniModa(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "LEGGI L'ARTICOLO —",
          style: GoogleFonts.lato(
            fontSize: 10,
            letterSpacing: 2,
            fontWeight: FontWeight.w900,
            color: AppTheme.sGold,
          ),
        ),
      ],
    );
  }

  Widget _buildGoldCTA(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.sGold, width: 1),
      ),
      child: Text(
        label,
        style: GoogleFonts.lato(
          color: AppTheme.sGold,
          letterSpacing: 4,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
