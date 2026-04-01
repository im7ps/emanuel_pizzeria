import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:emanuel_pizzeria/src/core/theme/app_theme.dart';
import 'package:emanuel_pizzeria/src/core/theme/theme_notifier.dart';
import 'package:emanuel_pizzeria/src/features/cart/presentation/pizzeria_cart_notifier.dart';
import 'package:emanuel_pizzeria/features/menu/presentation/providers/menu_notifier.dart';
import 'package:emanuel_pizzeria/src/shared/widgets/magazine_footer.dart';

class MenuPage extends ConsumerWidget {
  final String? initialCategory;
  const MenuPage({super.key, this.initialCategory});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final menuAsync = ref.watch(menuProvider);
    final mood = ref.watch(themeMoodProvider);
    final cartItems = ref.watch(pizzeriaCartProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildSliverAppBar(context, mood),

              // Se siamo nella landing della Pizzeria, mostriamo le sezioni editoriali
              if (initialCategory == null) ...[
                _buildEditorialIntro(mood, isMobile),
                _buildCraftsmanshipSection(mood, isMobile),
                _buildSectionHeader("LE NOSTRE SELEZIONI", mood, isMobile),
              ],

              menuAsync.when(
                data: (menuData) => SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 100,
                    vertical: initialCategory == null ? 20 : 40,
                  ),
                  sliver: _buildAsymmetricGrid(
                    menuData,
                    mood,
                    isMobile,
                    context,
                  ),
                ),
                loading: () => const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, stack) => SliverToBoxAdapter(
                  child: Center(child: Text("ERRORE: $err")),
                ),
              ),

              if (initialCategory == null) ...[
                _buildBookingCTA(context, mood, isMobile),
              ],

              const SliverToBoxAdapter(child: MagazineFooter()),
            ],
          ),
          if (cartItems.isNotEmpty)
            Positioned(bottom: 30, left: 20, child: _buildCartFAB(ref)),
        ],
      ),
    );
  }

  // --- SEZIONI EDITORIALI ---

  Widget _buildSectionHeader(String title, AppMood mood, bool isMobile) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 100,
          vertical: 60,
        ),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                letterSpacing: 4,
                color: AppTheme.pAccent.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 10),
            Container(height: 1, width: 40, color: AppTheme.pAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildEditorialIntro(AppMood mood, bool isMobile) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 100,
          vertical: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(height: 1, width: 40, color: AppTheme.pAccent),
                const SizedBox(width: 12),
                Text(
                  "EST. 1994",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "L'ECCELLENZA NELLA SEMPLICITÀ",
              style: GoogleFonts.playfairDisplay(
                fontSize: isMobile ? 40 : 72,
                fontWeight: FontWeight.w900,
                height: 0.9,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: isMobile ? double.infinity : 500,
              child: Text(
                "Non è solo una pizza. È il risultato di una ricerca ossessiva per la farina perfetta, il pomodoro più dolce e la lievitazione più lenta.",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCraftsmanshipSection(AppMood mood, bool isMobile) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 100),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!isMobile)
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(right: 60, top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "L'ARTE DEL TEMPO",
                          textAlign: TextAlign.right,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "48 ore di maturazione controllata garantiscono un impasto leggero, digeribile e dal cornicione alveolato. La nostra firma inconfondibile.",
                          textAlign: TextAlign.right,
                          style: GoogleFonts.montserrat(
                            color: Colors.black54,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/homepage/impasto_homepage.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookingCTA(BuildContext context, AppMood mood, bool isMobile) {
    return SliverToBoxAdapter(
      child: Container(
        height: 600,
        margin: EdgeInsets.symmetric(
          horizontal: isMobile ? 0 : 100,
          vertical: 100,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset("assets/images/homepage/table.jpg", fit: BoxFit.cover),
            Container(color: Colors.black.withValues(alpha: 0.4)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "RISERVA IL TUO TAVOLO",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    letterSpacing: 4,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "VIVI L'ATMOSFERA",
                  style: GoogleFonts.playfairDisplay(
                    color: Colors.white,
                    fontSize: isMobile ? 32 : 54,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => context.go('/pizzeria/bookings'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: Text(
                    "PRENOTA ORA",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- LOGICA ESISTENTE TWEAKED ---

  Widget _buildSliverAppBar(BuildContext context, AppMood mood) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        onPressed: () => context.go('/'),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: initialCategory != null
            ? Text(
                initialCategory!.toUpperCase(),
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 4,
                ),
              )
            : null,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              initialCategory != null
                  ? "assets/images/menu/menu_background.jpg"
                  : "assets/images/homepage/rock_wall_background_homepage.jpg",
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.7),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
            if (initialCategory == null)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "EMANUEL",
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 84,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 10,
                      ),
                    ),
                    Text(
                      "PIZZERIA & GASTRONOMIA",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: 8,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAsymmetricGrid(
    List<Map<String, dynamic>> menuData,
    AppMood mood,
    bool isMobile,
    BuildContext context,
  ) {
    if (initialCategory != null) {
      final categoryData = menuData.firstWhere(
        (cat) =>
            cat['title'].toString().toLowerCase() ==
            initialCategory!.toLowerCase(),
        orElse: () => menuData.first,
      );
      final List products = categoryData['items'];

      return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final product = products[index];
          return _buildProductListItem(product, mood, isMobile);
        }, childCount: products.length),
      );
    }

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        mainAxisSpacing: 40,
        crossAxisSpacing: 40,
        childAspectRatio: 0.8,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final isEven = index % 2 == 0;
        final cat = menuData[index];
        return _buildMagazineCategoryCard(
          context,
          cat,
          mood,
          !isEven && !isMobile,
        );
      }, childCount: menuData.length),
    );
  }

  Widget _buildMagazineCategoryCard(
    BuildContext context,
    Map<String, dynamic> cat,
    AppMood mood,
    bool withOffset,
  ) {
    return InkWell(
      onTap: () {
        final categoryPath = cat['title'].toString().toLowerCase();
        GoRouter.of(context).push('/pizzeria/menu/$categoryPath');
      },
      child: Transform.translate(
        offset: Offset(0, withOffset ? 40 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(cat['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              cat['title'].toString().toUpperCase(),
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                letterSpacing: 2,
                color: AppTheme.pAccent,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 1,
              width: 30,
              color: Colors.grey.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductListItem(dynamic product, AppMood mood, bool isMobile) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            "€${product.basePrice.toStringAsFixed(2)}",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w900,
              color: AppTheme.pAccent,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: AppTheme.pAccent),
            onPressed: () {
              // Add to cart logic
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCartFAB(WidgetRef ref) {
    final count = ref.watch(pizzeriaCartProvider.notifier).totalItemsCount;
    final total = ref.watch(pizzeriaCartProvider.notifier).totalCartPrice;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.pSecondary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.shopping_basket, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            "$count | € ${total.toStringAsFixed(2)}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
