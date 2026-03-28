import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/menu_models.dart';

part 'cart_notifier.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<CartItem> build() => [];

  void addItem(CartItem item) {
    state = [...state, item];
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
