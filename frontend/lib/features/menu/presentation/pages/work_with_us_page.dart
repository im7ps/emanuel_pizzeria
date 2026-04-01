import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emanuel_pizzeria/src/core/theme/app_theme.dart';
import 'package:emanuel_pizzeria/src/shared/widgets/magazine_navbar.dart';
import 'package:emanuel_pizzeria/src/shared/widgets/magazine_footer.dart';

class WorkWithUsPage extends StatelessWidget {
  const WorkWithUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MagazineNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Text(
                    "LAVORA CON NOI",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.pAccent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(height: 2, width: 60, color: AppTheme.pGold),
                  const SizedBox(height: 60),
                  const Text(
                    "Sei appassionato di cucina tradizionale? Vuoi unirti al team di Emanuel?\nInviaci il tuo CV a: career@emanuelpizzeria.it",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, height: 2),
                  ),
                ],
              ),
            ),
            const MagazineFooter(),
          ],
        ),
      ),
    );
  }
}
