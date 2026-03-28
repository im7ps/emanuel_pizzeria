// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ingredient {

 String get name; double get price;
/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientCopyWith<Ingredient> get copyWith => _$IngredientCopyWithImpl<Ingredient>(this as Ingredient, _$identity);

  /// Serializes this Ingredient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ingredient&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,price);

@override
String toString() {
  return 'Ingredient(name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class $IngredientCopyWith<$Res>  {
  factory $IngredientCopyWith(Ingredient value, $Res Function(Ingredient) _then) = _$IngredientCopyWithImpl;
@useResult
$Res call({
 String name, double price
});




}
/// @nodoc
class _$IngredientCopyWithImpl<$Res>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._self, this._then);

  final Ingredient _self;
  final $Res Function(Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? price = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Ingredient].
extension IngredientPatterns on Ingredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ingredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ingredient value)  $default,){
final _that = this;
switch (_that) {
case _Ingredient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ingredient value)?  $default,){
final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
return $default(_that.name,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double price)  $default,) {final _that = this;
switch (_that) {
case _Ingredient():
return $default(_that.name,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double price)?  $default,) {final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
return $default(_that.name,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Ingredient implements Ingredient {
  const _Ingredient({required this.name, this.price = 0.0});
  factory _Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

@override final  String name;
@override@JsonKey() final  double price;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientCopyWith<_Ingredient> get copyWith => __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ingredient&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,price);

@override
String toString() {
  return 'Ingredient(name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(_Ingredient value, $Res Function(_Ingredient) _then) = __$IngredientCopyWithImpl;
@override @useResult
$Res call({
 String name, double price
});




}
/// @nodoc
class __$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(this._self, this._then);

  final _Ingredient _self;
  final $Res Function(_Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? price = null,}) {
  return _then(_Ingredient(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$Product {

 String get name; String get description; double get basePrice; String get image; double get rating; List<String> get allergens; List<Ingredient> get baseIngredients; List<Ingredient> get extraOptions; bool get isBestSeller; bool get isVeg; bool get isHot;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.image, image) || other.image == image)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.allergens, allergens)&&const DeepCollectionEquality().equals(other.baseIngredients, baseIngredients)&&const DeepCollectionEquality().equals(other.extraOptions, extraOptions)&&(identical(other.isBestSeller, isBestSeller) || other.isBestSeller == isBestSeller)&&(identical(other.isVeg, isVeg) || other.isVeg == isVeg)&&(identical(other.isHot, isHot) || other.isHot == isHot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,basePrice,image,rating,const DeepCollectionEquality().hash(allergens),const DeepCollectionEquality().hash(baseIngredients),const DeepCollectionEquality().hash(extraOptions),isBestSeller,isVeg,isHot);

@override
String toString() {
  return 'Product(name: $name, description: $description, basePrice: $basePrice, image: $image, rating: $rating, allergens: $allergens, baseIngredients: $baseIngredients, extraOptions: $extraOptions, isBestSeller: $isBestSeller, isVeg: $isVeg, isHot: $isHot)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String name, String description, double basePrice, String image, double rating, List<String> allergens, List<Ingredient> baseIngredients, List<Ingredient> extraOptions, bool isBestSeller, bool isVeg, bool isHot
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? basePrice = null,Object? image = null,Object? rating = null,Object? allergens = null,Object? baseIngredients = null,Object? extraOptions = null,Object? isBestSeller = null,Object? isVeg = null,Object? isHot = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,allergens: null == allergens ? _self.allergens : allergens // ignore: cast_nullable_to_non_nullable
as List<String>,baseIngredients: null == baseIngredients ? _self.baseIngredients : baseIngredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,extraOptions: null == extraOptions ? _self.extraOptions : extraOptions // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,isBestSeller: null == isBestSeller ? _self.isBestSeller : isBestSeller // ignore: cast_nullable_to_non_nullable
as bool,isVeg: null == isVeg ? _self.isVeg : isVeg // ignore: cast_nullable_to_non_nullable
as bool,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  double basePrice,  String image,  double rating,  List<String> allergens,  List<Ingredient> baseIngredients,  List<Ingredient> extraOptions,  bool isBestSeller,  bool isVeg,  bool isHot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.name,_that.description,_that.basePrice,_that.image,_that.rating,_that.allergens,_that.baseIngredients,_that.extraOptions,_that.isBestSeller,_that.isVeg,_that.isHot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  double basePrice,  String image,  double rating,  List<String> allergens,  List<Ingredient> baseIngredients,  List<Ingredient> extraOptions,  bool isBestSeller,  bool isVeg,  bool isHot)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.name,_that.description,_that.basePrice,_that.image,_that.rating,_that.allergens,_that.baseIngredients,_that.extraOptions,_that.isBestSeller,_that.isVeg,_that.isHot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  double basePrice,  String image,  double rating,  List<String> allergens,  List<Ingredient> baseIngredients,  List<Ingredient> extraOptions,  bool isBestSeller,  bool isVeg,  bool isHot)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.name,_that.description,_that.basePrice,_that.image,_that.rating,_that.allergens,_that.baseIngredients,_that.extraOptions,_that.isBestSeller,_that.isVeg,_that.isHot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({required this.name, required this.description, required this.basePrice, required this.image, this.rating = 5.0, required final  List<String> allergens, required final  List<Ingredient> baseIngredients, final  List<Ingredient> extraOptions = const [], this.isBestSeller = false, this.isVeg = false, this.isHot = false}): _allergens = allergens,_baseIngredients = baseIngredients,_extraOptions = extraOptions;
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  String name;
@override final  String description;
@override final  double basePrice;
@override final  String image;
@override@JsonKey() final  double rating;
 final  List<String> _allergens;
@override List<String> get allergens {
  if (_allergens is EqualUnmodifiableListView) return _allergens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allergens);
}

 final  List<Ingredient> _baseIngredients;
@override List<Ingredient> get baseIngredients {
  if (_baseIngredients is EqualUnmodifiableListView) return _baseIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_baseIngredients);
}

 final  List<Ingredient> _extraOptions;
@override@JsonKey() List<Ingredient> get extraOptions {
  if (_extraOptions is EqualUnmodifiableListView) return _extraOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extraOptions);
}

@override@JsonKey() final  bool isBestSeller;
@override@JsonKey() final  bool isVeg;
@override@JsonKey() final  bool isHot;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.image, image) || other.image == image)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other._allergens, _allergens)&&const DeepCollectionEquality().equals(other._baseIngredients, _baseIngredients)&&const DeepCollectionEquality().equals(other._extraOptions, _extraOptions)&&(identical(other.isBestSeller, isBestSeller) || other.isBestSeller == isBestSeller)&&(identical(other.isVeg, isVeg) || other.isVeg == isVeg)&&(identical(other.isHot, isHot) || other.isHot == isHot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,basePrice,image,rating,const DeepCollectionEquality().hash(_allergens),const DeepCollectionEquality().hash(_baseIngredients),const DeepCollectionEquality().hash(_extraOptions),isBestSeller,isVeg,isHot);

@override
String toString() {
  return 'Product(name: $name, description: $description, basePrice: $basePrice, image: $image, rating: $rating, allergens: $allergens, baseIngredients: $baseIngredients, extraOptions: $extraOptions, isBestSeller: $isBestSeller, isVeg: $isVeg, isHot: $isHot)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, double basePrice, String image, double rating, List<String> allergens, List<Ingredient> baseIngredients, List<Ingredient> extraOptions, bool isBestSeller, bool isVeg, bool isHot
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? basePrice = null,Object? image = null,Object? rating = null,Object? allergens = null,Object? baseIngredients = null,Object? extraOptions = null,Object? isBestSeller = null,Object? isVeg = null,Object? isHot = null,}) {
  return _then(_Product(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,allergens: null == allergens ? _self._allergens : allergens // ignore: cast_nullable_to_non_nullable
as List<String>,baseIngredients: null == baseIngredients ? _self._baseIngredients : baseIngredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,extraOptions: null == extraOptions ? _self._extraOptions : extraOptions // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,isBestSeller: null == isBestSeller ? _self.isBestSeller : isBestSeller // ignore: cast_nullable_to_non_nullable
as bool,isVeg: null == isVeg ? _self.isVeg : isVeg // ignore: cast_nullable_to_non_nullable
as bool,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$CartItem {

 Product get product; int get quantity; List<String> get removedIngredients; List<Ingredient> get addedExtras;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemCopyWith<CartItem> get copyWith => _$CartItemCopyWithImpl<CartItem>(this as CartItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItem&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.removedIngredients, removedIngredients)&&const DeepCollectionEquality().equals(other.addedExtras, addedExtras));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,const DeepCollectionEquality().hash(removedIngredients),const DeepCollectionEquality().hash(addedExtras));

@override
String toString() {
  return 'CartItem(product: $product, quantity: $quantity, removedIngredients: $removedIngredients, addedExtras: $addedExtras)';
}


}

/// @nodoc
abstract mixin class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) _then) = _$CartItemCopyWithImpl;
@useResult
$Res call({
 Product product, int quantity, List<String> removedIngredients, List<Ingredient> addedExtras
});


$ProductCopyWith<$Res> get product;

}
/// @nodoc
class _$CartItemCopyWithImpl<$Res>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._self, this._then);

  final CartItem _self;
  final $Res Function(CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? quantity = null,Object? removedIngredients = null,Object? addedExtras = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,removedIngredients: null == removedIngredients ? _self.removedIngredients : removedIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,addedExtras: null == addedExtras ? _self.addedExtras : addedExtras // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,
  ));
}
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res> get product {
  
  return $ProductCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartItem].
extension CartItemPatterns on CartItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItem value)  $default,){
final _that = this;
switch (_that) {
case _CartItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItem value)?  $default,){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Product product,  int quantity,  List<String> removedIngredients,  List<Ingredient> addedExtras)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.product,_that.quantity,_that.removedIngredients,_that.addedExtras);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Product product,  int quantity,  List<String> removedIngredients,  List<Ingredient> addedExtras)  $default,) {final _that = this;
switch (_that) {
case _CartItem():
return $default(_that.product,_that.quantity,_that.removedIngredients,_that.addedExtras);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Product product,  int quantity,  List<String> removedIngredients,  List<Ingredient> addedExtras)?  $default,) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.product,_that.quantity,_that.removedIngredients,_that.addedExtras);case _:
  return null;

}
}

}

/// @nodoc


class _CartItem extends CartItem {
  const _CartItem({required this.product, this.quantity = 1, final  List<String> removedIngredients = const [], final  List<Ingredient> addedExtras = const []}): _removedIngredients = removedIngredients,_addedExtras = addedExtras,super._();
  

@override final  Product product;
@override@JsonKey() final  int quantity;
 final  List<String> _removedIngredients;
@override@JsonKey() List<String> get removedIngredients {
  if (_removedIngredients is EqualUnmodifiableListView) return _removedIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_removedIngredients);
}

 final  List<Ingredient> _addedExtras;
@override@JsonKey() List<Ingredient> get addedExtras {
  if (_addedExtras is EqualUnmodifiableListView) return _addedExtras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addedExtras);
}


/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemCopyWith<_CartItem> get copyWith => __$CartItemCopyWithImpl<_CartItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItem&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._removedIngredients, _removedIngredients)&&const DeepCollectionEquality().equals(other._addedExtras, _addedExtras));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,const DeepCollectionEquality().hash(_removedIngredients),const DeepCollectionEquality().hash(_addedExtras));

@override
String toString() {
  return 'CartItem(product: $product, quantity: $quantity, removedIngredients: $removedIngredients, addedExtras: $addedExtras)';
}


}

/// @nodoc
abstract mixin class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) _then) = __$CartItemCopyWithImpl;
@override @useResult
$Res call({
 Product product, int quantity, List<String> removedIngredients, List<Ingredient> addedExtras
});


@override $ProductCopyWith<$Res> get product;

}
/// @nodoc
class __$CartItemCopyWithImpl<$Res>
    implements _$CartItemCopyWith<$Res> {
  __$CartItemCopyWithImpl(this._self, this._then);

  final _CartItem _self;
  final $Res Function(_CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? quantity = null,Object? removedIngredients = null,Object? addedExtras = null,}) {
  return _then(_CartItem(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,removedIngredients: null == removedIngredients ? _self._removedIngredients : removedIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,addedExtras: null == addedExtras ? _self._addedExtras : addedExtras // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,
  ));
}

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res> get product {
  
  return $ProductCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
