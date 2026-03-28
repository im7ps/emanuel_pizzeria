// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableModel {

 int get id; bool get isBooked; double get x; double get y;
/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableModelCopyWith<TableModel> get copyWith => _$TableModelCopyWithImpl<TableModel>(this as TableModel, _$identity);

  /// Serializes this TableModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableModel&&(identical(other.id, id) || other.id == id)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isBooked,x,y);

@override
String toString() {
  return 'TableModel(id: $id, isBooked: $isBooked, x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class $TableModelCopyWith<$Res>  {
  factory $TableModelCopyWith(TableModel value, $Res Function(TableModel) _then) = _$TableModelCopyWithImpl;
@useResult
$Res call({
 int id, bool isBooked, double x, double y
});




}
/// @nodoc
class _$TableModelCopyWithImpl<$Res>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._self, this._then);

  final TableModel _self;
  final $Res Function(TableModel) _then;

/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isBooked = null,Object? x = null,Object? y = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TableModel].
extension TableModelPatterns on TableModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TableModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TableModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TableModel value)  $default,){
final _that = this;
switch (_that) {
case _TableModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TableModel value)?  $default,){
final _that = this;
switch (_that) {
case _TableModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  bool isBooked,  double x,  double y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TableModel() when $default != null:
return $default(_that.id,_that.isBooked,_that.x,_that.y);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  bool isBooked,  double x,  double y)  $default,) {final _that = this;
switch (_that) {
case _TableModel():
return $default(_that.id,_that.isBooked,_that.x,_that.y);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  bool isBooked,  double x,  double y)?  $default,) {final _that = this;
switch (_that) {
case _TableModel() when $default != null:
return $default(_that.id,_that.isBooked,_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TableModel implements TableModel {
  const _TableModel({required this.id, this.isBooked = false, required this.x, required this.y});
  factory _TableModel.fromJson(Map<String, dynamic> json) => _$TableModelFromJson(json);

@override final  int id;
@override@JsonKey() final  bool isBooked;
@override final  double x;
@override final  double y;

/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TableModelCopyWith<_TableModel> get copyWith => __$TableModelCopyWithImpl<_TableModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TableModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TableModel&&(identical(other.id, id) || other.id == id)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isBooked,x,y);

@override
String toString() {
  return 'TableModel(id: $id, isBooked: $isBooked, x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$TableModelCopyWith<$Res> implements $TableModelCopyWith<$Res> {
  factory _$TableModelCopyWith(_TableModel value, $Res Function(_TableModel) _then) = __$TableModelCopyWithImpl;
@override @useResult
$Res call({
 int id, bool isBooked, double x, double y
});




}
/// @nodoc
class __$TableModelCopyWithImpl<$Res>
    implements _$TableModelCopyWith<$Res> {
  __$TableModelCopyWithImpl(this._self, this._then);

  final _TableModel _self;
  final $Res Function(_TableModel) _then;

/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isBooked = null,Object? x = null,Object? y = null,}) {
  return _then(_TableModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$BookingReservation {

 String get name; String get phone; int get guests; DateTime get date; String get time; int get tableId;
/// Create a copy of BookingReservation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingReservationCopyWith<BookingReservation> get copyWith => _$BookingReservationCopyWithImpl<BookingReservation>(this as BookingReservation, _$identity);

  /// Serializes this BookingReservation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingReservation&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.tableId, tableId) || other.tableId == tableId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,guests,date,time,tableId);

@override
String toString() {
  return 'BookingReservation(name: $name, phone: $phone, guests: $guests, date: $date, time: $time, tableId: $tableId)';
}


}

/// @nodoc
abstract mixin class $BookingReservationCopyWith<$Res>  {
  factory $BookingReservationCopyWith(BookingReservation value, $Res Function(BookingReservation) _then) = _$BookingReservationCopyWithImpl;
@useResult
$Res call({
 String name, String phone, int guests, DateTime date, String time, int tableId
});




}
/// @nodoc
class _$BookingReservationCopyWithImpl<$Res>
    implements $BookingReservationCopyWith<$Res> {
  _$BookingReservationCopyWithImpl(this._self, this._then);

  final BookingReservation _self;
  final $Res Function(BookingReservation) _then;

/// Create a copy of BookingReservation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phone = null,Object? guests = null,Object? date = null,Object? time = null,Object? tableId = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingReservation].
extension BookingReservationPatterns on BookingReservation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingReservation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingReservation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingReservation value)  $default,){
final _that = this;
switch (_that) {
case _BookingReservation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingReservation value)?  $default,){
final _that = this;
switch (_that) {
case _BookingReservation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String phone,  int guests,  DateTime date,  String time,  int tableId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingReservation() when $default != null:
return $default(_that.name,_that.phone,_that.guests,_that.date,_that.time,_that.tableId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String phone,  int guests,  DateTime date,  String time,  int tableId)  $default,) {final _that = this;
switch (_that) {
case _BookingReservation():
return $default(_that.name,_that.phone,_that.guests,_that.date,_that.time,_that.tableId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String phone,  int guests,  DateTime date,  String time,  int tableId)?  $default,) {final _that = this;
switch (_that) {
case _BookingReservation() when $default != null:
return $default(_that.name,_that.phone,_that.guests,_that.date,_that.time,_that.tableId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingReservation implements BookingReservation {
  const _BookingReservation({required this.name, required this.phone, required this.guests, required this.date, required this.time, required this.tableId});
  factory _BookingReservation.fromJson(Map<String, dynamic> json) => _$BookingReservationFromJson(json);

@override final  String name;
@override final  String phone;
@override final  int guests;
@override final  DateTime date;
@override final  String time;
@override final  int tableId;

/// Create a copy of BookingReservation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingReservationCopyWith<_BookingReservation> get copyWith => __$BookingReservationCopyWithImpl<_BookingReservation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingReservationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingReservation&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.tableId, tableId) || other.tableId == tableId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,guests,date,time,tableId);

@override
String toString() {
  return 'BookingReservation(name: $name, phone: $phone, guests: $guests, date: $date, time: $time, tableId: $tableId)';
}


}

/// @nodoc
abstract mixin class _$BookingReservationCopyWith<$Res> implements $BookingReservationCopyWith<$Res> {
  factory _$BookingReservationCopyWith(_BookingReservation value, $Res Function(_BookingReservation) _then) = __$BookingReservationCopyWithImpl;
@override @useResult
$Res call({
 String name, String phone, int guests, DateTime date, String time, int tableId
});




}
/// @nodoc
class __$BookingReservationCopyWithImpl<$Res>
    implements _$BookingReservationCopyWith<$Res> {
  __$BookingReservationCopyWithImpl(this._self, this._then);

  final _BookingReservation _self;
  final $Res Function(_BookingReservation) _then;

/// Create a copy of BookingReservation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = null,Object? guests = null,Object? date = null,Object? time = null,Object? tableId = null,}) {
  return _then(_BookingReservation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
