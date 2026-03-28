// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Cart)
final cartProvider = CartProvider._();

final class CartProvider extends $NotifierProvider<Cart, List<CartItem>> {
  CartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartHash();

  @$internal
  @override
  Cart create() => Cart();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CartItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CartItem>>(value),
    );
  }
}

String _$cartHash() => r'f74800b0cd3b1a999020398828008f7487b5b1b2';

abstract class _$Cart extends $Notifier<List<CartItem>> {
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
