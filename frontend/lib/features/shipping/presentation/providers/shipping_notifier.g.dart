// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShippingNotifier)
final shippingProvider = ShippingNotifierProvider._();

final class ShippingNotifierProvider
    extends $AsyncNotifierProvider<ShippingNotifier, List<ShippingProduct>> {
  ShippingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shippingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shippingNotifierHash();

  @$internal
  @override
  ShippingNotifier create() => ShippingNotifier();
}

String _$shippingNotifierHash() => r'0909fdc6fb0567b5fe236888800acb58f3ea484c';

abstract class _$ShippingNotifier
    extends $AsyncNotifier<List<ShippingProduct>> {
  FutureOr<List<ShippingProduct>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ShippingProduct>>, List<ShippingProduct>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ShippingProduct>>,
                List<ShippingProduct>
              >,
              AsyncValue<List<ShippingProduct>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
