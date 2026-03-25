import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../core/theme.dart';

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
    _scrollController.addListener(() {
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
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          child: const _Navbar(),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const _HeroSection(),
            const _ThreeSoulsSection(),
            const _StorytellingSection(),
            _buildFooter(context),
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

  Widget _buildFooter(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      padding: EdgeInsets.all(isMobile ? 40 : 80),
      color: AppTheme.text,
      width: double.infinity,
      child: Column(
        children: [
          Icon(Icons.restaurant_menu,
              color: AppTheme.secondary.withValues(alpha: 0.5),
              size: isMobile ? 30 : 40),
          const SizedBox(height: 30),
          Text(
            "EMANUEL PIZZERIA",
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: isMobile ? 18 : 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "© 2024 Emanuel Pizzeria - Passione del Sud",
            style:
                GoogleFonts.merriweather(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _Navbar extends StatelessWidget implements PreferredSizeWidget {
  const _Navbar();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.7), // Ombra più decisa in alto
            Colors.black.withValues(alpha: 0.3), // Sfumatura intermedia
            Colors.transparent,
          ],
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: isMobile ? 80 : 100,
        centerTitle: false,
        title: Text(
          "EMANUEL",
          style: GoogleFonts.playfairDisplay(
            color: AppTheme.accent,
            fontWeight: FontWeight.w900,
            fontSize: isMobile ? 24 : 28,
            letterSpacing: 2,
          ),
        ),
        actions: isMobile
            ? [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
              ]
            : [
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _NavButton(label: "IL MENÙ", onTap: () {}),
                        _NavButton(label: "SPEDIZIONI", onTap: () {}),
                        _NavButton(label: "LAVORA CON NOI", onTap: () {}),
                        _NavButton(label: "CONTATTI", onTap: () {}),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      child: Text(
        label,
        style: GoogleFonts.playfairDisplay(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    double heroHeight = isMobile ? 700 : (isTablet ? 850 : 950);
    double titleFontSize = isMobile ? 42 : (isTablet ? 72 : 96);

    return Stack(
      children: [
        // Background Image
        Container(
          height: heroHeight,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pizza_homepage.jpg"),
              fit: BoxFit.cover,
              opacity: 0.85,
            ),
          ),
        ),
        // Content
        Positioned.fill(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    "IL CUORE PULSANTE DEL SUD,\nDIRETTAMENTE NEL TUO PIATTO.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: titleFontSize,
                      height: 1.0,
                      color: AppTheme.accent,
                      shadows: [
                        Shadow(
                          color: AppTheme.background.withValues(alpha: 0.9),
                          offset: const Offset(0, 0),
                          blurRadius: 25, // Bagliore più ampio
                        ),
                        Shadow(
                          color: AppTheme.background.withValues(alpha: 0.7),
                          offset: const Offset(0, 0),
                          blurRadius: 10, // Bagliore intenso centrale
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: [
                      _HoverButton(
                        label: "PRENOTA UN TAVOLO",
                        baseColor: AppTheme.accent,
                        onPressed: () {},
                      ),
                      _HoverButton(
                        label: "ORDINA A CASA",
                        baseColor: AppTheme.secondary,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HoverButton extends StatelessWidget {
  final String label;
  final Color baseColor;
  final VoidCallback onPressed;

  const _HoverButton({
    required this.label,
    required this.baseColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.hovered)) return AppTheme.background;
          return baseColor;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.hovered)) return baseColor;
          return Colors.white;
        }),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 44, vertical: 24),
        ),
        elevation: WidgetStateProperty.all(0),
        side: WidgetStateProperty.resolveWith<BorderSide>((states) {
          return BorderSide(color: baseColor, width: 1.5);
        }),
        shape: WidgetStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        )),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _ThreeSoulsSection extends StatelessWidget {
  const _ThreeSoulsSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(vertical: isMobile ? 80 : 140, horizontal: 24),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(
              "assets/images/rock_wall_background_homepage.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.45),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            "COSA FACCIAMO",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppTheme.background,
                  letterSpacing: 8,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
          ),
          SizedBox(height: isMobile ? 60 : 100),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildSoulCard(
                context,
                title: "A Tavola",
                description:
                    "L'esperienza completa in Pizzeria. Ti aspettiamo nel cuore di [Tua Città].",
                imagePath: "assets/images/table.jpg",
                onTap: () {},
              ),
              _buildSoulCard(
                context,
                title: "Take Away",
                description:
                    "Pronta per te in soli 15 minuti. Per non rinunciare mai al Sud.",
                imagePath: "assets/images/delivery.jpg",
                onTap: () {},
              ),
              _buildSoulCard(
                context,
                title: "Shop Online",
                description:
                    "I migliori kit pizza e prodotti tipici consegnati in tutta Italia direttamente a casa tua.",
                imagePath: "assets/images/products.jpg",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSoulCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: isMobile ? 320 : 360,
          height: isMobile ? 480 : 540,
          decoration: BoxDecoration(
            color: AppTheme.background,
            border: Border.all(
                color: AppTheme.secondary.withValues(alpha: 0.3), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: isMobile ? 180 : 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                  child: Column(
                    children: [
                      Text(
                        title.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontSize: 22,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                          color: AppTheme.accent,
                          thickness: 1.5,
                          indent: 40,
                          endIndent: 40),
                      const SizedBox(height: 15),
                      Expanded(
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 16,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.text,
                                  overflow: TextOverflow.fade),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "SCOPRI DI PIÙ →",
                        style: GoogleFonts.playfairDisplay(
                          color: AppTheme.accent,
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StorytellingSection extends StatelessWidget {
  const _StorytellingSection();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 1100;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 140, horizontal: 24),
      color: AppTheme.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
                  children: [
                    _buildStoryImage(),
                    const SizedBox(height: 60),
                    _buildStoryText(context, textAlign: TextAlign.center),
                  ],
                )
              : IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: _buildStoryImage()),
                      const SizedBox(width: 80),
                      Expanded(
                          flex: 1,
                          child: _buildStoryText(context,
                              textAlign: TextAlign.start)),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildStoryImage() {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/san_marzano_homepage.jpg"),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.text.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 20),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryText(BuildContext context, {required TextAlign textAlign}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "LA NOSTRA STORIA",
          style: GoogleFonts.playfairDisplay(
            color: AppTheme.accent,
            letterSpacing: 4,
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          "\"Lievito madre, 48 ore di attesa e solo pomodoro San Marzano DOP. Non è solo cibo, è il nostro modo di dirti benvenuto al Sud.\"",
          textAlign: textAlign,
          style: GoogleFonts.playfairDisplay(
            fontSize: 34,
            fontStyle: FontStyle.italic,
            color: AppTheme.text,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 40),
        const Icon(Icons.star, color: AppTheme.secondary, size: 30),
      ],
    );
  }
}
