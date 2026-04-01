import 'package:fpdart/fpdart.dart';
import '../../../../src/core/failure/failure.dart';

abstract class MenuRepository {
  TaskEither<Failure, List<Map<String, dynamic>>> getMenuCategories();
}
