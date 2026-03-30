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
      'title': 'Pizze',
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
        const Product(
          name: 'Diavola Calabra',
          description: 'Pomodoro, Fiordilatte, Nduja di Spilinga, Salame Piccante, Olive Nere.',
          basePrice: 9.50,
          image: 'assets/images/homepage/pizza_homepage.jpg',
          rating: 4.8,
          isHot: true,
          allergens: ['Glutine', 'Lattosio'],
          baseIngredients: [
            Ingredient(name: 'Pomodoro'),
            Ingredient(name: 'Fiordilatte'),
            Ingredient(name: 'Nduja'),
          ],
          extraOptions: [Ingredient(name: 'Cipolla di Tropea', price: 1.00)],
        ),
        const Product(
          name: 'Pistacchio e Mortadella',
          description: 'Pesto di Pistacchio, Provola, Mortadella Bologna IGP, Granella di Pistacchio.',
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
    {
      'title': 'Box',
      'image': 'assets/images/homepage/delivery.jpg',
      'items': [
        const Product(
          name: 'Box Degustazione',
          description: 'Una selezione delle nostre migliori pizze in formato ridotto per assaggiare tutto.',
          basePrice: 25.00,
          image: 'assets/images/homepage/delivery.jpg',
          rating: 4.7,
          allergens: ['Glutine', 'Lattosio'],
          baseIngredients: [Ingredient(name: '4 Mini Pizze'), Ingredient(name: 'Fritti misti')],
          extraOptions: [Ingredient(name: 'Bibita 1.5L', price: 3.00)],
        ),
        const Product(
          name: 'Family Box',
          description: '2 Pizze Classiche + 2 Bibite + Porzione di Patatine Grandi.',
          basePrice: 22.00,
          image: 'assets/images/homepage/delivery.jpg',
          rating: 4.6,
          allergens: ['Glutine', 'Lattosio'],
          baseIngredients: [Ingredient(name: '2 Pizze'), Ingredient(name: 'Patatine')],
          extraOptions: [Ingredient(name: 'Dolce della casa', price: 4.00)],
        ),
        const Product(
          name: 'Single Box',
          description: '1 Pizza + 1 Bibita + 2 Arancini Mignon.',
          basePrice: 13.50,
          image: 'assets/images/homepage/delivery.jpg',
          rating: 4.5,
          allergens: ['Glutine', 'Lattosio'],
          baseIngredients: [Ingredient(name: '1 Pizza'), Ingredient(name: '2 Arancini')],
          extraOptions: [Ingredient(name: 'Birra 33cl', price: 1.50)],
        ),
      ],
    },
    {
      'title': 'Gastronomia',
      'image': 'assets/images/homepage/gastronomy.jpg',
      'items': [
        const Product(
          name: 'Lasagna alla Napoletana',
          description: 'Pasta all\'uovo, ragù di carne, ricotta, provola e parmigiano.',
          basePrice: 10.00,
          image: 'assets/images/homepage/gastronomy.jpg',
          rating: 4.9,
          allergens: ['Glutine', 'Lattosio', 'Uova'],
          baseIngredients: [Ingredient(name: 'Ragù'), Ingredient(name: 'Ricotta')],
          extraOptions: [],
        ),
        const Product(
          name: 'Parmigiana di Melanzane',
          description: 'Melanzane fritte, pomodoro, fiordilatte, parmigiano e basilico.',
          basePrice: 8.00,
          image: 'assets/images/homepage/gastronomy.jpg',
          rating: 4.8,
          isVeg: true,
          allergens: ['Lattosio'],
          baseIngredients: [Ingredient(name: 'Melanzane'), Ingredient(name: 'Pomodoro')],
          extraOptions: [],
        ),
        const Product(
          name: 'Polpette al Sugo',
          description: 'Polpette di manzo cucinate lentamente nel nostro sugo San Marzano.',
          basePrice: 9.00,
          image: 'assets/images/homepage/gastronomy.jpg',
          rating: 4.7,
          allergens: ['Glutine', 'Uova'],
          baseIngredients: [Ingredient(name: 'Carne di Manzo'), Ingredient(name: 'Pomodoro')],
          extraOptions: [],
        ),
      ],
    },
    {
      'title': 'Rosticceria',
      'image': 'assets/images/homepage/rosticceria.jpg',
      'items': [
        const Product(
          name: 'Arancino al Ragù',
          description: 'Riso allo zafferano con cuore di ragù di carne e piselli.',
          basePrice: 3.50,
          image: 'assets/images/homepage/rosticceria.jpg',
          rating: 4.9,
          isBestSeller: true,
          allergens: ['Glutine', 'Lattosio'],
          baseIngredients: [Ingredient(name: 'Riso'), Ingredient(name: 'Ragù')],
          extraOptions: [],
        ),
        const Product(
          name: 'Crocchè di Patate',
          description: 'Patate lesse, prezzemolo, pecorino e cuore di provola filante.',
          basePrice: 2.50,
          image: 'assets/images/homepage/rosticceria.jpg',
          rating: 4.8,
          isVeg: true,
          allergens: ['Glutine', 'Lattosio'],
          baseIngredients: [Ingredient(name: 'Patate'), Ingredient(name: 'Provola')],
          extraOptions: [],
        ),
        const Product(
          name: 'Frittatina di Pasta',
          description: 'Bucatini con besciamella, carne macinata, piselli e pepe.',
          basePrice: 3.50,
          image: 'assets/images/homepage/rosticceria.jpg',
          rating: 4.7,
          allergens: ['Glutine', 'Lattosio'],
          baseIngredients: [Ingredient(name: 'Bucatini'), Ingredient(name: 'Besciamella')],
          extraOptions: [],
        ),
      ],
    },
  ];
}

final menuRepositoryProvider = Provider<MenuRepository>((ref) {
  return MenuRepositoryImpl();
});
