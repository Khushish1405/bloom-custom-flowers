import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/whatsapp_helper.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Contact Us',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'We would love to hear from you.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          
          // Contact Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  children: [
                    _buildContactCard(
                      icon: Icons.chat,
                      title: 'Chat with us',
                      subtitle: 'We reply within minutes on WhatsApp.',
                      buttonText: 'Open WhatsApp',
                      onTap: () => WhatsAppHelper.openChat(),
                      isPrimary: true,
                    ),
                    const SizedBox(height: 24),
                    _buildContactCard(
                      icon: Icons.phone,
                      title: 'Call us',
                      subtitle: 'Available Mon-Sat, 9am to 7pm.',
                      buttonText: '+91 95866 69463',
                      onTap: () {},
                      isPrimary: false,
                    ),
                    const SizedBox(height: 24),
                    _buildContactCard(
                      icon: Icons.location_on,
                      title: 'Visit our studio',
                      subtitle: '123 Floral Street, Blooming City',
                      buttonText: 'Get Directions',
                      onTap: () {},
                      isPrimary: false,
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

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onTap,
    required bool isPrimary,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.dividerColor.withValues(alpha: 0.5)),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isPrimary ? AppTheme.whatsappGreen.withValues(alpha: 0.1) : AppTheme.accentBlush.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: isPrimary ? AppTheme.whatsappGreen : AppTheme.primaryRose),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: AppTheme.textSecondary),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: isPrimary ? AppTheme.whatsappGreen : AppTheme.backgroundCream,
              foregroundColor: isPrimary ? Colors.white : AppTheme.primaryRose,
              elevation: 0,
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
