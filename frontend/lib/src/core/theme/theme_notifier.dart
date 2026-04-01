import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'app_theme.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeMood extends _$ThemeMood {
  @override
  AppMood build() => AppMood.pizzeria;

  void toggleMood(AppMood mood) {
    if (state != mood) {
      state = mood;
    }
  }
}
