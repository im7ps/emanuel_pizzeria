import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_models.freezed.dart';
part 'booking_models.g.dart';

@freezed
abstract class TableModel with _$TableModel {
  const factory TableModel({
    required int id,
    @Default(false) bool isBooked,
    required double x,
    required double y,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
}

@freezed
abstract class BookingReservation with _$BookingReservation {
  const factory BookingReservation({
    required String name,
    required String phone,
    required int guests,
    required DateTime date,
    required String time,
    required int tableId,
  }) = _BookingReservation;

  factory BookingReservation.fromJson(Map<String, dynamic> json) =>
      _$BookingReservationFromJson(json);
}
