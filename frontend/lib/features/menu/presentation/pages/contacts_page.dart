import 'package:flutter/material.dart';
import '../../../../core/theme.dart';
import '../../../../core/widgets/navbar.dart';
import '../../../../core/widgets/footer.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Navbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.gold,
                image: const DecorationImage(
                  image: AssetImage("assets/images/homepage/rock_wall_background_homepage.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.3,
                ),
              ),
              child: const Center(
                child: Text(
                  "CONTATTI",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                "Vieni a trovarci in Via Roma, 123 - Reggio Calabria\n\nTelefono: +39 0965 123456\nEmail: info@emanuelpizzeria.it",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
