import 'package:go_router/go_router.dart';
import '../features/catalog/presentation/home_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
