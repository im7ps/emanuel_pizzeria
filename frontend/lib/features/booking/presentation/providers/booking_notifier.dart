import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/booking_repository_impl.dart';
import '../../domain/models/booking_models.dart';

part 'booking_notifier.g.dart';

@riverpod
class BookingNotifier extends _$BookingNotifier {
  @override
  FutureOr<List<TableModel>> build() {
    return _fetchTables();
  }

  Future<List<TableModel>> _fetchTables() async {
    final repository = ref.read(bookingRepositoryProvider);
    final result = await repository.getTables().run();
    
    return result.fold(
      (failure) => throw failure.message ?? 'Unknown error',
      (tables) => tables,
    );
  }

  Future<bool> createBooking(BookingReservation reservation) async {
    final repository = ref.read(bookingRepositoryProvider);
    final result = await repository.bookTable(reservation).run();
    
    return result.fold(
      (failure) => false,
      (success) {
        // Optimistic UI or Refresh
        ref.invalidateSelf();
        return true;
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchTables());
  }
}
