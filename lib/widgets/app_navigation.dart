import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/home/home_screen.dart';
import '../screens/flowers/flowers_screen.dart';
import '../screens/products/products_screen.dart';
import '../screens/customize/customize_screen.dart';
import '../screens/gallery/gallery_screen.dart';
import '../screens/about/about_screen.dart';
import '../screens/contact/contact_screen.dart';

/// ──────────────────────────────────────────────
/// App Navigation — Responsive navigation widget
/// ──────────────────────────────────────────────
/// Desktop: Top navigation bar
/// Mobile/Tablet: Hamburger menu with drawer
/// ──────────────────────────────────────────────

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  /// Navigate to a specific tab index from anywhere in the widget tree.
  static void navigateToTab(BuildContext context, int index) {
    final state = context.findAncestorStateOfType<AppNavigationState>();
    state?.selectTab(index);
  }

  @override
  State<AppNavigation> createState() => AppNavigationState();
}

class AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;

  void selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<_NavItem> _navItems = [
    _NavItem('Home', Icons.home_outlined, Icons.home),
    _NavItem('Flowers', Icons.local_florist_outlined, Icons.local_florist),
    _NavItem('Bouquets', Icons.card_giftcard_outlined, Icons.card_giftcard),
    _NavItem('Customize', Icons.palette_outlined, Icons.palette),
    _NavItem('Gallery', Icons.photo_library_outlined, Icons.photo_library),
    _NavItem('About', Icons.info_outlined, Icons.info),
    _NavItem('Contact', Icons.phone_outlined, Icons.phone),
  ];

  static const List<Widget> _screens = [
    HomeScreen(),
    FlowersScreen(),
    ProductsScreen(),
    CustomizeScreen(),
    GalleryScreen(),
    AboutScreen(),
    ContactScreen(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;

    return Scaffold(
      appBar: _buildAppBar(isDesktop),
      drawer: isDesktop ? null : _buildDrawer(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_selectedIndex],
      ),
    );
  }

  // ── Desktop App Bar ───────────────────────────
  PreferredSizeWidget _buildAppBar(bool isDesktop) {
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: isDesktop ? 220 : null,
      leading: isDesktop
          ? _buildLogo()
          : Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu_rounded, size: 26),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
      title: isDesktop ? null : _buildLogoCompact(),
      actions: isDesktop
          ? [
              ..._navItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isSelected = _selectedIndex == index;

                // Highlight customize button differently
                if (index == 3) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Center(
                      child: ElevatedButton.icon(
                        onPressed: () => _onItemSelected(index),
                        icon: Icon(
                          isSelected ? item.selectedIcon : item.icon,
                          size: 18,
                        ),
                        label: Text(item.label),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return _buildNavButton(item, index, isSelected);
              }),
              const SizedBox(width: 16),
            ]
          : [
              // Mobile: Customize CTA in app bar
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                  onPressed: () => _onItemSelected(3),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text('Customize'),
                ),
              ),
            ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryRose.withValues(alpha: 0),
                AppTheme.primaryRose.withValues(alpha: 0.15),
                AppTheme.primaryRose.withValues(alpha: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Logo (Desktop) ────────────────────────────
  Widget _buildLogo() {
    return GestureDetector(
      onTap: () => _onItemSelected(0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  gradient: AppTheme.heroGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.local_florist,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Bloom',
                style: TextStyle(
                  fontFamily: 'Playfair Display',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryRose,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Logo (Mobile Compact) ─────────────────────
  Widget _buildLogoCompact() {
    return GestureDetector(
      onTap: () => _onItemSelected(0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              gradient: AppTheme.heroGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.local_florist,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Bloom',
            style: TextStyle(
              fontFamily: 'Playfair Display',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryRose,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  // ── Desktop Nav Button ────────────────────────
  Widget _buildNavButton(_NavItem item, int index, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: TextButton(
        onPressed: () => _onItemSelected(index),
        style: TextButton.styleFrom(
          foregroundColor:
              isSelected ? AppTheme.primaryRose : AppTheme.textSecondary,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
          ),
          backgroundColor: isSelected
              ? AppTheme.primaryRose.withValues(alpha: 0.08)
              : Colors.transparent,
        ),
        child: Text(
          item.label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // ── Mobile Drawer ─────────────────────────────
  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
            decoration: const BoxDecoration(
              gradient: AppTheme.heroGradient,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.local_florist,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Bloom',
                  style: TextStyle(
                    fontFamily: 'Playfair Display',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Custom Flower Bouquets',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withValues(alpha: 0.85),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          // Nav Items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _navItems.length,
              itemBuilder: (context, index) {
                final item = _navItems[index];
                final isSelected = _selectedIndex == index;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  child: ListTile(
                    leading: Icon(
                      isSelected ? item.selectedIcon : item.icon,
                      color: isSelected
                          ? AppTheme.primaryRose
                          : AppTheme.textSecondary,
                      size: 22,
                    ),
                    title: Text(
                      item.label,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected
                            ? AppTheme.primaryRose
                            : AppTheme.textPrimary,
                        fontSize: 15,
                      ),
                    ),
                    selected: isSelected,
                    selectedTileColor:
                        AppTheme.primaryRose.withValues(alpha: 0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppTheme.radiusMedium),
                    ),
                    onTap: () {
                      _onItemSelected(index);
                      Navigator.pop(context); // Close drawer
                    },
                  ),
                );
              },
            ),
          ),

          // Drawer Footer
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '© 2026 Bloom Custom Flowers',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Nav Item Model ────────────────────────────
class _NavItem {
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  const _NavItem(this.label, this.icon, this.selectedIcon);
}
