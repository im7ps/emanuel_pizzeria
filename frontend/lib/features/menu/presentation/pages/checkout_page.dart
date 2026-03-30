import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme.dart';
import '../../../../core/widgets/navbar.dart';
import '../../../../core/widgets/footer.dart';
import '../../domain/models/menu_models.dart';
import '../providers/cart_notifier.dart';

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
    final cart = ref.watch(cartProvider);
    final cartType = ref.read(cartProvider.notifier).cartType;
    final total = ref.read(cartProvider.notifier).totalCartPrice;

    if (cart.isEmpty) {
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Navbar(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("IL TUO CARRELLO È VUOTO"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go('/menu'),
                child: const Text("TORNA AL MENÙ"),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Navbar(),
      ),
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
                    style: AppTheme.menuCategoryTitle,
                  ),
                  const SizedBox(height: 40),
                  _buildRecapList(cart),
                  const Divider(height: 60),
                  if (cartType == ProductType.local) _buildLocalOptions(),
                  if (cartType == ProductType.shipping) _buildShippingForm(),
                  const SizedBox(height: 40),
                  _buildFinalTotal(total),
                  const SizedBox(height: 40),
                  _buildActionButton(cartType),
                ],
              ),
            ),
            const SizedBox(height: 100),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecapList(List<CartItem> cart) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBg.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cart.length,
        separatorBuilder: (context, index) => const Divider(indent: 20, endIndent: 20),
        itemBuilder: (context, index) {
          final item = cart[index];
          return ListTile(
            title: Text(item.product.name, style: AppTheme.menuTitle.copyWith(fontSize: 18)),
            subtitle: Text("${item.quantity}x", style: AppTheme.menuIngredients),
            trailing: Text("€ ${item.totalPrice.toStringAsFixed(2)}", style: AppTheme.menuPrice),
          );
        },
      ),
    );
  }

  Widget _buildLocalOptions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _optionChip("MANGIA QUI", 'eat_here'),
            const SizedBox(width: 20),
            _optionChip("DELIVERY / ASPORTO", 'delivery'),
          ],
        ),
        const SizedBox(height: 40),
        if (_localOption == 'delivery') _buildDeliveryForm(),
        if (_localOption == 'eat_here') 
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Per consumare al tavolo, ti invitiamo a effettuare una prenotazione. "
              "Il tuo ordine verrà visualizzato dallo staff quando arriverai.",
              textAlign: TextAlign.center,
              style: AppTheme.menuIngredients,
            ),
          ),
      ],
    );
  }

  Widget _optionChip(String label, String value) {
    bool isSelected = _localOption == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (val) {
        if (val) setState(() => _localOption = value);
      },
      selectedColor: AppTheme.accent,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : AppTheme.text,
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
          const Text("DATI PER LA SPEDIZIONE NAZIONALE", style: TextStyle(fontWeight: FontWeight.bold)),
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

  Widget _buildFinalTotal(double total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("TOTALE DA PAGARE", style: AppTheme.menuTitle.copyWith(fontSize: 22)),
        Text("€ ${total.toStringAsFixed(2)}", style: AppTheme.menuPrice.copyWith(fontSize: 32, color: AppTheme.accent)),
      ],
    );
  }

  Widget _buildActionButton(ProductType? type) {
    if (type == ProductType.local && _localOption == 'eat_here') {
      return SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: () => context.push('/bookings'),
          style: ElevatedButton.styleFrom(backgroundColor: AppTheme.secondary),
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
