import 'package:fpdart/fpdart.dart';
import 'package:emanuel_pizzeria/core/failure.dart';
import 'package:emanuel_pizzeria/features/shipping/domain/models/shipping_product.dart';

abstract class ShippingRepository {
  TaskEither<Failure, List<ShippingProduct>> getProducts();
  TaskEither<Failure, List<ShippingCategory>> getCategories();
}
