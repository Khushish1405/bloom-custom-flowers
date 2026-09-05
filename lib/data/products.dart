import '../models/product.dart';

/// ──────────────────────────────────────────────
/// Static Product Data — Bloom Custom Flowers
/// ──────────────────────────────────────────────
/// Pre-made bouquets. Edit this list to update
/// the bouquet collection on the website.
/// ──────────────────────────────────────────────

const List<Product> allProducts = [
  Product(
    id: 'classic_red',
    name: 'Classic Red',
    imagePath: 'assets/images/bouquets/classic_red.png',
    description:
        'A timeless bouquet of premium red roses, elegantly wrapped in luxury paper. Perfect for expressing love and romance.',
    price: 799,
    category: 'romance',
    tags: ['roses', 'romantic', 'classic'],
    isFeatured: true,
  ),
  Product(
    id: 'pastel_love',
    name: 'Pastel Love',
    imagePath: 'assets/images/bouquets/pastel_love.png',
    description:
        'A delicate arrangement of pastel-colored roses and baby\'s breath. Soft, dreamy, and full of charm.',
    price: 899,
    category: 'romantic',
    tags: ['pastel', 'soft', 'elegant'],
    isFeatured: true,
  ),
  Product(
    id: 'birthday_special',
    name: 'Birthday Special',
    imagePath: 'assets/images/bouquets/birthday_special.png',
    description:
        'A vibrant mix of colorful flowers to brighten any birthday celebration. Comes with a greeting card.',
    price: 999,
    category: 'birthday',
    tags: ['birthday', 'colorful', 'celebration'],
    isFeatured: true,
  ),
  Product(
    id: 'anniversary_special',
    name: 'Anniversary Special',
    imagePath: 'assets/images/bouquets/anniversary_special.png',
    description:
        'A grand arrangement of premium roses and lilies, symbolizing years of love and togetherness.',
    price: 1499,
    category: 'anniversary',
    tags: ['anniversary', 'premium', 'grand'],
    isFeatured: false,
  ),
  Product(
    id: 'premium_rose',
    name: 'Premium Rose Bouquet',
    imagePath: 'assets/images/bouquets/premium_rose.png',
    description:
        'An exquisite bouquet of 25 premium long-stem roses, wrapped in luxury gold paper with satin ribbon.',
    price: 1999,
    category: 'premium',
    tags: ['premium', 'luxury', 'roses', 'grand'],
    isFeatured: true,
  ),
];
