import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../features/menu/domain/models/menu_models.dart';

part 'shipping_product.freezed.dart';
part 'shipping_product.g.dart';

@freezed
abstract class ShippingProduct with _$ShippingProduct {
  const factory ShippingProduct({
    required String id,
    required String name,
    required String description,
    required double price,
    required String imageUrl,
    String? badge,
    @Default(false) bool isFresh,
    @Default(0) int stockQuantity,
    required String categoryId,
  }) = _ShippingProduct;

  const ShippingProduct._();

  Product toProduct() {
    return Product(
      name: name,
      description: description,
      basePrice: price,
      image: imageUrl,
      allergens: [],
      baseIngredients: [],
      type: ProductType.shipping,
    );
  }

  factory ShippingProduct.fromJson(Map<String, dynamic> json) =>
      _$ShippingProductFromJson(json);
}

@freezed
abstract class ShippingCategory with _$ShippingCategory {
  const factory ShippingCategory({
    required String id,
    required String name,
    String? description,
  }) = _ShippingCategory;

  factory ShippingCategory.fromJson(Map<String, dynamic> json) =>
      _$ShippingCategoryFromJson(json);
}
