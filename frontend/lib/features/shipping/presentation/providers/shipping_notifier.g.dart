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

String _$shippingNotifierHash() => r'4eabb38748ae97755a2ddc1994c812715a937481';

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

@ProviderFor(shippingCategories)
final shippingCategoriesProvider = ShippingCategoriesProvider._();

final class ShippingCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ShippingCategory>>,
          List<ShippingCategory>,
          FutureOr<List<ShippingCategory>>
        >
    with
        $FutureModifier<List<ShippingCategory>>,
        $FutureProvider<List<ShippingCategory>> {
  ShippingCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shippingCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shippingCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<ShippingCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ShippingCategory>> create(Ref ref) {
    return shippingCategories(ref);
  }
}

String _$shippingCategoriesHash() =>
    r'52a9314faf49f0a4a6d28fdc68e3a620d0faa4a6';
