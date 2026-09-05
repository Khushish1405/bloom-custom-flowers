import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/whatsapp_helper.dart';
import '../../data/flowers.dart';
import '../../data/products.dart';
import '../../widgets/app_navigation.dart';

/// ──────────────────────────────────────────────
/// Home Screen — Bloom Custom Flowers
/// ──────────────────────────────────────────────

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _HeroSection(),
          _FeaturedFlowersSection(),
          _PopularBouquetsSection(),
          _WhyChooseUsSection(),
          _HowItWorksSection(),
          _CTASection(),
          _FooterSection(),
        ],
      ),
    );
  }
}

// ── Hero Section ────────────────────────────────
class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppTheme.heroGradient,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.05),
              Colors.black.withValues(alpha: 0.15),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 48,
            vertical: isMobile ? 48 : 80,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
              child: Column(
                children: [
                  // Flower icon
                  Container(
                    width: isMobile ? 60 : 80,
                    height: isMobile ? 60 : 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.local_florist,
                      color: Colors.white,
                      size: isMobile ? 32 : 42,
                    ),
                  ),
                  SizedBox(height: isMobile ? 20 : 28),

                  // Heading
                  Text(
                    'Bloom',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: isMobile ? 44 : (isDesktop ? 72 : 56),
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Subheading
                  Text(
                    'Custom Flower Bouquets',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withValues(alpha: 0.9),
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 24),

                  // Description
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 550),
                    child: Text(
                      'Handcrafted bouquets designed with love for your special moments. '
                      'Create your dream bouquet and order through WhatsApp.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withValues(alpha: 0.85),
                        height: 1.6,
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 28 : 40),

                  // CTA Buttons
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to Customize (index 3) via ancestor
                          _navigateToTab(context, 3);
                        },
                        icon: const Icon(Icons.palette, size: 20),
                        label: const Text('Customize Bouquet'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppTheme.primaryRose,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 24 : 32,
                            vertical: isMobile ? 14 : 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusMedium),
                          ),
                          elevation: 0,
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => WhatsAppHelper.openChat(),
                        icon: const Icon(Icons.chat, size: 20),
                        label: const Text('Chat on WhatsApp'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: BorderSide(
                            color: Colors.white.withValues(alpha: 0.6),
                            width: 1.5,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 24 : 32,
                            vertical: isMobile ? 14 : 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusMedium),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Featured Flowers Section ────────────────────
class _FeaturedFlowersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final popularFlowers = allFlowers.where((f) => f.isPopular).toList();

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundWhite,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 40 : 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            children: [
              _SectionHeader(
                title: 'Our Flowers',
                subtitle: 'Fresh, handpicked blooms for every occasion',
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 900
                      ? 4
                      : constraints.maxWidth > 600
                          ? 3
                          : 2;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: popularFlowers.length,
                    itemBuilder: (context, index) {
                      final flower = popularFlowers[index];
                      return _FlowerMiniCard(flower: flower);
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
              TextButton.icon(
                onPressed: () => _navigateToTab(context, 1),
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: const Text('View All Flowers'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Popular Bouquets Section ────────────────────
class _PopularBouquetsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final featured = allProducts.where((p) => p.isFeatured).toList();

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppTheme.softGradient),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 40 : 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            children: [
              _SectionHeader(
                title: 'Popular Bouquets',
                subtitle: 'Our most loved arrangements',
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 900
                      ? 3
                      : constraints.maxWidth > 600
                          ? 2
                          : 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: isMobile ? 1.3 : 1.1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: featured.length,
                    itemBuilder: (context, index) {
                      final product = featured[index];
                      return _BouquetMiniCard(product: product);
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
              TextButton.icon(
                onPressed: () => _navigateToTab(context, 2),
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: const Text('View All Bouquets'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Why Choose Us Section ───────────────────────
class _WhyChooseUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    final reasons = [
      _ReasonData(
        Icons.local_florist,
        'Fresh Flowers',
        'Handpicked daily to ensure freshness and quality',
      ),
      _ReasonData(
        Icons.palette,
        'Custom Designs',
        'Build your dream bouquet exactly the way you want',
      ),
      _ReasonData(
        Icons.delivery_dining,
        'Local Delivery',
        'Fast and careful delivery right to your doorstep',
      ),
      _ReasonData(
        Icons.favorite,
        'Made with Love',
        'Each bouquet is crafted with care and attention',
      ),
    ];

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundWhite,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 40 : 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            children: [
              _SectionHeader(
                title: 'Why Choose Bloom',
                subtitle: 'What makes us special',
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 800
                      ? 4
                      : constraints.maxWidth > 500
                          ? 2
                          : 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: isMobile ? 2.5 : 1.0,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: reasons.length,
                    itemBuilder: (context, index) {
                      final reason = reasons[index];
                      return _ReasonCard(reason: reason, isMobile: isMobile);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── How It Works Section ────────────────────────
class _HowItWorksSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    final steps = [
      _StepData('1', 'Choose Flowers', 'Select from our fresh collection'),
      _StepData('2', 'Customize', 'Add wrapping, extras & a personal message'),
      _StepData('3', 'Order via WhatsApp', 'Send your order with one tap'),
      _StepData('4', 'Receive', 'We deliver your beautiful bouquet'),
    ];

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppTheme.softGradient),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 40 : 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            children: [
              _SectionHeader(
                title: 'How It Works',
                subtitle: 'Ordering is easy — just 4 simple steps',
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 700) {
                    return Row(
                      children: steps.map((step) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: _StepCard(step: step),
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return Column(
                    children: steps.map((step) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _StepCard(step: step, isHorizontal: true),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Final CTA Section ───────────────────────────
class _CTASection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppTheme.heroGradient,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 40 : 56,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.white.withValues(alpha: 0.6),
                size: 36,
              ),
              const SizedBox(height: 16),
              Text(
                'Ready to Create\nYour Dream Bouquet?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Playfair Display',
                  fontSize: isMobile ? 26 : 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Start customizing now or chat with us on WhatsApp',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _navigateToTab(context, 3),
                    icon: const Icon(Icons.palette, size: 20),
                    label: const Text('Customize Bouquet'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.primaryRose,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppTheme.radiusMedium),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => WhatsAppHelper.openChat(),
                    icon: const Icon(Icons.chat, size: 20),
                    label: const Text('WhatsApp Us'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.whatsappGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppTheme.radiusMedium),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Footer Section ──────────────────────────────
class _FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: AppTheme.textPrimary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 32 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            children: [
              // Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_florist,
                    color: AppTheme.accentBlush,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Bloom',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.accentBlush,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Handcrafted bouquets designed with love',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: 24),
              Divider(
                color: Colors.white.withValues(alpha: 0.1),
              ),
              const SizedBox(height: 16),
              Text(
                '© 2026 Bloom Custom Flowers. Made with ❤️ in Ahmedabad',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════
// ── Helper Widgets ────────────────────────────
// ═══════════════════════════════════════════════

class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            color: AppTheme.primaryRose,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

// ── Flower Mini Card ────────────────────────────
class _FlowerMiniCard extends StatelessWidget {
  final dynamic flower;

  const _FlowerMiniCard({required this.flower});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.backgroundWhite,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: Border.all(color: AppTheme.dividerColor.withValues(alpha: 0.5)),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Flower icon placeholder (will use images later)
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppTheme.accentBlush.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.local_florist,
              color: AppTheme.primaryRose,
              size: 28,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            flower.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppTheme.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '₹${flower.pricePerUnit.toStringAsFixed(0)}/${flower.unit}',
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.primaryRose,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Bouquet Mini Card ───────────────────────────
class _BouquetMiniCard extends StatelessWidget {
  final dynamic product;

  const _BouquetMiniCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: Border.all(color: AppTheme.dividerColor.withValues(alpha: 0.5)),
        boxShadow: AppTheme.cardShadow,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Product icon placeholder
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppTheme.accentPeach.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.card_giftcard,
              color: AppTheme.primaryRose,
              size: 22,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            product.name,
            style: const TextStyle(
              fontFamily: 'Playfair Display',
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            product.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.4,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹${product.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryRose,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryRose,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Reason Card ─────────────────────────────────
class _ReasonCard extends StatelessWidget {
  final _ReasonData reason;
  final bool isMobile;

  const _ReasonCard({required this.reason, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceWarm,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.accentBlush,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(reason.icon, color: AppTheme.primaryRose, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    reason.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    reason.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceWarm,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppTheme.accentBlush,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(reason.icon, color: AppTheme.primaryRose, size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            reason.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            reason.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Step Card ───────────────────────────────────
class _StepCard extends StatelessWidget {
  final _StepData step;
  final bool isHorizontal;

  const _StepCard({required this.step, this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    final badge = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        gradient: AppTheme.heroGradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          step.number,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );

    if (isHorizontal) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.backgroundWhite,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Row(
          children: [
            badge,
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    step.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.backgroundWhite,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          badge,
          const SizedBox(height: 16),
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            step.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Data Models (local to home) ─────────────────
class _ReasonData {
  final IconData icon;
  final String title;
  final String description;
  const _ReasonData(this.icon, this.title, this.description);
}

class _StepData {
  final String number;
  final String title;
  final String description;
  const _StepData(this.number, this.title, this.description);
}

// ── Navigation Helper ───────────────────────────
/// Navigates to a specific tab in the parent AppNavigation.
void _navigateToTab(BuildContext context, int index) {
  AppNavigation.navigateToTab(context, index);
}
