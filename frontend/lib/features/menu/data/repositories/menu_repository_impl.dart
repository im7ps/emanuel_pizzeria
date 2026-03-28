import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/failure.dart';
import '../../domain/models/menu_models.dart';
import '../../domain/repositories/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  @override
  TaskEither<Failure, List<Map<String, dynamic>>> getMenuCategories() {
    return TaskEither.tryCatch(
      () async {
        // Simulating network delay
        await Future.delayed(const Duration(milliseconds: 500));
        return _mockMenuData;
      },
      (error, stackTrace) => Failure.unknownError(message: error.toString()),
    );
  }

  final List<Map<String, dynamic>> _mockMenuData = [
    {
      'title': 'Le Classiche',
      'image': 'assets/images/homepage/pizza_homepage.jpg',
      'items': [
        const Product(
          name: 'Margherita del Vesuvio',
          description:
              'Pomodoro San Marzano DOP, Mozzarella di Bufala, Basilico Fresco, Olio EVO.',
          basePrice: 8.50,
          image: 'assets/images/homepage/pizza_homepage.jpg',
          rating: 4.9,
          isBestSeller: true,
          isVeg: true,
          allergens: ['Glutine', 'Lattosio'],
          baseIngredients: [
            Ingredient(name: 'Pomodoro San Marzano'),
            Ingredient(name: 'Mozzarella di Bufala'),
            Ingredient(name: 'Basilico'),
          ],
          extraOptions: [
            Ingredient(name: 'Doppia Bufala', price: 2.50),
            Ingredient(name: 'Bordo Ripieno', price: 2.00),
          ],
        ),
      ],
    },
    {
      'title': 'Le Speciali',
      'image': 'assets/images/homepage/san_marzano_homepage.jpg',
      'items': [
        const Product(
          name: 'Pistacchio e Mortadella',
          description:
              'Pesto di Pistacchio, Provola, Mortadella Bologna IGP, Granella di Pistacchio.',
          basePrice: 12.00,
          image: 'assets/images/homepage/san_marzano_homepage.jpg',
          rating: 5.0,
          isBestSeller: true,
          allergens: ['Glutine', 'Lattosio', 'Frutta a guscio'],
          baseIngredients: [
            Ingredient(name: 'Provola di Agerola'),
            Ingredient(name: 'Pesto di Pistacchio'),
            Ingredient(name: 'Mortadella IGP'),
          ],
          extraOptions: [Ingredient(name: 'Stracciatella Puglia', price: 3.00)],
        ),
      ],
    },
  ];
}

final menuRepositoryProvider = Provider<MenuRepository>((ref) {
  return MenuRepositoryImpl();
});
