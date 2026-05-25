import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';

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
          'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=900',
      price: 120,
      rating: 4.7,
      discountPercent: 20,
    ),
    ProductModel(
      id: 'p2',
      name: 'Ceramic Vase',
      categoryId: 'decor',
      imageUrl:
          'https://images.unsplash.com/photo-1612196808214-b7e239e5f7f3?w=900',
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
