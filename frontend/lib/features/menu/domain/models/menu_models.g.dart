// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ingredient _$IngredientFromJson(Map<String, dynamic> json) => _Ingredient(
  name: json['name'] as String,
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$IngredientToJson(_Ingredient instance) =>
    <String, dynamic>{'name': instance.name, 'price': instance.price};

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  name: json['name'] as String,
  description: json['description'] as String,
  basePrice: (json['basePrice'] as num).toDouble(),
  image: json['image'] as String,
  rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
  allergens: (json['allergens'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  baseIngredients: (json['baseIngredients'] as List<dynamic>)
      .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
      .toList(),
  extraOptions:
      (json['extraOptions'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isBestSeller: json['isBestSeller'] as bool? ?? false,
  isVeg: json['isVeg'] as bool? ?? false,
  isHot: json['isHot'] as bool? ?? false,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'basePrice': instance.basePrice,
  'image': instance.image,
  'rating': instance.rating,
  'allergens': instance.allergens,
  'baseIngredients': instance.baseIngredients,
  'extraOptions': instance.extraOptions,
  'isBestSeller': instance.isBestSeller,
  'isVeg': instance.isVeg,
  'isHot': instance.isHot,
};
