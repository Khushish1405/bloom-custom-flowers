/// Flower model for the Bloom flower catalog.
class Flower {
  final String id;
  final String name;
  final String imagePath;
  final double pricePerUnit;
  final String unit; // e.g., 'stem', 'bunch'
  final String color;
  final bool isPopular;

  const Flower({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.pricePerUnit,
    this.unit = 'stem',
    this.color = '',
    this.isPopular = false,
  });
}
