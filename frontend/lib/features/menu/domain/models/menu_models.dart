import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_models.freezed.dart';
part 'menu_models.g.dart';

@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String name,
    @Default(0.0) double price,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}

enum ProductType { local, shipping }
enum ServiceType { atTable, takeaway, both }

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String name,
    required String description,
    required double basePrice,
    required String image,
    @Default(5.0) double rating,
    required List<String> allergens,
    required List<Ingredient> baseIngredients,
    @Default([]) List<Ingredient> extraOptions,
    @Default(false) bool isBestSeller,
    @Default(false) bool isVeg,
    @Default(false) bool isHot,
    @Default(ProductType.local) ProductType type,
    @Default(ServiceType.both) ServiceType serviceType,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    @Default(1) int quantity,
    @Default([]) List<String> removedIngredients,
    @Default([]) List<Ingredient> addedExtras,
  }) = _CartItem;

  const CartItem._();

  double get totalPrice {
    double extrasPrice = addedExtras.fold(0.0, (sum, item) => sum + item.price);
    return (product.basePrice + extrasPrice) * quantity;
  }
}
