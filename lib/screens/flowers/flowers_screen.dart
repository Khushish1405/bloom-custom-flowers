import 'package:flutter/material.dart';
import '../../data/flowers.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_navigation.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/flower_card.dart';

class FlowersScreen extends StatelessWidget {
  const FlowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine grid columns based on screen width
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 2;
    if (screenWidth > 1200) {
      crossAxisCount = 4;
    } else if (screenWidth > 800) {
      crossAxisCount = 3;
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.accentBlush.withValues(alpha: 0.3),
                  AppTheme.backgroundCream,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Our Flowers',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Fresh, beautiful blooms available for your custom bouquet.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          
          // Flowers Grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: allFlowers.length,
                  itemBuilder: (context, index) {
                    final flower = allFlowers[index];
                    return FlowerCard(
                      flower: flower,
                      onTap: () {
                        // Redirect to Customize screen
                        AppNavigation.navigateToTab(context, 3);
                      },
                    );
                  },
                ),
              ),
            ),
          ),

          // Bottom CTA
          Container(
            padding: const EdgeInsets.all(40),
            color: AppTheme.accentBlush.withValues(alpha: 0.2),
            child: Column(
              children: [
                Text(
                  'Ready to create your bouquet?',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Build Custom Bouquet',
                  onPressed: () {
                    AppNavigation.navigateToTab(context, 3);
                  },
                  isPrimary: true,
                  icon: Icons.auto_awesome,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
