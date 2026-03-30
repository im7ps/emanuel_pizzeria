import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/menu_models.dart';

part 'cart_notifier.g.dart';

@Riverpod(keepAlive: true)
class Cart extends _$Cart {
  @override
  List<CartItem> build() => [];

  ProductType? get cartType {
    if (state.isEmpty) return null;
    return state.first.product.type;
  }

  bool addItem(CartItem item) {
    if (state.isNotEmpty && state.first.product.type != item.product.type) {
      return false; // Type mismatch
    }
    state = [...state, item];
    return true;
  }

  void removeItem(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  double get totalCartPrice =>
      state.fold(0, (sum, item) => sum + item.totalPrice);
      
  int get totalItemsCount => state.fold(0, (sum, item) => sum + item.quantity);

  void clearCart() => state = [];
}
