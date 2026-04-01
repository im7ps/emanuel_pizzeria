import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:emanuel_pizzeria/src/core/failure/failure.dart';
import '../../domain/models/shipping_product.dart';
import '../../domain/repositories/shipping_repository.dart';

class ShippingRepositoryImpl implements ShippingRepository {
  final Dio _dio;

  ShippingRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, List<ShippingProduct>>> getShippingProducts() async {
    try {
      if (kDebugMode) {
        print('ShippingRepository: Fetching from ${_dio.options.baseUrl}');
      }
      // In futuro: final response = await _dio.get('/shipping/products');
      // Mock data per ora
      final List<ShippingProduct> products = [
        // Mock data...
      ];
      return Right(products);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShippingProduct>> getProductById(String id) async {
    try {
      // Mock o API
      final product = ShippingProduct(
        id: id,
        name: "Mock Product",
        description: "Description",
        price: 10.0,
        imageUrl: "",
        categoryId: "",
      );
      return Right(product);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
