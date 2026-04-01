// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizzeria_cart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PizzeriaCart)
final pizzeriaCartProvider = PizzeriaCartProvider._();

final class PizzeriaCartProvider
    extends $NotifierProvider<PizzeriaCart, List<CartItem>> {
  PizzeriaCartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pizzeriaCartProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pizzeriaCartHash();

  @$internal
  @override
  PizzeriaCart create() => PizzeriaCart();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CartItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CartItem>>(value),
    );
  }
}

String _$pizzeriaCartHash() => r'21d2acdf0598439368576d737a947bdd31e661fc';

abstract class _$PizzeriaCart extends $Notifier<List<CartItem>> {
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
