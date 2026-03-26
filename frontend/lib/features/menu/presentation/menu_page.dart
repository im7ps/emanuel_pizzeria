import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../core/theme.dart';
import '../../../core/widgets/navbar.dart';
import '../../../core/widgets/footer.dart';

// --- MODELS (DOMAIN) ---

class Ingredient {
  final String name;
  final double price;
  Ingredient({required this.name, this.price = 0.0});
}

class Product {
  final String name;
  final String description;
  final double basePrice;
  final String image;
  final double rating;
  final List<String> allergens;
  final List<Ingredient> baseIngredients;
  final List<Ingredient> extraOptions;
  final bool isBestSeller;
  final bool isVeg;
  final bool isHot;

  Product({
    required this.name,
    required this.description,
    required this.basePrice,
    required this.image,
    this.rating = 5.0,
    required this.allergens,
    required this.baseIngredients,
    this.extraOptions = const [],
    this.isBestSeller = false,
    this.isVeg = false,
    this.isHot = false,
  });
}

class CartItem {
  final Product product;
  int quantity;
  final List<String> removedIngredients;
  final List<Ingredient> addedExtras;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.removedIngredients = const [],
    this.addedExtras = const [],
  });

  double get totalPrice {
    double extrasPrice = addedExtras.fold(0, (sum, item) => sum + item.price);
    return (product.basePrice + extrasPrice) * quantity;
  }
}

// --- STATE MANAGEMENT (APPLICATION) ---

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(CartItem item) {
    state = [...state, item];
  }

  void removeItem(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  double get totalCartPrice =>
      state.fold(0, (sum, item) => sum + item.totalPrice);
  int get totalItemsCount => state.fold(0, (sum, item) => sum + item.quantity);

  void clearCart() => state = [];
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

// --- UI (PRESENTATION) ---

class MenuPage extends ConsumerStatefulWidget {
  const MenuPage({super.key});

  @override
  ConsumerState<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedCategory = 'Le Classiche';
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final Map<String, IconData> allergenIcons = {
    'Glutine': Icons.grain,
    'Lattosio': Icons.water_drop,
    'Frutta a guscio': Icons.eco,
    'Uova': Icons.egg,
    'Pesce': Icons.phishing,
  };

  late final List<Map<String, dynamic>> menuData = [
    {
      'title': 'Le Classiche',
      'image': 'assets/images/homepage/pizza_homepage.jpg',
      'items': [
        Product(
          name: 'Margherita del Vesuvio',
          description:
              'Pomodoro San Marzano DOP, Mozzarella di Bufala, Basilico Fresco, Olio EVO.',
          basePrice: 8.50,
          image: 'assets/images/homepage/pizza_homepage.jpg',
          rating: 4.9,
          isBestSeller: true,
          isVeg: true,
          allergens: ['Glutine', 'Lattosio'],
          baseIngredients: [
            Ingredient(name: 'Pomodoro San Marzano'),
            Ingredient(name: 'Mozzarella di Bufala'),
            Ingredient(name: 'Basilico'),
          ],
          extraOptions: [
            Ingredient(name: 'Doppia Bufala', price: 2.50),
            Ingredient(name: 'Bordo Ripieno', price: 2.00),
          ],
        ),
      ],
    },
    {
      'title': 'Le Speciali',
      'image': 'assets/images/homepage/san_marzano_homepage.jpg',
      'items': [
        Product(
          name: 'Pistacchio e Mortadella',
          description:
              'Pesto di Pistacchio, Provola, Mortadella Bologna IGP, Granella di Pistacchio.',
          basePrice: 12.00,
          image: 'assets/images/homepage/san_marzano_homepage.jpg',
          rating: 5.0,
          isBestSeller: true,
          allergens: ['Glutine', 'Lattosio', 'Frutta a guscio'],
          baseIngredients: [
            Ingredient(name: 'Provola di Agerola'),
            Ingredient(name: 'Pesto di Pistacchio'),
            Ingredient(name: 'Mortadella IGP'),
          ],
          extraOptions: [
            Ingredient(name: 'Stracciatella Puglia', price: 3.00),
          ],
        ),
      ],
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final viewHeight = MediaQuery.of(context).size.height;
    final viewWidth = MediaQuery.of(context).size.width;
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Navbar(),
      ),
      endDrawer: _buildCartDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset("assets/images/menu/menu_background.jpg",
                  fit: BoxFit.cover)),
          Positioned.fill(
              child: Container(
                  color: AppTheme.background.withValues(alpha: 0.88))),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 140),
                Text("IL NOSTRO MENÙ",
                    style: AppTheme.menuCategoryTitle
                        .copyWith(fontSize: isMobile ? 32 : 48)),
                const SizedBox(height: 10),
                Container(height: 4, width: 80, color: AppTheme.gold),
                const SizedBox(height: 30),
                _buildSearchBar(isMobile),
                const SizedBox(height: 20),
                _buildCategorySelector(isMobile),
                const SizedBox(height: 30),
                if (!isMobile) _buildLegend(false),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: isMobile ? 16 : 100),
                  child: _buildMenuBody(isMobile, viewHeight, viewWidth),
                ),
                const SizedBox(height: 100),
                const Footer(),
              ],
            ),
          ),
          if (cartItems.isNotEmpty)
            Positioned(
              bottom: 30,
              left: 20,
              child: _buildCartFAB(ref),
            ),
          if (isMobile)
            Positioned(
              bottom: 30,
              right: 20,
              child: FloatingActionButton(
                heroTag: "info",
                backgroundColor: AppTheme.accent,
                onPressed: () => _showLegendPopup(context),
                child: const Icon(Icons.info_outline, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCartFAB(WidgetRef ref) {
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
                color: Colors.black.withValues(alpha: 0.2), blurRadius: 10)
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
                        color: AppTheme.accent, shape: BoxShape.circle),
                    child: Text("$count",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Text("€ ${total.toStringAsFixed(2)}",
                style: GoogleFonts.arvo(
                    color: Colors.white, fontWeight: FontWeight.bold)),
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
                const Icon(Icons.shopping_basket_outlined,
                    color: AppTheme.accent, size: 32),
                const SizedBox(width: 12),
                Text("IL TUO ORDINE",
                    style: AppTheme.menuTitle.copyWith(fontSize: 24)),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text("IL CARRELLO È VUOTO",
                        style: AppTheme.menuIngredients))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(item.product.name,
                            style: AppTheme.menuTitle.copyWith(fontSize: 16)),
                        subtitle: Text(
                          "${item.quantity}x - Personalizzato",
                          style:
                              AppTheme.menuIngredients.copyWith(fontSize: 12),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("€ ${item.totalPrice.toStringAsFixed(2)}",
                                style:
                                    AppTheme.menuPrice.copyWith(fontSize: 14)),
                            IconButton(
                                icon: const Icon(Icons.delete_outline,
                                    color: Colors.red, size: 20),
                                onPressed: () => ref
                                    .read(cartProvider.notifier)
                                    .removeItem(index)),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5))
            ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TOTALE PARZIALE",
                        style: AppTheme.menuIngredients
                            .copyWith(fontWeight: FontWeight.bold)),
                    Text("€ ${total.toStringAsFixed(2)}",
                        style: AppTheme.menuPrice
                            .copyWith(color: AppTheme.accent, fontSize: 24)),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: cart.isEmpty ? null : () {},
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

  Widget _buildSearchBar(bool isMobile) {
    return Container(
      constraints: const BoxConstraints(
          maxWidth: 600), // FIX: maxWidth corretto dentro constraints
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppTheme.cardBg.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppTheme.gold.withValues(alpha: 0.3))),
      child: TextField(
        controller: _searchController,
        onChanged: (val) => setState(() => searchQuery = val.toLowerCase()),
        style: AppTheme.menuIngredients,
        decoration: InputDecoration(
          hintText: "CERCA IN TUTTO IL MENÙ...",
          hintStyle: AppTheme.menuIngredients
              .copyWith(color: AppTheme.text.withValues(alpha: 0.4)),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: AppTheme.gold),
        ),
      ),
    );
  }

  Widget _buildCategorySelector(bool isMobile) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: menuData.map((cat) {
          bool isSelected = selectedCategory == cat['title'];
          return GestureDetector(
            onTap: () => setState(() => selectedCategory = cat['title']),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                      height: isMobile ? 110 : 160,
                      width: isMobile ? 110 : 160,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: isSelected
                                  ? AppTheme.accent
                                  : Colors.transparent,
                              width: 3),
                          image: DecorationImage(
                              image: AssetImage(cat['image']),
                              fit: BoxFit.cover))),
                  const SizedBox(height: 12),
                  Text(cat['title'].toString().toUpperCase(),
                      style: AppTheme.menuTitle.copyWith(
                          fontSize: 12,
                          color: isSelected ? AppTheme.accent : AppTheme.text)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMenuBody(bool isMobile, double viewHeight, double viewWidth) {
    List<Product> allProductsCombined = [];
    if (searchQuery.isNotEmpty) {
      for (var cat in menuData) {
        allProductsCombined.addAll(cat['items'] as List<Product>);
      }
    } else {
      allProductsCombined = menuData.firstWhere(
          (cat) => cat['title'] == selectedCategory)['items'] as List<Product>;
    }

    final filtered = allProductsCombined
        .where((p) =>
            p.name.toLowerCase().contains(searchQuery) ||
            p.description.toLowerCase().contains(searchQuery))
        .toList();

    return Column(
      children: filtered.asMap().entries.map((entry) {
        final product = entry.value;
        return TweenAnimationBuilder(
          key: ValueKey(product.name + searchQuery),
          duration: Duration(milliseconds: 400 + (entry.key * 100)),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, value, child) => Opacity(
              opacity: value,
              child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)), child: child)),
          child: _buildProductCard(product, isMobile, viewHeight, viewWidth),
        );
      }).toList(),
    );
  }

  Widget _buildProductCard(Product p, bool isMobile, double vh, double vw) {
    return GestureDetector(
      onTap: () => _showProductDetails(context, p),
      child: Container(
        height: isMobile ? 220 : vh * 0.22,
        margin: const EdgeInsets.only(bottom: 24),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: AppTheme.cardBg.withValues(alpha: 0.65),
                  border: Border(
                      left: BorderSide(color: AppTheme.accent, width: 4))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(p.name,
                                style: AppTheme.menuTitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 4),
                            Row(
                              children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star,
                                      size: 14,
                                      color: index < p.rating.floor()
                                          ? AppTheme.gold
                                          : Colors.grey
                                              .withValues(alpha: 0.3))),
                            ),
                          ],
                        ),
                      ),
                      Text("€ ${p.basePrice.toStringAsFixed(2)}",
                          style: AppTheme.menuPrice),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                      child: Text(p.description,
                          style: AppTheme.menuIngredients,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis)),
                  const SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        if (p.isBestSeller)
                          _cardBadge(Icons.star, "BEST", AppTheme.gold),
                        if (p.isVeg) _cardBadge(Icons.eco, "VEG", Colors.green),
                        if (p.isHot)
                          _cardBadge(Icons.whatshot, "HOT", Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardBadge(IconData icon, String label, Color color) {
    return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Row(children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(
                  fontSize: 10, fontWeight: FontWeight.bold, color: color))
        ]));
  }

  void _showProductDetails(BuildContext context, Product p) {
    int quantity = 1;
    List<String> removed = [];
    List<Ingredient> added = [];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          double currentTotal =
              (p.basePrice + added.fold(0, (sum, i) => sum + i.price)) *
                  quantity;

          return Dialog(
            // FIX: Usiamo Dialog invece di AlertDialog per evitare IntrinsicWidth
            backgroundColor: AppTheme.background,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: SizedBox(
              // FIX: SizedBox forza una larghezza finita, risolvendo l'errore width.isFinite
              width: 600,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.85),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Image.asset(p.image,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover),
                          Positioned(
                              right: 10,
                              top: 10,
                              child: CircleAvatar(
                                  backgroundColor:
                                      Colors.black.withValues(alpha: 0.5),
                                  child: IconButton(
                                      icon: const Icon(Icons.close,
                                          color: Colors.white),
                                      onPressed: () =>
                                          Navigator.pop(context)))),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(p.name,
                                style:
                                    AppTheme.menuTitle.copyWith(fontSize: 28)),
                            const SizedBox(height: 12),
                            Text("RIMUOVI INGREDIENTI:",
                                style: AppTheme.menuIngredients
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Wrap(
                              spacing: 8,
                              children: p.baseIngredients.map((ing) {
                                bool isRemoved = removed.contains(ing.name);
                                return FilterChip(
                                  label: Text(ing.name,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: isRemoved
                                              ? Colors.red
                                              : AppTheme.text)),
                                  selected: isRemoved,
                                  onSelected: (val) => setDialogState(() => val
                                      ? removed.add(ing.name)
                                      : removed.remove(ing.name)),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 16),
                            Text("AGGIUNGI EXTRA:",
                                style: AppTheme.menuIngredients
                                    .copyWith(fontWeight: FontWeight.bold)),
                            ...p.extraOptions.map((ext) {
                              bool isAdded = added.contains(ext);
                              return CheckboxListTile(
                                title: Text(
                                    "${ext.name} (+€ ${ext.price.toStringAsFixed(2)})",
                                    style: AppTheme.menuIngredients),
                                value: isAdded,
                                onChanged: (val) => setDialogState(() =>
                                    val! ? added.add(ext) : added.remove(ext)),
                              );
                            }),
                            const Divider(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: quantity > 1
                                            ? () =>
                                                setDialogState(() => quantity--)
                                            : null),
                                    Text("$quantity",
                                        style: AppTheme.menuPrice),
                                    IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () =>
                                            setDialogState(() => quantity++)),
                                  ],
                                ),
                                Text(
                                    "TOT: € ${currentTotal.toStringAsFixed(2)}",
                                    style: AppTheme.menuPrice.copyWith(
                                        color: AppTheme.accent, fontSize: 22)),
                              ],
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  ref.read(cartProvider.notifier).addItem(
                                      CartItem(
                                          product: p,
                                          quantity: quantity,
                                          removedIngredients: removed,
                                          addedExtras: added));
                                  Navigator.pop(context);
                                },
                                child: const Text("AGGIUNGI AL ORDINE"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLegend(bool isPopup) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: isPopup
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(horizontal: 100),
        decoration: isPopup
            ? null
            : BoxDecoration(
                border: Border(
                    top:
                        BorderSide(color: AppTheme.gold.withValues(alpha: 0.3)),
                    bottom: BorderSide(
                        color: AppTheme.gold.withValues(alpha: 0.3)))),
        child: Wrap(alignment: WrapAlignment.center, spacing: 20, children: [
          _legendItem(Icons.star, "BEST", AppTheme.gold),
          _legendItem(Icons.eco, "VEG", Colors.green),
          _legendItem(Icons.whatshot, "HOT", Colors.red)
        ]));
  }

  Widget _legendItem(IconData icon, String label, Color color) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 16, color: color),
      const SizedBox(width: 6),
      Text(label,
          style: AppTheme.menuIngredients
              .copyWith(fontSize: 11, fontWeight: FontWeight.bold))
    ]);
  }

  void _showLegendPopup(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppTheme.background,
        builder: (context) => Padding(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("LEGENDA", style: AppTheme.menuTitle),
              const SizedBox(height: 20),
              _buildLegend(true)
            ])));
  }
}
