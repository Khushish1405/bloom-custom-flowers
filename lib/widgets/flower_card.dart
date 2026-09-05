import 'package:flutter/material.dart';
import '../models/flower.dart';
import '../theme/app_theme.dart';

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
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Area
            Expanded(
              flex: 3,
              child: Container(
                color: AppTheme.accentBlush.withValues(alpha: 0.2),
                child: Center(
                  child: Icon(
                    Icons.local_florist,
                    size: 48,
                    color: _getColorFromName(flower.color),
                  ),
                ),
              ),
            ),
            // Details Area
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flower.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: AppTheme.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹${flower.pricePerUnit.toStringAsFixed(0)}/${flower.unit}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.primaryRose,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (onTap != null)
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryRose,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red': return Colors.red;
      case 'white': return Colors.grey.shade400;
      case 'pink': return Colors.pink.shade300;
      case 'yellow': return Colors.yellow.shade700;
      default: return AppTheme.primaryRose;
    }
  }
}
