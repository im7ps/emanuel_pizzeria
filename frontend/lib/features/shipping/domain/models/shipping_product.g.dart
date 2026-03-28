// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShippingProduct _$ShippingProductFromJson(Map<String, dynamic> json) =>
    _ShippingProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      badge: json['badge'] as String?,
      isFresh: json['isFresh'] as bool? ?? false,
      stockQuantity: (json['stockQuantity'] as num?)?.toInt() ?? 0,
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$ShippingProductToJson(_ShippingProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'badge': instance.badge,
      'isFresh': instance.isFresh,
      'stockQuantity': instance.stockQuantity,
      'categoryId': instance.categoryId,
    };

_ShippingCategory _$ShippingCategoryFromJson(Map<String, dynamic> json) =>
    _ShippingCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ShippingCategoryToJson(_ShippingCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
