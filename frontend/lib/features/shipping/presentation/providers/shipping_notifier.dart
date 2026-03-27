import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:emanuel_pizzeria/features/shipping/data/repositories/shipping_repository_impl.dart';
import 'package:emanuel_pizzeria/features/shipping/domain/models/shipping_product.dart';

class ShippingNotifier extends StateNotifier<AsyncValue<List<ShippingProduct>>> {
  final Ref _ref;

  ShippingNotifier(this._ref) : super(const AsyncValue.loading()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    state = const AsyncValue.loading();
    final repository = _ref.read(shippingRepositoryProvider);
    final result = await repository.getProducts().run();
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message ?? 'Unknown error', StackTrace.current),
      (products) => AsyncValue.data(products),
    );
  }

  Future<void> refresh() => fetchProducts();
}

final shippingNotifierProvider = StateNotifierProvider<ShippingNotifier, AsyncValue<List<ShippingProduct>>>((ref) {
  return ShippingNotifier(ref);
});

final shippingCategoriesProvider = FutureProvider<List<ShippingCategory>>((ref) async {
  final repository = ref.read(shippingRepositoryProvider);
  final result = await repository.getCategories().run();
  
  return result.fold(
    (failure) => throw failure.message ?? 'Unknown error',
    (categories) => categories,
  );
});
