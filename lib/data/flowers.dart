import '../models/flower.dart';

/// ──────────────────────────────────────────────
/// Static Flower Data — Bloom Custom Flowers
/// ──────────────────────────────────────────────
/// Easy to update: just edit this list to change
/// the flowers available on the website.
/// ──────────────────────────────────────────────

const List<Flower> allFlowers = [
  Flower(
    id: 'red_rose',
    name: 'Red Rose',
    imagePath: 'assets/images/flowers/red_rose.png',
    pricePerUnit: 30,
    unit: 'stem',
    color: 'Red',
    isPopular: true,
  ),
  Flower(
    id: 'white_rose',
    name: 'White Rose',
    imagePath: 'assets/images/flowers/white_rose.png',
    pricePerUnit: 30,
    unit: 'stem',
    color: 'White',
    isPopular: true,
  ),
  Flower(
    id: 'pink_rose',
    name: 'Pink Rose',
    imagePath: 'assets/images/flowers/pink_rose.png',
    pricePerUnit: 30,
    unit: 'stem',
    color: 'Pink',
    isPopular: true,
  ),
  Flower(
    id: 'sunflower',
    name: 'Sunflower',
    imagePath: 'assets/images/flowers/sunflower.png',
    pricePerUnit: 50,
    unit: 'stem',
    color: 'Yellow',
    isPopular: true,
  ),
  Flower(
    id: 'tulip',
    name: 'Tulip',
    imagePath: 'assets/images/flowers/tulip.png',
    pricePerUnit: 60,
    unit: 'stem',
    color: 'Mixed',
    isPopular: false,
  ),
  Flower(
    id: 'lily',
    name: 'Lily',
    imagePath: 'assets/images/flowers/lily.png',
    pricePerUnit: 70,
    unit: 'stem',
    color: 'White',
    isPopular: true,
  ),
  Flower(
    id: 'gerbera',
    name: 'Gerbera',
    imagePath: 'assets/images/flowers/gerbera.png',
    pricePerUnit: 40,
    unit: 'stem',
    color: 'Mixed',
    isPopular: false,
  ),
  Flower(
    id: 'babys_breath',
    name: "Baby's Breath",
    imagePath: 'assets/images/flowers/babys_breath.png',
    pricePerUnit: 25,
    unit: 'bunch',
    color: 'White',
    isPopular: true,
  ),
];
