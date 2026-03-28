import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:emanuel_pizzeria/core/failure.dart';
import 'package:emanuel_pizzeria/core/network/dio_provider.dart';
import 'package:emanuel_pizzeria/features/shipping/domain/models/shipping_product.dart';
import 'package:emanuel_pizzeria/features/shipping/domain/repositories/shipping_repository.dart';

class ShippingRepositoryImpl implements ShippingRepository {
  final Dio _dio;
  ShippingRepositoryImpl(this._dio);

  @override
  TaskEither<Failure, List<ShippingProduct>> getProducts() {
    return TaskEither.tryCatch(
      () async {
        await Future.delayed(const Duration(seconds: 1));
        return _mockProducts;
      },
      (error, stackTrace) {
        if (error is DioException) {
          return Failure.networkError(message: error.message);
        }
        return Failure.unknownError(message: error.toString());
      },
    );
  }

  @override
  TaskEither<Failure, List<ShippingCategory>> getCategories() {
    return TaskEither.tryCatch(
      () async {
        await Future.delayed(const Duration(milliseconds: 500));
        return _mockCategories;
      },
      (error, stackTrace) {
        if (error is DioException) {
          return Failure.networkError(message: error.message);
        }
        return Failure.unknownError(message: error.toString());
      },
    );
  }
  
  final List<ShippingCategory> _mockCategories = [
    const ShippingCategory(id: '1', name: 'Sughi e Conserve', description: 'Le basi per la tua pizza a casa'),
    const ShippingCategory(id: '2', name: 'Farine e Impasti', description: 'La nostra miscela segreta'),
    const ShippingCategory(id: '3', name: 'Oli e Condimenti', description: 'Il tocco finale'),
  ];
  
  final List<ShippingProduct> _mockProducts = [
    const ShippingProduct(
      id: '101',
      name: 'Passata San Marzano DOP',
      description: 'La vera passata di pomodoro San Marzano dell\'Agro Sarnese-Nocerino.',
      price: 4.50,
      imageUrl: 'assets/images/homepage/san_marzano_homepage.jpg',
      badge: 'Best Seller',
      isFresh: false,
      stockQuantity: 50,
      categoryId: '1',
    ),
    const ShippingProduct(
      id: '102',
      name: 'Farina Tipo 0 "Emanuel"',
      description: 'Miscela di grani teneri selezionati per una lievitazione perfetta.',
      price: 3.20,
      imageUrl: 'assets/images/homepage/impasto_homepage.jpg',
      isFresh: false,
      stockQuantity: 100,
      categoryId: '2',
    ),
    const ShippingProduct(
      id: '103',
      name: 'Olio EVO Sannita',
      description: 'Estratto a freddo, dal gusto fruttato medio e finale mandorlato.',
      price: 18.00,
      imageUrl: 'assets/images/homepage/products.jpg',
      badge: 'Novità',
      isFresh: false,
      stockQuantity: 20,
      categoryId: '3',
    ),
    const ShippingProduct(
      id: '104',
      name: 'Kit Pizza a Casa (4 Persone)',
      description: 'Include 4 panetti freschi, pomodoro, fiordilatte e basilico.',
      price: 25.00,
      imageUrl: 'assets/images/homepage/pizza_homepage.jpg',
      isFresh: true,
      stockQuantity: 15,
      categoryId: '2',
    ),
  ];
}

final shippingRepositoryProvider = Provider<ShippingRepository>((ref) {
  return ShippingRepositoryImpl(ref.watch(dioProvider));
});
