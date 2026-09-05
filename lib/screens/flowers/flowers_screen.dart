import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// ──────────────────────────────────────────────
/// Flowers Screen — Placeholder
/// ──────────────────────────────────────────────

class FlowersScreen extends StatelessWidget {
  const FlowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PlaceholderScreen(
      icon: Icons.local_florist,
      title: 'Our Flowers',
      subtitle: 'Fresh flowers will be displayed here',
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _PlaceholderScreen({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

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
                color: AppTheme.accentBlush.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: AppTheme.primaryRose, size: 40),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
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
