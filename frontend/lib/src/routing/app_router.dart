import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:emanuel_pizzeria/src/features/selection/presentation/initial_selection_screen.dart';
import 'package:emanuel_pizzeria/src/shared/widgets/branch_scaffold.dart';
import 'package:emanuel_pizzeria/src/features/pizzeria/presentation/pages/menu_page.dart';
import 'package:emanuel_pizzeria/src/features/shop/presentation/pages/shipping_page.dart';
// Temporaneamente importiamo le vecchie pagine per la migrazione
import 'package:emanuel_pizzeria/features/booking/presentation/booking_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final pizzeriaNavigatorKey = GlobalKey<NavigatorState>();
final shopNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const InitialSelectionScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BranchScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: pizzeriaNavigatorKey,
          routes: [
            GoRoute(
              path: '/pizzeria',
              builder: (context, state) => const MenuPage(),
              routes: [
                GoRoute(
                  path: 'menu/:category',
                  builder: (context, state) {
                    final category = state.pathParameters['category'];
                    return MenuPage(initialCategory: category);
                  },
                ),
                GoRoute(
                  path: 'bookings',
                  builder: (context, state) => const BookingPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shopNavigatorKey,
          routes: [
            GoRoute(
              path: '/shop',
              builder: (context, state) => const ShippingPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
