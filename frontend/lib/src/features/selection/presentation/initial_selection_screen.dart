import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../src/core/theme/app_theme.dart';
import '../../../../src/core/theme/theme_notifier.dart';

class InitialSelectionScreen extends ConsumerWidget {
  const InitialSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                ref
                    .read(themeMoodProvider.notifier)
                    .toggleMood(AppMood.pizzeria);
                context.go('/pizzeria');
              },
              child: Container(
                color: AppTheme.pBackground,
                child: Center(
                  child: Text(
                    "PIZZERIA",
                    style: AppTheme.getPizzeriaTheme().textTheme.displayLarge,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                ref.read(themeMoodProvider.notifier).toggleMood(AppMood.shop);
                context.go('/shop');
              },
              child: Container(
                color: AppTheme.sBackground,
                child: Center(
                  child: Text(
                    "SHOP",
                    style: AppTheme.getShopTheme().textTheme.displayLarge,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
