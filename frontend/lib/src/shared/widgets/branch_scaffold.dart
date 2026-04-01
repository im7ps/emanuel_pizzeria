import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'magazine_navbar.dart';

class BranchScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BranchScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MagazineNavbar(),
      body: navigationShell,
    );
  }
}
