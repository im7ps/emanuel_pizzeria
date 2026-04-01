import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/theme_notifier.dart';
import '../../features/cart/presentation/pizzeria_cart_notifier.dart';

class MagazineNavbar extends ConsumerWidget implements PreferredSizeWidget {
  const MagazineNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mood = ref.watch(themeMoodProvider);
    final isPizzeria = mood == AppMood.pizzeria;
    final cartCount = ref.watch(pizzeriaCartProvider).length;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu, color: isPizzeria ? AppTheme.pAccent : AppTheme.sAccent),
        onPressed: () {},
      ),
      title: GestureDetector(
        onTap: () => context.go('/'),
        child: Text(
          "EMANUEL",
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.w900,
            fontSize: 24,
            letterSpacing: 4,
            color: isPizzeria ? AppTheme.pAccent : AppTheme.sAccent,
          ),
        ),
      ),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_bag_outlined, color: isPizzeria ? AppTheme.pAccent : AppTheme.sAccent),
              onPressed: () {},
            ),
            if (cartCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isPizzeria ? AppTheme.pAccent : AppTheme.sAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "$cartCount",
                    style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
