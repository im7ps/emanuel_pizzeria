import 'package:go_router/go_router.dart';
import '../features/menu/presentation/home_page.dart';
import '../features/menu/presentation/menu_page.dart';
import '../features/booking/presentation/booking_page.dart';
import '../features/shipping/presentation/pages/shipping_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/menu',
      builder: (context, state) => const MenuPage(),
    ),
    GoRoute(
      path: '/bookings',
      builder: (context, state) => const BookingPage(),
    ),
    GoRoute(
      path: '/spedizioni',
      builder: (context, state) => const ShippingPage(),
    ),
  ],
);
