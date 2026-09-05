/// Predefined bouquet/product model for the Bloom catalog.
class Product {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final double price;
  final String category; // e.g., 'birthday', 'anniversary', 'premium'
  final List<String> tags;
  final bool isFeatured;

  const Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    this.category = '',
    this.tags = const [],
    this.isFeatured = false,
  });
}
