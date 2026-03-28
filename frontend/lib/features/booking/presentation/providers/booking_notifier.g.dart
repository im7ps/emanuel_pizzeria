// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BookingNotifier)
final bookingProvider = BookingNotifierProvider._();

final class BookingNotifierProvider
    extends $AsyncNotifierProvider<BookingNotifier, List<TableModel>> {
  BookingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookingNotifierHash();

  @$internal
  @override
  BookingNotifier create() => BookingNotifier();
}

String _$bookingNotifierHash() => r'9102cdb20b3a0c182900f0e5619672084863be1b';

abstract class _$BookingNotifier extends $AsyncNotifier<List<TableModel>> {
  FutureOr<List<TableModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<TableModel>>, List<TableModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TableModel>>, List<TableModel>>,
              AsyncValue<List<TableModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
