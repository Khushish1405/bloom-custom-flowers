import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Hero Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.accentPeach.withValues(alpha: 0.3),
                  AppTheme.backgroundCream,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                const Icon(Icons.favorite, size: 64, color: AppTheme.primaryRose),
                const SizedBox(height: 24),
                Text(
                  'Our Story',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    'Bloom Custom Flowers started with a simple idea: that every bouquet should be as unique as the person receiving it. We believe in the language of flowers and the joy of handcrafting something special.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // Values Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildValueCard(
                      icon: Icons.eco,
                      title: 'Freshness Guaranteed',
                      description: 'We source our flowers daily to ensure maximum longevity and vibrant colors.',
                    ),
                    _buildValueCard(
                      icon: Icons.handshake,
                      title: 'Personalized Service',
                      description: 'You are in control. Choose your exact flowers, wrapping, and extras.',
                    ),
                    _buildValueCard(
                      icon: Icons.local_shipping,
                      title: 'Careful Delivery',
                      description: 'Delivered safely and securely to your loved ones on your chosen date.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValueCard({required IconData icon, required String title, required String description}) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.accentBlush.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: AppTheme.primaryRose),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
              fontFamily: 'Playfair Display',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
