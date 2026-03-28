import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:emanuel_pizzeria/features/shipping/data/repositories/shipping_repository_impl.dart';
import 'package:emanuel_pizzeria/features/shipping/domain/models/shipping_product.dart';

part 'shipping_notifier.g.dart';

@riverpod
class ShippingNotifier extends _$ShippingNotifier {
  @override
  FutureOr<List<ShippingProduct>> build() {
    return _fetchProducts();
  }

  Future<List<ShippingProduct>> _fetchProducts() async {
    final repository = ref.read(shippingRepositoryProvider);
    final result = await repository.getProducts().run();
    
    return result.fold(
      (failure) => throw failure.message ?? 'Unknown error',
      (products) => products,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchProducts());
  }
}

@riverpod
Future<List<ShippingCategory>> shippingCategories(Ref ref) async {
  final repository = ref.read(shippingRepositoryProvider);
  final result = await repository.getCategories().run();
  
  return result.fold(
    (failure) => throw failure.message ?? 'Unknown error',
    (categories) => categories,
  );
}
