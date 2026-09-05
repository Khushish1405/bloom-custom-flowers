import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// ──────────────────────────────────────────────
/// About Screen — Placeholder
/// ──────────────────────────────────────────────

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppTheme.accentPeach.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.info_outline,
                  color: AppTheme.primaryRose, size: 40),
            ),
            const SizedBox(height: 24),
            Text(
              'About Bloom',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Our story and values will be shared here',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.gold.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '🚧 Coming in next phase',
                style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.gold,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
