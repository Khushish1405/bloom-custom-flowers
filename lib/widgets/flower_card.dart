import 'package:flutter/material.dart';
import '../models/flower.dart';
import '../theme/app_theme.dart';

/// ──────────────────────────────────────────────
/// Flower Card — Reusable flower display widget
/// ──────────────────────────────────────────────
/// Will be fully implemented when building the
/// Flowers screen. For now, a basic structure.
/// ──────────────────────────────────────────────

class FlowerCard extends StatelessWidget {
  final Flower flower;
  final VoidCallback? onTap;

  const FlowerCard({
    super.key,
    required this.flower,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.backgroundWhite,
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          border: Border.all(
            color: AppTheme.dividerColor.withValues(alpha: 0.5),
          ),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image placeholder
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppTheme.accentBlush.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.local_florist,
                color: AppTheme.primaryRose,
                size: 32,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              flower.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: AppTheme.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              '₹${flower.pricePerUnit.toStringAsFixed(0)}/${flower.unit}',
              style: const TextStyle(
                fontSize: 13,
                color: AppTheme.primaryRose,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
