import 'package:go_router/go_router.dart';
import '../features/menu/presentation/home_page.dart';
import '../features/menu/presentation/menu_page.dart';
import '../features/booking/presentation/booking_page.dart';
import '../features/shipping/presentation/pages/shipping_page.dart';
import '../features/menu/presentation/pages/work_with_us_page.dart';
import '../features/menu/presentation/pages/contacts_page.dart';
import '../features/menu/presentation/pages/checkout_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/menu',
      builder: (context, state) {
        final category = state.uri.queryParameters['category'];
        return MenuPage(initialCategory: category);
      },
    ),
    GoRoute(
      path: '/bookings',
      builder: (context, state) => const BookingPage(),
    ),
    GoRoute(
      path: '/spedizioni',
      builder: (context, state) => const ShippingPage(),
    ),
    GoRoute(
      path: '/shop',
      builder: (context, state) => const ShippingPage(),
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutPage(),
    ),
    GoRoute(
      path: '/lavora-con-noi',
      builder: (context, state) => const WorkWithUsPage(),
    ),
    GoRoute(
      path: '/contatti',
      builder: (context, state) => const ContactsPage(),
    ),
  ],
);
