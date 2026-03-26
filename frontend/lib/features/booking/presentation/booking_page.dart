import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../core/theme.dart';
import '../../../core/widgets/navbar.dart';
import '../../../core/widgets/footer.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Mock data for tables: true = booked, false = free
  final List<bool> tableStatus = List.generate(4, (index) => index % 2 == 0);

  void _showBookingDialog(int tableIndex) {
    showDialog(
      context: context,
      builder: (context) => _BookingDialog(
        tableIndex: tableIndex,
        onConfirm: (data) {
          setState(() {
            tableStatus[tableIndex] = true;
          });
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Prenotazione confermata!")),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.background,
      appBar: const Navbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _BookingHero(isMobile: isMobile),
            
            // Main Section with Ornate Background
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bookings/bookings_background.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.15, // Opacità ridotta per non disturbare la leggibilità
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 40 : 80,
                horizontal: 24,
              ),
              child: Column(
                children: [
                  Text(
                    "PRENOTA IL TUO POSTO",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: isMobile ? 28 : 42,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.accent,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 3,
                    width: 80,
                    color: AppTheme.gold,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Seleziona un tavolo libero per iniziare l'esperienza culinaria.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                      fontSize: isMobile ? 14 : 17,
                      color: AppTheme.text.withValues(alpha: 0.7),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 60),

                  // Map Container with Legend
                  Column(
                    children: [
                      _MapLegend(isMobile: isMobile),
                      const SizedBox(height: 30),
                      Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 650),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              padding: EdgeInsets.all(isMobile ? 16 : 32),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/bookings/marble_floor.jpg"),
                                  fit: BoxFit.cover,
                                  opacity: 0.9,
                                ),
                                border: Border.all(
                                  color: AppTheme.gold.withValues(alpha: 0.3),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 40,
                                    offset: const Offset(0, 20),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        _Quadrant(
                                          child: _RefinedTableGroup(
                                            isBooked: tableStatus[0],
                                            onTap: () => _showBookingDialog(0),
                                            index: 0,
                                          ),
                                        ),
                                        _Quadrant(
                                          child: _RefinedTableGroup(
                                            isBooked: tableStatus[1],
                                            onTap: () => _showBookingDialog(1),
                                            index: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        _Quadrant(
                                          child: _RefinedTableGroup(
                                            isBooked: tableStatus[2],
                                            onTap: () => _showBookingDialog(2),
                                            index: 2,
                                          ),
                                        ),
                                        _Quadrant(
                                          child: _RefinedTableGroup(
                                            isBooked: tableStatus[3],
                                            onTap: () => _showBookingDialog(3),
                                            index: 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _Quadrant extends StatelessWidget {
  final Widget child;
  const _Quadrant({required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            fit: BoxFit.contain,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _MapLegend extends StatelessWidget {
  final bool isMobile;
  const _MapLegend({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LegendItem(color: Colors.green.shade600, label: "LIBERO"),
        const SizedBox(width: 30),
        _LegendItem(color: Colors.red.shade700, label: "OCCUPATO"),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.merriweather(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: AppTheme.text.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}

class _RefinedTableGroup extends StatelessWidget {
  final bool isBooked;
  final VoidCallback onTap;
  final int index;

  const _RefinedTableGroup({
    required this.isBooked,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = isBooked ? Colors.red.shade700 : Colors.green.shade600;
    const double tableSize = 120.0;
    const double chairSizeW = 34.0;
    const double chairSizeH = 26.0;
    const double spacing = 12.0;

    return InkWell(
      onTap: isBooked ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _RefinedChair(width: chairSizeW, height: chairSizeH, angle: 0),
                const SizedBox(width: spacing * 2),
                const _RefinedChair(width: chairSizeW, height: chairSizeH, angle: 0),
              ],
            ),
            const SizedBox(height: spacing),
            Container(
              width: tableSize,
              height: tableSize,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: statusColor.withValues(alpha: 0.8),
                  width: 3.5,
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF2C2C2C),
                    Color(0xFF000000),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: statusColor.withValues(alpha: 0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TAVOLO",
                      style: GoogleFonts.cinzel(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                    Text(
                      "${index + 1}",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: spacing),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _RefinedChair(width: chairSizeW, height: chairSizeH, angle: 3.1415),
                const SizedBox(width: spacing * 2),
                const _RefinedChair(width: chairSizeW, height: chairSizeH, angle: 3.1415),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RefinedChair extends StatelessWidget {
  final double width;
  final double height;
  final double angle;
  const _RefinedChair({required this.width, required this.height, required this.angle});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppTheme.text.withValues(alpha: 0.85),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(1),
            bottomRight: Radius.circular(1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingHero extends StatelessWidget {
  final bool isMobile;
  const _BookingHero({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 250 : 350,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bookings/table.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.6),
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.7),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                "PRENOTAZIONI",
                style: GoogleFonts.cinzel(
                  color: AppTheme.gold,
                  fontSize: isMobile ? 32 : 56,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 8,
                  shadows: [
                    const Shadow(color: Colors.black, blurRadius: 20, offset: Offset(0, 4)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "RISERVA IL TUO TAVOLO",
                style: GoogleFonts.merriweather(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: isMobile ? 12 : 16,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookingDialog extends StatefulWidget {
  final int tableIndex;
  final Function(Map<String, dynamic>) onConfirm;

  const _BookingDialog({required this.tableIndex, required this.onConfirm});

  @override
  State<_BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<_BookingDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _peopleController = TextEditingController(text: "4");
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = const TimeOfDay(hour: 20, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bookings/booking_form_header.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "TAVOLO ${widget.tableIndex + 1}",
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _DialogField(
                        controller: _nameController,
                        label: "Nome Completo",
                        icon: Icons.person_outline,
                        validator: (v) {
                          if (v == null || v.isEmpty) return "Campo obbligatorio";
                          if (!RegExp(r'^[a-zA-Z\s-]+$').hasMatch(v)) return "Solo lettere, spazi e '-'";
                          return null;
                        },
                      ),
                      _DialogField(
                        controller: _phoneController,
                        label: "Recapito Telefonico",
                        icon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                        validator: (v) {
                          if (v == null || v.isEmpty) return "Campo obbligatorio";
                          if (!RegExp(r'^[0-9]+$').hasMatch(v)) return "Solo numeri ammessi";
                          return null;
                        },
                      ),
                      _DialogField(
                        controller: _peopleController,
                        label: "Numero di Ospiti",
                        icon: Icons.people_outline,
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v == null || v.isEmpty) return "Campo obbligatorio";
                          final n = int.tryParse(v);
                          if (n == null || n < 1 || n > 4) return "Max 4 persone";
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _DateTimePickerTile(
                              label: "Data",
                              value: "${_selectedDate.toLocal()}".split(' ')[0],
                              icon: Icons.calendar_today_outlined,
                              onTap: () async {
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: _selectedDate,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(const Duration(days: 30)),
                                );
                                if (picked != null) setState(() => _selectedDate = picked);
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _DateTimePickerTile(
                              label: "Orario",
                              value: _selectedTime.format(context),
                              icon: Icons.access_time_outlined,
                              onTap: () async {
                                final picked = await showTimePicker(
                                  context: context,
                                  initialTime: _selectedTime,
                                );
                                if (picked != null) setState(() => _selectedTime = picked);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "ANNULLA",
                                style: GoogleFonts.merriweather(
                                  color: AppTheme.text.withValues(alpha: 0.5),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  widget.onConfirm({
                                    "name": _nameController.text,
                                    "phone": _phoneController.text,
                                    "people": _peopleController.text,
                                    "date": _selectedDate,
                                    "time": _selectedTime,
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.accent,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: const Text("CONFERMA"),
                            ),
                          ),
                        ],
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

class _DialogField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const _DialogField({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: GoogleFonts.merriweather(fontSize: 14),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.merriweather(color: AppTheme.text.withValues(alpha: 0.5), fontSize: 13),
          prefixIcon: Icon(icon, color: AppTheme.gold, size: 20),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.text.withValues(alpha: 0.1))),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.accent)),
        ),
        validator: validator,
      ),
    );
  }
}

class _DateTimePickerTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _DateTimePickerTile({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label, style: GoogleFonts.merriweather(fontSize: 11, color: AppTheme.text.withValues(alpha: 0.5))),
      subtitle: Text(value, style: GoogleFonts.merriweather(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.text)),
      trailing: Icon(icon, color: AppTheme.gold, size: 20),
      onTap: onTap,
    );
  }
}
