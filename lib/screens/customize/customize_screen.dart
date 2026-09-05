import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// ──────────────────────────────────────────────
/// Customize Screen — Placeholder
/// ──────────────────────────────────────────────

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({super.key});

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
                gradient: AppTheme.heroGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.palette, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 24),
            Text(
              'Custom Bouquet Builder',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Build your dream bouquet — coming soon!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.primaryRose.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '⭐ Most important feature — next phase',
                style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.primaryRose,
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
