import 'package:fpdart/fpdart.dart';
import 'package:emanuel_pizzeria/src/core/failure/failure.dart';
import '../models/shipping_product.dart';

abstract class ShippingRepository {
  Future<Either<Failure, List<ShippingProduct>>> getShippingProducts();
  Future<Either<Failure, ShippingProduct>> getProductById(String id);
}
