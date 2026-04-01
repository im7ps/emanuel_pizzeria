import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:emanuel_pizzeria/src/core/theme/app_theme.dart';
import 'package:emanuel_pizzeria/src/core/theme/theme_notifier.dart';
import 'package:emanuel_pizzeria/src/features/cart/presentation/pizzeria_cart_notifier.dart';
import 'package:emanuel_pizzeria/src/features/cart/presentation/shop_cart_notifier.dart';
import 'package:emanuel_pizzeria/features/menu/domain/models/menu_models.dart';
import 'package:emanuel_pizzeria/src/shared/widgets/magazine_navbar.dart';
import 'package:emanuel_pizzeria/src/shared/widgets/magazine_footer.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  String _localOption = 'delivery'; // 'eat_here' or 'delivery'
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mood = ref.watch(themeMoodProvider);
    final isPizzeria = mood == AppMood.pizzeria;

    final cart = isPizzeria
        ? ref.watch(pizzeriaCartProvider)
        : ref.watch(shopCartProvider);

    final total = isPizzeria
        ? ref.watch(pizzeriaCartProvider.notifier).totalCartPrice
        : ref.watch(shopCartProvider.notifier).totalCartPrice;

    if (cart.isEmpty) {
      return Scaffold(
        appBar: const MagazineNavbar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("IL TUO CARRELLO È VUOTO"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go(isPizzeria ? '/pizzeria' : '/shop'),
                child: const Text("TORNA ALLO SHOP"),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const MagazineNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    "RIEPILOGO ORDINE",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 40),
                  _buildRecapList(cart, isPizzeria),
                  const Divider(height: 60),
                  if (isPizzeria) _buildLocalOptions(isPizzeria),
                  if (!isPizzeria) _buildShippingForm(),
                  const SizedBox(height: 40),
                  _buildFinalTotal(total, isPizzeria),
                  const SizedBox(height: 40),
                  _buildActionButton(isPizzeria),
                ],
              ),
            ),
            const MagazineFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecapList(List<CartItem> cart, bool isPizzeria) {
    return Container(
      decoration: BoxDecoration(
        color: (isPizzeria ? AppTheme.pAccent : AppTheme.sAccent).withValues(
          alpha: 0.05,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cart.length,
        separatorBuilder: (context, index) =>
            const Divider(indent: 20, endIndent: 20),
        itemBuilder: (context, index) {
          final item = cart[index];
          return ListTile(
            title: Text(
              item.product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("${item.quantity}x"),
            trailing: Text(
              "€ ${item.totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLocalOptions(bool isPizzeria) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _optionChip("MANGIA QUI", 'eat_here', isPizzeria),
            const SizedBox(width: 20),
            _optionChip("DELIVERY / ASPORTO", 'delivery', isPizzeria),
          ],
        ),
        const SizedBox(height: 40),
        if (_localOption == 'delivery') _buildDeliveryForm(),
        if (_localOption == 'eat_here')
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Per consumare al tavolo, ti invitiamo a effettuare una prenotazione. "
              "Il tuo ordine verrà visualizzato dallo staff quando arriverai.",
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }

  Widget _optionChip(String label, String value, bool isPizzeria) {
    bool isSelected = _localOption == value;
    final accent = isPizzeria ? AppTheme.pAccent : AppTheme.sAccent;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (val) {
        if (val) setState(() => _localOption = value);
      },
      selectedColor: accent,
      labelStyle: TextStyle(
        color: isSelected
            ? Colors.white
            : (isPizzeria ? AppTheme.pText : AppTheme.sText),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDeliveryForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField("INDIRIZZO DI CONSEGNA"),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField("CITOFONO / PIANO")),
              const SizedBox(width: 16),
              Expanded(child: _buildTextField("TELEFONO")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShippingForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            "DATI PER LA SPEDIZIONE NAZIONALE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildTextField("NOME E COGNOME"),
          const SizedBox(height: 16),
          _buildTextField("INDIRIZZO COMPLETO"),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField("CITTÀ")),
              const SizedBox(width: 16),
              Expanded(child: _buildTextField("CAP")),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField("TELEFONO PER IL CORRIERE"),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildFinalTotal(double total, bool isPizzeria) {
    final accent = isPizzeria ? AppTheme.pAccent : AppTheme.sAccent;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "TOTALE DA PAGARE",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          "€ ${total.toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: accent,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(bool isPizzeria) {
    if (isPizzeria && _localOption == 'eat_here') {
      return SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: () => context.push('/pizzeria/bookings'),
          style: ElevatedButton.styleFrom(backgroundColor: AppTheme.pSecondary),
          child: const Text("VAI ALLA PRENOTAZIONE TAVOLO"),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          // Logica di pagamento
        },
        child: const Text("PROCEDI AL PAGAMENTO"),
      ),
    );
  }
}
