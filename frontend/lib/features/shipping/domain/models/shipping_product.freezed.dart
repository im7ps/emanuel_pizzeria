// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShippingProduct {

 String get id; String get name; String get description; double get price; String get imageUrl; String? get badge; bool get isFresh; int get stockQuantity; String get categoryId;
/// Create a copy of ShippingProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingProductCopyWith<ShippingProduct> get copyWith => _$ShippingProductCopyWithImpl<ShippingProduct>(this as ShippingProduct, _$identity);

  /// Serializes this ShippingProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.isFresh, isFresh) || other.isFresh == isFresh)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,imageUrl,badge,isFresh,stockQuantity,categoryId);

@override
String toString() {
  return 'ShippingProduct(id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, badge: $badge, isFresh: $isFresh, stockQuantity: $stockQuantity, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $ShippingProductCopyWith<$Res>  {
  factory $ShippingProductCopyWith(ShippingProduct value, $Res Function(ShippingProduct) _then) = _$ShippingProductCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, double price, String imageUrl, String? badge, bool isFresh, int stockQuantity, String categoryId
});




}
/// @nodoc
class _$ShippingProductCopyWithImpl<$Res>
    implements $ShippingProductCopyWith<$Res> {
  _$ShippingProductCopyWithImpl(this._self, this._then);

  final ShippingProduct _self;
  final $Res Function(ShippingProduct) _then;

/// Create a copy of ShippingProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? imageUrl = null,Object? badge = freezed,Object? isFresh = null,Object? stockQuantity = null,Object? categoryId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,isFresh: null == isFresh ? _self.isFresh : isFresh // ignore: cast_nullable_to_non_nullable
as bool,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ShippingProduct].
extension ShippingProductPatterns on ShippingProduct {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingProduct() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingProduct value)  $default,){
final _that = this;
switch (_that) {
case _ShippingProduct():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingProduct value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingProduct() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double price,  String imageUrl,  String? badge,  bool isFresh,  int stockQuantity,  String categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingProduct() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl,_that.badge,_that.isFresh,_that.stockQuantity,_that.categoryId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double price,  String imageUrl,  String? badge,  bool isFresh,  int stockQuantity,  String categoryId)  $default,) {final _that = this;
switch (_that) {
case _ShippingProduct():
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl,_that.badge,_that.isFresh,_that.stockQuantity,_that.categoryId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  double price,  String imageUrl,  String? badge,  bool isFresh,  int stockQuantity,  String categoryId)?  $default,) {final _that = this;
switch (_that) {
case _ShippingProduct() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl,_that.badge,_that.isFresh,_that.stockQuantity,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShippingProduct extends ShippingProduct {
  const _ShippingProduct({required this.id, required this.name, required this.description, required this.price, required this.imageUrl, this.badge, this.isFresh = false, this.stockQuantity = 0, required this.categoryId}): super._();
  factory _ShippingProduct.fromJson(Map<String, dynamic> json) => _$ShippingProductFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  double price;
@override final  String imageUrl;
@override final  String? badge;
@override@JsonKey() final  bool isFresh;
@override@JsonKey() final  int stockQuantity;
@override final  String categoryId;

/// Create a copy of ShippingProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingProductCopyWith<_ShippingProduct> get copyWith => __$ShippingProductCopyWithImpl<_ShippingProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.isFresh, isFresh) || other.isFresh == isFresh)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,imageUrl,badge,isFresh,stockQuantity,categoryId);

@override
String toString() {
  return 'ShippingProduct(id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, badge: $badge, isFresh: $isFresh, stockQuantity: $stockQuantity, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$ShippingProductCopyWith<$Res> implements $ShippingProductCopyWith<$Res> {
  factory _$ShippingProductCopyWith(_ShippingProduct value, $Res Function(_ShippingProduct) _then) = __$ShippingProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, double price, String imageUrl, String? badge, bool isFresh, int stockQuantity, String categoryId
});




}
/// @nodoc
class __$ShippingProductCopyWithImpl<$Res>
    implements _$ShippingProductCopyWith<$Res> {
  __$ShippingProductCopyWithImpl(this._self, this._then);

  final _ShippingProduct _self;
  final $Res Function(_ShippingProduct) _then;

/// Create a copy of ShippingProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? imageUrl = null,Object? badge = freezed,Object? isFresh = null,Object? stockQuantity = null,Object? categoryId = null,}) {
  return _then(_ShippingProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,isFresh: null == isFresh ? _self.isFresh : isFresh // ignore: cast_nullable_to_non_nullable
as bool,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ShippingCategory {

 String get id; String get name; String? get description;
/// Create a copy of ShippingCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingCategoryCopyWith<ShippingCategory> get copyWith => _$ShippingCategoryCopyWithImpl<ShippingCategory>(this as ShippingCategory, _$identity);

  /// Serializes this ShippingCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'ShippingCategory(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ShippingCategoryCopyWith<$Res>  {
  factory $ShippingCategoryCopyWith(ShippingCategory value, $Res Function(ShippingCategory) _then) = _$ShippingCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description
});




}
/// @nodoc
class _$ShippingCategoryCopyWithImpl<$Res>
    implements $ShippingCategoryCopyWith<$Res> {
  _$ShippingCategoryCopyWithImpl(this._self, this._then);

  final ShippingCategory _self;
  final $Res Function(ShippingCategory) _then;

/// Create a copy of ShippingCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShippingCategory].
extension ShippingCategoryPatterns on ShippingCategory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingCategory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingCategory value)  $default,){
final _that = this;
switch (_that) {
case _ShippingCategory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingCategory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingCategory() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _ShippingCategory():
return $default(_that.id,_that.name,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _ShippingCategory() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShippingCategory implements ShippingCategory {
  const _ShippingCategory({required this.id, required this.name, this.description});
  factory _ShippingCategory.fromJson(Map<String, dynamic> json) => _$ShippingCategoryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;

/// Create a copy of ShippingCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingCategoryCopyWith<_ShippingCategory> get copyWith => __$ShippingCategoryCopyWithImpl<_ShippingCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'ShippingCategory(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ShippingCategoryCopyWith<$Res> implements $ShippingCategoryCopyWith<$Res> {
  factory _$ShippingCategoryCopyWith(_ShippingCategory value, $Res Function(_ShippingCategory) _then) = __$ShippingCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description
});




}
/// @nodoc
class __$ShippingCategoryCopyWithImpl<$Res>
    implements _$ShippingCategoryCopyWith<$Res> {
  __$ShippingCategoryCopyWithImpl(this._self, this._then);

  final _ShippingCategory _self;
  final $Res Function(_ShippingCategory) _then;

/// Create a copy of ShippingCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,}) {
  return _then(_ShippingCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
