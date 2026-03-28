// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableModel _$TableModelFromJson(Map<String, dynamic> json) => _TableModel(
  id: (json['id'] as num).toInt(),
  isBooked: json['isBooked'] as bool? ?? false,
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
);

Map<String, dynamic> _$TableModelToJson(_TableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isBooked': instance.isBooked,
      'x': instance.x,
      'y': instance.y,
    };

_BookingReservation _$BookingReservationFromJson(Map<String, dynamic> json) =>
    _BookingReservation(
      name: json['name'] as String,
      phone: json['phone'] as String,
      guests: (json['guests'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      time: json['time'] as String,
      tableId: (json['tableId'] as num).toInt(),
    );

Map<String, dynamic> _$BookingReservationToJson(_BookingReservation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'guests': instance.guests,
      'date': instance.date.toIso8601String(),
      'time': instance.time,
      'tableId': instance.tableId,
    };
