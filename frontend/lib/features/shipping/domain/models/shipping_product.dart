class ShippingProduct {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String? badge;
  final bool isFresh;
  final int stockQuantity;
  final String categoryId;

  const ShippingProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.badge,
    this.isFresh = false,
    this.stockQuantity = 0,
    required this.categoryId,
  });

  factory ShippingProduct.fromJson(Map<String, dynamic> json) {
    return ShippingProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      badge: json['badge'] as String?,
      isFresh: json['isFresh'] as bool? ?? false,
      stockQuantity: json['stockQuantity'] as int? ?? 0,
      categoryId: json['categoryId'] as String,
    );
  }
}

class ShippingCategory {
  final String id;
  final String name;
  final String? description;

  const ShippingCategory({
    required this.id,
    required this.name,
    this.description,
  });

  factory ShippingCategory.fromJson(Map<String, dynamic> json) {
    return ShippingCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }
}
