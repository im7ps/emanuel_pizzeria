import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../core/theme.dart';
import '../../../core/widgets/navbar.dart';
import '../../../core/widgets/footer.dart';
import '../domain/models/booking_models.dart';
import 'providers/booking_notifier.dart';

class BookingPage extends ConsumerStatefulWidget {
  const BookingPage({super.key});

  @override
  ConsumerState<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends ConsumerState<BookingPage> {
  void _showBookingDialog(int tableId) {
    showDialog(
      context: context,
      builder: (context) {
        final navigator = Navigator.of(context);
        final messenger = ScaffoldMessenger.of(context);
        return _BookingDialog(
          tableId: tableId,
          onConfirm: (reservation) async {
            final success = await ref
                .read(bookingProvider.notifier)
                .createBooking(reservation);
            if (mounted) {
              navigator.pop();
              messenger.showSnackBar(
                SnackBar(
                  content: Text(success
                      ? "Prenotazione confermata!"
                      : "Errore nella prenotazione. Riprova."),
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final tablesAsync = ref.watch(bookingProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.background,
      appBar: const Navbar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _BookingHero(isMobile: isMobile),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: isMobile ? 40 : 80, horizontal: 24),
                  child: Column(
                    children: [
                      Text("MAPPA DELLA SALA",
                          style: GoogleFonts.playfairDisplay(
                              fontSize: isMobile ? 28 : 42,
                              fontWeight: FontWeight.w900,
                              color: AppTheme.accent)),
                      const SizedBox(height: 12),
                      Container(height: 3, width: 80, color: AppTheme.gold),
                      const SizedBox(height: 40),
                      if (!isMobile) _buildLegend(false),
                      const SizedBox(height: 40),
                      tablesAsync.when(
                        data: (tables) => Center(
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 900),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                double mapWidth = constraints.maxWidth;
                                double mapHeight = isMobile ? 500 : 600;

                                return Container(
                                  height: mapHeight,
                                  width: mapWidth,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0EAD6),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppTheme.text
                                            .withValues(alpha: 0.2),
                                        width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black
                                              .withValues(alpha: 0.1),
                                          blurRadius: 30,
                                          offset: const Offset(0, 10))
                                    ],
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned.fill(
                                          child: Opacity(
                                              opacity: 0.3,
                                              child: Image.asset(
                                                  "assets/images/bookings/marble_floor.jpg",
                                                  fit: BoxFit.cover))),

                                      // MURO SINISTRO CON VARCO ENTRATA
                                      _buildWall(0, 0, 15, mapHeight * 0.35),
                                      _buildWall(0, mapHeight * 0.65, 15,
                                          mapHeight * 0.35),
                                      _buildEntranceLabel(
                                          0, mapHeight * 0.35, mapHeight * 0.3),

                                      // ALTRI MURI
                                      _buildWall(0, 0, mapWidth, 15),
                                      _buildServiceArea(mapWidth * 0.75, 0,
                                          mapWidth * 0.25, 120),
                                      _buildWall(
                                          0, mapHeight - 15, mapWidth, 15),

                                      // FINESTRE
                                      _buildWindow(mapWidth * 0.2,
                                          mapHeight - 15, mapWidth * 0.2, 15),
                                      _buildWindow(mapWidth * 0.6,
                                          mapHeight - 15, mapWidth * 0.2, 15),

                                      _buildKitchenArea(mapWidth - 100, 120,
                                          100, mapHeight - 120),

                                      // TAVOLI DINAMICI
                                      ...tables.map((table) => _buildTable(
                                          mapWidth * table.x,
                                          mapHeight * table.y,
                                          table)),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        loading: () => const Center(
                          child: Padding(
                            padding: EdgeInsets.all(80),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        error: (err, stack) => Center(
                          child: Column(
                            children: [
                              Text("Errore caricamento mappa: $err"),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () => ref
                                    .read(bookingProvider.notifier)
                                    .refresh(),
                                child: const Text("RIPROVA"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
          if (isMobile)
            Positioned(
              bottom: 30,
              right: 20,
              child: FloatingActionButton(
                heroTag: "booking_info_fab",
                backgroundColor: AppTheme.accent,
                onPressed: () => _showLegendPopup(context),
                child: const Icon(Icons.info_outline, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLegend(bool isPopup) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: isPopup
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 100),
      decoration: isPopup
          ? null
          : BoxDecoration(
              border: Border(
                top: BorderSide(color: AppTheme.gold.withValues(alpha: 0.3)),
                bottom: BorderSide(color: AppTheme.gold.withValues(alpha: 0.3)),
              ),
            ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 30,
        runSpacing: 15,
        children: [
          _legendItem(Icons.square, "TAVOLO LIBERO", Colors.green.shade600),
          _legendItem(Icons.square, "TAVOLO OCCUPATO", Colors.red.shade700),
          _legendItem(Icons.square, "FINESTRE",
              Colors.blue.shade300), // Richiesto quadrato azzurro
          _legendItem(Icons.wc, "SERVIZI", Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _legendItem(IconData icon, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Text(label,
            style: GoogleFonts.merriweather(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: AppTheme.text.withValues(alpha: 0.7))),
      ],
    );
  }

  void _showLegendPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("SIMBOLI MAPPA", style: AppTheme.menuTitle),
            const SizedBox(height: 24),
            _buildLegend(true),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildWall(double left, double top, double width, double height) {
    return Positioned(
        left: left,
        top: top,
        width: width,
        height: height,
        child: Container(color: Colors.grey.shade800));
  }

  Widget _buildEntranceLabel(double left, double top, double height) {
    return Positioned(
      left: left + 5,
      top: top,
      height: height,
      child: RotatedBox(
        quarterTurns: 3,
        child: Center(
            child: Text("ENTRATA",
                style: GoogleFonts.cinzel(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.accent,
                    letterSpacing: 2))),
      ),
    );
  }

  Widget _buildWindow(double left, double top, double width, double height) {
    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade300,
          border: Border.all(color: Colors.white, width: 1),
        ),
      ),
    );
  }

  Widget _buildServiceArea(
      double left, double top, double width, double height) {
    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(color: Colors.grey.shade800, width: 10),
              bottom: BorderSide(color: Colors.grey.shade800, width: 10)),
          color: Colors.grey.shade200,
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wc, color: Colors.grey, size: 24),
            Text("SERVIZI",
                style: GoogleFonts.merriweather(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
          ],
        )),
      ),
    );
  }

  Widget _buildKitchenArea(
      double left, double top, double width, double height) {
    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: Container(
        decoration:
            BoxDecoration(color: AppTheme.accent.withValues(alpha: 0.05)),
        child: Center(
            child: RotatedBox(
          quarterTurns: 1,
          child: Text("CUCINA & FORNO",
              style: GoogleFonts.cinzel(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Colors.black.withValues(alpha: 0.3))),
        )),
      ),
    );
  }

  Widget _buildTable(double x, double y, TableModel table) {
    return Positioned(
        left: x,
        top: y,
        child: _RefinedTableGroup(
            id: table.id,
            isBooked: table.isBooked,
            onTap: () => _showBookingDialog(table.id)));
  }
}

class _RefinedTableGroup extends StatelessWidget {
  final bool isBooked;
  final VoidCallback onTap;
  final int id;
  const _RefinedTableGroup(
      {required this.isBooked, required this.onTap, required this.id});
  @override
  Widget build(BuildContext context) {
    final statusColor = isBooked ? Colors.red.shade700 : Colors.green.shade600;
    return GestureDetector(
      onTap: isBooked ? null : onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(mainAxisSize: MainAxisSize.min, children: [
            _SmallChair(angle: 0),
            SizedBox(width: 20),
            _SmallChair(angle: 0)
          ]),
          const SizedBox(height: 4),
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: statusColor, width: 2),
                boxShadow: [
                  if (!isBooked)
                    BoxShadow(
                        color: statusColor.withValues(alpha: 0.3),
                        blurRadius: 10)
                ]),
            child: Center(
                child: Text("$id",
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: statusColor))),
          ),
          const SizedBox(height: 4),
          const Row(mainAxisSize: MainAxisSize.min, children: [
            _SmallChair(angle: math.pi),
            SizedBox(width: 20),
            _SmallChair(angle: math.pi)
          ]),
        ],
      ),
    );
  }
}

class _SmallChair extends StatelessWidget {
  final double angle;
  const _SmallChair({required this.angle});
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: angle,
        child: Container(
            width: 18,
            height: 12,
            decoration: BoxDecoration(
                color: AppTheme.text.withValues(alpha: 0.7),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4)))));
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
              fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.black.withValues(alpha: 0.6),
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.7)
            ])),
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 40),
          Text("PRENOTAZIONI",
              style: GoogleFonts.cinzel(
                  color: AppTheme.gold,
                  fontSize: isMobile ? 32 : 56,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 8)),
          const SizedBox(height: 10),
          Text("RISERVA IL TUO TAVOLO",
              style: GoogleFonts.merriweather(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: isMobile ? 12 : 16,
                  letterSpacing: 4))
        ])),
      ),
    );
  }
}

class _BookingDialog extends StatefulWidget {
  final int tableId;
  final Function(BookingReservation) onConfirm;
  const _BookingDialog({required this.tableId, required this.onConfirm});
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
                          image: AssetImage(
                              "assets/images/bookings/booking_form_header.jpg"),
                          fit: BoxFit.cover)),
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.7)
                          ])),
                      padding: const EdgeInsets.all(24),
                      alignment: Alignment.bottomLeft,
                      child: Text("TAVOLO ${widget.tableId}",
                          style: GoogleFonts.playfairDisplay(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w900)))),
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
                          validator: (v) =>
                              (v == null || v.isEmpty) ? "Obbligatorio" : null),
                      _DialogField(
                          controller: _phoneController,
                          label: "Telefono",
                          icon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                          validator: (v) =>
                              (v == null || v.isEmpty) ? "Obbligatorio" : null),
                      _DialogField(
                          controller: _peopleController,
                          label: "Ospiti",
                          icon: Icons.people_outline,
                          keyboardType: TextInputType.number,
                          validator: (v) =>
                              (v == null || v.isEmpty) ? "Obbligatorio" : null),
                      const SizedBox(height: 16),
                      Row(children: [
                        Expanded(
                            child: _DateTimePickerTile(
                                label: "Data",
                                value:
                                    "${_selectedDate.toLocal()}".split(' ')[0],
                                icon: Icons.calendar_today_outlined,
                                onTap: () async {
                                  final p = await showDatePicker(
                                      context: context,
                                      initialDate: _selectedDate,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 30)));
                                  if (p != null) {
                                    setState(() => _selectedDate = p);
                                  }
                                })),
                        const SizedBox(width: 20),
                        Expanded(
                            child: _DateTimePickerTile(
                                label: "Orario",
                                value: _selectedTime.format(context),
                                icon: Icons.access_time_outlined,
                                onTap: () async {
                                  final p = await showTimePicker(
                                      context: context,
                                      initialTime: _selectedTime);
                                  if (p != null) {
                                    setState(() => _selectedTime = p);
                                  }
                                }))
                      ]),
                      const SizedBox(height: 32),
                      Row(children: [
                        Expanded(
                            child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("ANNULLA",
                                    style: GoogleFonts.merriweather(
                                        color: AppTheme.text
                                            .withValues(alpha: 0.5),
                                        fontWeight: FontWeight.bold)))),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    widget.onConfirm(
                                      BookingReservation(
                                        name: _nameController.text,
                                        phone: _phoneController.text,
                                        guests:
                                            int.tryParse(_peopleController.text) ??
                                                4,
                                        date: _selectedDate,
                                        time: _selectedTime.format(context),
                                        tableId: widget.tableId,
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.accent),
                                child: const Text("CONFERMA")))
                      ]),
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
  const _DialogField(
      {required this.controller,
      required this.label,
      required this.icon,
      this.keyboardType = TextInputType.text,
      this.validator});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                labelText: label,
                prefixIcon: Icon(icon, color: AppTheme.gold, size: 20),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppTheme.text.withValues(alpha: 0.1))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.accent))),
            validator: validator));
  }
}

class _DateTimePickerTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;
  const _DateTimePickerTile(
      {required this.label,
      required this.value,
      required this.icon,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label,
            style: GoogleFonts.merriweather(
                fontSize: 11, color: AppTheme.text.withValues(alpha: 0.5))),
        subtitle: Text(value,
            style: GoogleFonts.merriweather(
                fontSize: 15, fontWeight: FontWeight.bold)),
        trailing: Icon(icon, color: AppTheme.gold, size: 20),
        onTap: onTap);
  }
}
