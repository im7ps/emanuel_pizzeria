import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import 'soul_card.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  // Fattore per simulare il loop infinito
  static const int _loopFactor = 10000;
  late PageController _pageController;
  int _virtualCurrentPage = 0;

  final List<Map<String, String>> _soulsData = [
    {
      "title": "A Tavola",
      "description":
          "L'esperienza completa in Pizzeria. Ti aspettiamo nel cuore di Reggio Calabria.",
      "imagePath": "assets/images/homepage/table.jpg",
    },
    {
      "title": "Take Away",
      "description":
          "Pronta per te in soli 15 minuti. Per non rinunciare mai al Sud.",
      "imagePath": "assets/images/homepage/delivery.jpg",
    },
    {
      "title": "Gastronomia",
      "description":
          "I piatti della tradizione pronti da gustare, preparati con amore ogni giorno.",
      "imagePath": "assets/images/homepage/gastronomy.jpg",
    },
    {
      "title": "Rosticceria",
      "description":
          "Arancini, calzoni e le delizie fritte che hanno reso celebre lo street food del Sud.",
      "imagePath": "assets/images/homepage/rosticceria.jpg",
    },
    {
      "title": "Shop Online",
      "description":
          "I migliori kit pizza e prodotti tipici consegnati in tutta Italia direttamente a casa tua.",
      "imagePath": "assets/images/homepage/products.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    _virtualCurrentPage = (_soulsData.length * _loopFactor) ~/ 2;
    _pageController = PageController(
      viewportFraction: 0.85,
      initialPage: _virtualCurrentPage,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

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
              "assets/images/homepage/rock_wall_background_homepage.jpg"),
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
          if (!isMobile) // Solo se NON è mobile (quindi Tablet e Desktop)
            Wrap(
              spacing: 40,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: _soulsData
                  .map((data) => SoulCard(
                        title: data["title"]!,
                        description: data["description"]!,
                        imagePath: data["imagePath"]!,
                        onTap: () {},
                        isMobile: false,
                      ))
                  .toList(),
            )
          else
            // Solo Mobile Carousel
            Column(
              key: const ValueKey("carousel_section"),
              children: [
                SizedBox(
                  height: 540,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) =>
                        setState(() => _virtualCurrentPage = index),
                    itemBuilder: (context, index) {
                      final actualIndex = index % _soulsData.length;
                      final data = _soulsData[actualIndex];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: SoulCard(
                            title: data["title"]!,
                            description: data["description"]!,
                            imagePath: data["imagePath"]!,
                            onTap: () {},
                            isMobile: true,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareIconButton(
                      icon: Icons.chevron_left,
                      onPressed:
                          _previousPage, // Sempre attivo con loop infinito
                    ),
                    const SizedBox(width: 20),
                    SquareIconButton(
                      icon: Icons.chevron_right,
                      onPressed: _nextPage,
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
