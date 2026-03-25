import 'package:flutter/material.dart';
import '../../../core/theme.dart';
import '../../../core/widgets/navbar.dart';
import '../../../core/widgets/footer.dart';
import 'widgets/hero_section.dart';
import 'widgets/services_section.dart';
import 'widgets/storytelling_section.dart';
import 'widgets/map_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isNavbarVisible = true;
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 200 && _isNavbarVisible) {
      setState(() => _isNavbarVisible = false);
    } else if (_scrollController.offset <= 200 && !_isNavbarVisible) {
      setState(() => _isNavbarVisible = true);
    }
    if (_scrollController.offset > 600 && !_showBackToTop) {
      setState(() => _showBackToTop = true);
    } else if (_scrollController.offset <= 600 && _showBackToTop) {
      setState(() => _showBackToTop = false);
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AnimatedSlide(
          offset: _isNavbarVisible ? Offset.zero : const Offset(0, -1),
          duration: const Duration(milliseconds: 300),
          child: const Navbar(),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(),
            Services(),
            StorytellingSection(),
            MapSection(),
            Footer(),
            ],
            ),
            ),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: AppTheme.accent,
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
    );
  }
}
