// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeMood)
final themeMoodProvider = ThemeMoodProvider._();

final class ThemeMoodProvider extends $NotifierProvider<ThemeMood, AppMood> {
  ThemeMoodProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeMoodProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeMoodHash();

  @$internal
  @override
  ThemeMood create() => ThemeMood();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppMood value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppMood>(value),
    );
  }
}

String _$themeMoodHash() => r'33056dedca6b72a0a529180e35b7a28fa61ab505';

abstract class _$ThemeMood extends $Notifier<AppMood> {
  AppMood build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppMood, AppMood>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppMood, AppMood>,
              AppMood,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
