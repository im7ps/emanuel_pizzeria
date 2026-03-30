import 'package:flutter/material.dart';
import '../../../../core/theme.dart';
import '../../../../core/widgets/navbar.dart';
import '../../../../core/widgets/footer.dart';

class WorkWithUsPage extends StatelessWidget {
  const WorkWithUsPage({super.key});

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
                color: AppTheme.accent,
                image: const DecorationImage(
                  image: AssetImage("assets/images/bookings/bookings_background.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.3,
                ),
              ),
              child: const Center(
                child: Text(
                  "LAVORA CON NOI",
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
                "Inviaci il tuo CV a: job@emanuelpizzeria.it\n\nPosizioni aperte:\n- Pizzaiolo esperto\n- Cameriere/a di sala\n- Addetto alle consegne",
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
