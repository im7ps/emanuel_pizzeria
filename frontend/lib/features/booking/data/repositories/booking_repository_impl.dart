import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../src/core/failure/failure.dart';
import '../../domain/models/booking_models.dart';

abstract class BookingRepository {
  TaskEither<Failure, List<TableModel>> getTables();
  TaskEither<Failure, bool> bookTable(BookingReservation reservation);
}

class BookingRepositoryImpl implements BookingRepository {
  @override
  TaskEither<Failure, List<TableModel>> getTables() {
    return TaskEither.tryCatch(() async {
      await Future.delayed(const Duration(milliseconds: 800));
      return _mockTables;
    }, (error, stackTrace) => Failure.unknownError(message: error.toString()));
  }

  @override
  TaskEither<Failure, bool> bookTable(BookingReservation reservation) {
    return TaskEither.tryCatch(() async {
      await Future.delayed(const Duration(seconds: 1));
      // In a real scenario, this would call the API
      return true;
    }, (error, stackTrace) => Failure.unknownError(message: error.toString()));
  }

  final List<TableModel> _mockTables = [
    const TableModel(id: 1, x: 0.25, y: 0.7, isBooked: false),
    const TableModel(id: 2, x: 0.5, y: 0.45, isBooked: true),
    const TableModel(id: 3, x: 0.25, y: 0.2, isBooked: false),
    const TableModel(id: 4, x: 0.75, y: 0.75, isBooked: false),
    const TableModel(id: 5, x: 0.7, y: 0.4, isBooked: true),
    const TableModel(id: 6, x: 0.6, y: 0.75, isBooked: false),
  ];
}

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return BookingRepositoryImpl();
});
