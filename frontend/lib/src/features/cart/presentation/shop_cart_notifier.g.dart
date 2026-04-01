// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_cart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShopCart)
final shopCartProvider = ShopCartProvider._();

final class ShopCartProvider
    extends $NotifierProvider<ShopCart, List<CartItem>> {
  ShopCartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shopCartProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shopCartHash();

  @$internal
  @override
  ShopCart create() => ShopCart();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CartItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CartItem>>(value),
    );
  }
}

String _$shopCartHash() => r'db332de2d850b5402626a0067f055fc4a4165159';

abstract class _$ShopCart extends $Notifier<List<CartItem>> {
  List<CartItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<CartItem>, List<CartItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CartItem>, List<CartItem>>,
              List<CartItem>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
