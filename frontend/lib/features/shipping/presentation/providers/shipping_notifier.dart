import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:emanuel_pizzeria/src/core/network/dio_provider.dart';
import '../../domain/models/shipping_product.dart';
import '../../data/repositories/shipping_repository_impl.dart';

part 'shipping_notifier.g.dart';

@riverpod
class ShippingNotifier extends _$ShippingNotifier {
  @override
  Future<List<ShippingProduct>> build() async {
    final dio = ref.watch(dioProvider);
    final repo = ShippingRepositoryImpl(dio);
    
    final result = await repo.getShippingProducts();
    
    return result.fold(
      (failure) => throw failure.message ?? "Errore sconosciuto",
      (products) => products,
    );
  }

  Future<ShippingProduct?> getProductById(String id) async {
    final dio = ref.watch(dioProvider);
    final repo = ShippingRepositoryImpl(dio);
    
    final result = await repo.getProductById(id);
    
    return result.fold(
      (failure) => throw failure.message ?? "Errore nel caricamento del prodotto",
      (product) => product,
    );
  }
}
