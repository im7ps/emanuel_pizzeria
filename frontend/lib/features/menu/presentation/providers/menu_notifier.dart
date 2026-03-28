import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/menu_repository_impl.dart';

part 'menu_notifier.g.dart';

@riverpod
class MenuNotifier extends _$MenuNotifier {
  @override
  FutureOr<List<Map<String, dynamic>>> build() {
    return _fetchMenu();
  }

  Future<List<Map<String, dynamic>>> _fetchMenu() async {
    final repository = ref.read(menuRepositoryProvider);
    final result = await repository.getMenuCategories().run();

    return result.fold(
      (failure) => throw failure.message ?? 'Unknown error',
      (data) => data,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchMenu());
  }
}
