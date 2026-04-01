import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'src/core/theme/app_theme.dart';
import 'src/core/theme/theme_notifier.dart';
import 'src/routing/app_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: EmanuelPizzeriaApp(),
    ),
  );
}

class EmanuelPizzeriaApp extends ConsumerWidget {
  const EmanuelPizzeriaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mood = ref.watch(themeMoodProvider);
    
    return MaterialApp.router(
      title: 'Emanuel Pizzeria',
      debugShowCheckedModeBanner: false,
      theme: mood == AppMood.pizzeria 
          ? AppTheme.getPizzeriaTheme() 
          : AppTheme.getShopTheme(),
      routerConfig: appRouter,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
