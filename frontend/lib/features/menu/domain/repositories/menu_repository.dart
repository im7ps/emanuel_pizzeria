import 'package:fpdart/fpdart.dart';
import '../../../../core/failure.dart';

abstract class MenuRepository {
  TaskEither<Failure, List<Map<String, dynamic>>> getMenuCategories();
}
