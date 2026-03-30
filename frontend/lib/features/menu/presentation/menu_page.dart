import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../core/theme.dart';
import '../../../core/widgets/navbar.dart';
import '../../../core/widgets/footer.dart';
import '../domain/models/menu_models.dart';
import 'providers/cart_notifier.dart';
import 'providers/menu_notifier.dart';

// --- UI (PRESENTATION) ---

class MenuPage extends ConsumerStatefulWidget {
  final String? initialCategory;
  const MenuPage({super.key, this.initialCategory});

  @override
  ConsumerState<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedCategory;
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final Map<String, IconData> allergenIcons = {
    'Glutine': Icons.grain,
    'Lattosio': Icons.water_drop,
    'Frutta a guscio': Icons.eco,
    'Uova': Icons.egg,
    'Pesce': Icons.phishing,
  };

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final viewHeight = MediaQuery.of(context).size.height;
    final cartItems = ref.watch(cartProvider);
    final menuAsync = ref.watch(menuProvider);

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
            child: Image.asset(
              "assets/images/menu/menu_background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: AppTheme.background.withValues(alpha: 0.88),
            ),
          ),
          menuAsync.when(
            data: (menuData) {
              if (selectedCategory == null && menuData.isNotEmpty) {
                // Initialize selection on first load
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted && selectedCategory == null) {
                    setState(() => selectedCategory = menuData.first['title']);
                  }
                });
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 140),
                    Text(
                      "IL NOSTRO MENÙ",
                      style: AppTheme.menuCategoryTitle.copyWith(
                        fontSize: isMobile ? 32 : 48,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(height: 4, width: 80, color: AppTheme.accent),
                    const SizedBox(height: 30),
                    _buildSearchBar(isMobile),
                    const SizedBox(height: 20),
                    _buildCategorySelector(isMobile, menuData),
                    const SizedBox(height: 30),
                    if (!isMobile) _buildLegend(false),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 100,
                      ),
                      child: _buildMenuBody(isMobile, viewHeight, menuData),
                    ),
                    const SizedBox(height: 100),
                    const Footer(),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ERRORE: $err", style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => ref.read(menuProvider.notifier).refresh(),
                    child: const Text("RIPROVA"),
                  ),
                ],
              ),
            ),
          ),
          if (cartItems.isNotEmpty)
            Positioned(bottom: 30, left: 20, child: _buildCartFAB(ref)),
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
                          "${item.quantity}x - Personalizzato",
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
      constraints: const BoxConstraints(maxWidth: 600),
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppTheme.cardBg.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppTheme.accent.withValues(alpha: 0.3)),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (val) => setState(() => searchQuery = val.toLowerCase()),
        style: AppTheme.menuIngredients,
        decoration: InputDecoration(
          hintText: "CERCA IN TUTTO IL MENÙ...",
          hintStyle: AppTheme.menuIngredients.copyWith(
            color: AppTheme.text.withValues(alpha: 0.4),
          ),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: AppTheme.accent),
        ),
      ),
    );
  }

  Widget _buildCategorySelector(bool isMobile, List<Map<String, dynamic>> menuData) {
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
                        width: 3,
                      ),
                      image: DecorationImage(
                        image: AssetImage(cat['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    cat['title'].toString().toUpperCase(),
                    style: AppTheme.menuTitle.copyWith(
                      fontSize: 12,
                      color: isSelected ? AppTheme.accent : AppTheme.text,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMenuBody(bool isMobile, double viewHeight, List<Map<String, dynamic>> menuData) {
    List<Product> allProductsCombined = [];
    if (searchQuery.isNotEmpty) {
      for (var cat in menuData) {
        allProductsCombined.addAll(cat['items'] as List<Product>);
      }
    } else {
      final category = menuData.firstWhere(
        (cat) => cat['title'] == selectedCategory,
        orElse: () => menuData.first,
      );
      allProductsCombined = category['items'] as List<Product>;
    }

    final filtered = allProductsCombined
        .where(
          (p) =>
              p.name.toLowerCase().contains(searchQuery) ||
              p.description.toLowerCase().contains(searchQuery),
        )
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
              offset: Offset(0, 20 * (1 - value)),
              child: child,
            ),
          ),
          child: _buildProductCard(product, isMobile, viewHeight),
        );
      }).toList(),
    );
  }

  Widget _buildProductCard(Product p, bool isMobile, double vh) {
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
                  left: BorderSide(color: AppTheme.accent, width: 4),
                ),
              ),
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
                            Text(
                              p.name,
                              style: AppTheme.menuTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  size: 14,
                                  color: index < p.rating.floor()
                                      ? AppTheme.accent
                                      : Colors.grey.withValues(alpha: 0.3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "€ ${p.basePrice.toStringAsFixed(2)}",
                        style: AppTheme.menuPrice,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Text(
                      p.description,
                      style: AppTheme.menuIngredients,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        if (p.isBestSeller)
                          _cardBadge(Icons.star, "BEST", AppTheme.accent),
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
      child: Row(
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
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
              (p.basePrice + added.fold(0.0, (sum, i) => sum + i.price)) *
              quantity;

          return Dialog(
            backgroundColor: AppTheme.background,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: SizedBox(
              width: 600,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.85,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            p.image,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: CircleAvatar(
                              backgroundColor: Colors.black.withValues(
                                alpha: 0.5,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.name,
                              style: AppTheme.menuTitle.copyWith(fontSize: 28),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "RIMUOVI INGREDIENTI:",
                              style: AppTheme.menuIngredients.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              spacing: 8,
                              children: p.baseIngredients.map((ing) {
                                bool isRemoved = removed.contains(ing.name);
                                return FilterChip(
                                  label: Text(
                                    ing.name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isRemoved
                                          ? Colors.red
                                          : AppTheme.text,
                                    ),
                                  ),
                                  selected: isRemoved,
                                  onSelected: (val) => setDialogState(
                                    () => val
                                        ? removed.add(ing.name)
                                        : removed.remove(ing.name),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "AGGIUNGI EXTRA:",
                              style: AppTheme.menuIngredients.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ...p.extraOptions.map((ext) {
                              bool isAdded = added.contains(ext);
                              return CheckboxListTile(
                                title: Text(
                                  "${ext.name} (+€ ${ext.price.toStringAsFixed(2)})",
                                  style: AppTheme.menuIngredients,
                                ),
                                value: isAdded,
                                onChanged: (val) => setDialogState(
                                  () =>
                                      val! ? added.add(ext) : added.remove(ext),
                                ),
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
                                          : null,
                                    ),
                                    Text(
                                      "$quantity",
                                      style: AppTheme.menuPrice,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () =>
                                          setDialogState(() => quantity++),
                                    ),
                                  ],
                                ),
                                Text(
                                  "TOT: € ${currentTotal.toStringAsFixed(2)}",
                                  style: AppTheme.menuPrice.copyWith(
                                    color: AppTheme.accent,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .addItem(
                                        CartItem(
                                          product: p,
                                          quantity: quantity,
                                          removedIngredients: removed,
                                          addedExtras: added,
                                        ),
                                      );
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
                top: BorderSide(color: AppTheme.accent.withValues(alpha: 0.3)),
                bottom: BorderSide(
                  color: AppTheme.accent.withValues(alpha: 0.3),
                ),
              ),
            ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        children: [
          _legendItem(Icons.star, "BEST", AppTheme.accent),
          _legendItem(Icons.eco, "VEG", Colors.green),
          _legendItem(Icons.whatshot, "HOT", Colors.red),
        ],
      ),
    );
  }

  Widget _legendItem(IconData icon, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: AppTheme.menuIngredients.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _showLegendPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.background,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("LEGENDA", style: AppTheme.menuTitle),
            const SizedBox(height: 20),
            _buildLegend(true),
          ],
        ),
      ),
    );
  }
}
