import 'package:flutter/material.dart';

void main() {
  runApp(const ProductCatalogSingleFileApp());
}

class ProductCatalogSingleFileApp extends StatelessWidget {
  const ProductCatalogSingleFileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Catalog',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const ProductCatalogScreen(),
    );
  }
}

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

class ProductCatalogScreen extends StatefulWidget {
  const ProductCatalogScreen({super.key});

  @override
  State<ProductCatalogScreen> createState() => _ProductCatalogScreenState();
}

class _ProductCatalogScreenState extends State<ProductCatalogScreen> {
  int selectedCategoryIndex = 0;

  final List<CategoryModel> categories = const [
    CategoryModel(id: 'all', title: 'All'),
    CategoryModel(id: 'furniture', title: 'Furniture'),
    CategoryModel(id: 'decor', title: 'Decor'),
    CategoryModel(id: 'lighting', title: 'Lighting'),
    CategoryModel(id: 'kitchen', title: 'Kitchen'),
  ];

  final List<ProductModel> products = const [
    ProductModel(
      id: 'p1',
      name: 'Vintage Chair',
      categoryId: 'furniture',
      imageUrl:
          'https://images.unsplash.com/photo-1779357995338-a6cf67aac9e4?w=900',
      price: 120,
      rating: 4.7,
      discountPercent: 20,
    ),
    ProductModel(
      id: 'p2',
      name: 'Ceramic Vase',
      categoryId: 'decor',
      imageUrl:
          'https://images.unsplash.com/photo-1597696929736-6d13bed8e6a8?w=900',
      price: 48,
      rating: 4.5,
      discountPercent: 15,
    ),
    ProductModel(
      id: 'p3',
      name: 'Rustic Lamp',
      categoryId: 'lighting',
      imageUrl:
          'https://images.unsplash.com/photo-1513506003901-1e6a229e2d15?w=900',
      price: 89,
      rating: 4.8,
      discountPercent: 25,
    ),
    ProductModel(
      id: 'p4',
      name: 'Wooden Tray',
      categoryId: 'kitchen',
      imageUrl:
          'https://images.unsplash.com/photo-1503602642458-232111445657?w=900',
      price: 35,
      rating: 4.4,
      discountPercent: 10,
    ),
    ProductModel(
      id: 'p5',
      name: 'Linen Sofa',
      categoryId: 'furniture',
      imageUrl:
          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=900',
      price: 420,
      rating: 4.9,
      discountPercent: 18,
    ),
    ProductModel(
      id: 'p6',
      name: 'Wall Art Frame',
      categoryId: 'decor',
      imageUrl:
          'https://images.unsplash.com/photo-1577083552431-6e5fd01aa342?w=900',
      price: 70,
      rating: 4.6,
      discountPercent: 12,
    ),
  ];

  List<ProductModel> get filteredProducts {
    final selectedCategory = categories[selectedCategoryIndex];
    if (selectedCategory.id == 'all') {
      return products;
    }
    return products
        .where((product) => product.categoryId == selectedCategory.id)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE3D2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              const Text(
                'Products',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2D2424),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 44,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryItem(
                      title: category.title,
                      isSelected: selectedCategoryIndex == index,
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final width = constraints.maxWidth;
                        final crossAxisCount = width >= 1000
                            ? 4
                            : width >= 700
                                ? 3
                                : 2;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: width >= 700 ? 0.78 : 0.7,
                          ),
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            return ProductCard(product: filteredProducts[index]);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3C2F2F) : const Color(0xFFF3E9DC),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: const Color(0xFF3C2F2F),
            width: 1.4,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? const Color(0xFFF9F4EC) : const Color(0xFF3C2F2F),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final discountedPrice =
        product.price * ((100 - product.discountPercent) / 100);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9F4EC),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF3C2F2F), width: 1.2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image(
                      image: NetworkImage(product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8A3B2D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '-${product.discountPercent}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
              child: Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2A1F1F),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  const Icon(Icons.star_rounded, size: 16, color: Color(0xFFE2A400)),
                  const SizedBox(width: 4),
                  Text(
                    product.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6A5656),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
              child: Row(
                children: [
                  Text(
                    '\$${discountedPrice.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF8A3B2D),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: Color(0xFF8F7F7F),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
