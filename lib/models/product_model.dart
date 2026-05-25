class CategoryModel {
  final String id;
  final String title;

  const CategoryModel({
    required this.id,
    required this.title,
  });
}

class ProductModel {
  final String id;
  final String name;
  final String categoryId;
  final String imageUrl;
  final double price;
  final double rating;
  final int discountPercent;

  const ProductModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.discountPercent,
  });
}
