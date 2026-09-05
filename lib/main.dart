import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/app_navigation.dart';

/// ──────────────────────────────────────────────
/// Bloom — Custom Flower Bouquets
/// ──────────────────────────────────────────────
/// Main entry point for the Flutter Web application.
/// ──────────────────────────────────────────────

void main() {
  runApp(const BloomApp());
}

class BloomApp extends StatelessWidget {
  const BloomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloom — Custom Flower Bouquets',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AppNavigation(),
    );
  }
}
