import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';
import 'package:emanuel_pizzeria/src/core/theme/app_theme.dart';
import 'package:emanuel_pizzeria/src/features/cart/presentation/pizzeria_cart_notifier.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.8),
            Colors.black.withValues(alpha: 0.4),
            Colors.transparent,
          ],
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        leadingWidth: isMobile ? 60 : 100,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded, color: AppTheme.pGold, size: 28),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        centerTitle: true,
        title: GestureDetector(
          onTap: () => context.go('/'),
          child: Text(
            "EMANUEL",
            style: GoogleFonts.playfairDisplay(
              color: AppTheme.pGold,
              fontWeight: FontWeight.w900,
              fontSize: isMobile ? 22 : 26,
              letterSpacing: 3,
            ),
          ),
        ),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final cartCount = ref.watch(pizzeriaCartProvider).length;
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined, color: AppTheme.pGold, size: 28),
                    onPressed: () {
                      // TODO: Open Cart BottomSheet or Page
                    },
                  ),
                  if (cartCount > 0)
                    Positioned(
                      right: 8,
                      top: 12,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppTheme.pAccent,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$cartCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
