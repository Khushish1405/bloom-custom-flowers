import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

/// ──────────────────────────────────────────────
/// Product Card — Reusable bouquet display widget
/// ──────────────────────────────────────────────
/// Will be fully implemented when building the
/// Bouquets screen. For now, a basic structure.
/// ──────────────────────────────────────────────

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onOrder;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onOrder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.cardGradient,
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          border: Border.all(
            color: AppTheme.dividerColor.withValues(alpha: 0.5),
          ),
          boxShadow: AppTheme.cardShadow,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.accentPeach.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.card_giftcard,
                color: AppTheme.primaryRose,
                size: 24,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              product.name,
              style: const TextStyle(
                fontFamily: 'Playfair Display',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Text(
                product.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppTheme.textSecondary,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryRose,
                  ),
                ),
                ElevatedButton(
                  onPressed: onOrder,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text('Order'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
