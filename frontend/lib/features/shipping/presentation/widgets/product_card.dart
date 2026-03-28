import 'package:flutter/material.dart';
import 'package:emanuel_pizzeria/core/theme.dart';
import 'package:emanuel_pizzeria/features/shipping/domain/models/shipping_product.dart';

class ProductCard extends StatelessWidget {
  final ShippingProduct product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Product Info
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: AppTheme.menuTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      style: AppTheme.menuIngredients,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '€ ${product.price.toStringAsFixed(2)}',
                          style: AppTheme.menuPrice,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Add to cart logic
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            minimumSize: Size.zero,
                          ),
                          child: const Icon(Icons.add_shopping_cart, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Badge (Best Seller, Novità, etc.)
          if (product.badge != null)
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: const BoxDecoration(color: AppTheme.accent),
                child: Text(
                  product.badge!.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

          // Fresh Badge
          if (product.isFresh)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.secondary.withValues(alpha: 0.9),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.ac_unit, color: Colors.white, size: 12),
                    SizedBox(width: 4),
                    Text(
                      'FRESCO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
