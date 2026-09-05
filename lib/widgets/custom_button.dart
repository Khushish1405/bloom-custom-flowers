import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// ──────────────────────────────────────────────
/// Custom Button — Reusable branded button
/// ──────────────────────────────────────────────

enum CustomButtonVariant { primary, secondary, whatsapp, outline }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final CustomButtonVariant variant;
  final bool isFullWidth;
  final double? height;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = CustomButtonVariant.primary,
    this.isFullWidth = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? 50.0;

    switch (variant) {
      case CustomButtonVariant.primary:
        return _buildButton(
          context,
          backgroundColor: AppTheme.primaryRose,
          foregroundColor: Colors.white,
          height: buttonHeight,
        );
      case CustomButtonVariant.secondary:
        return _buildButton(
          context,
          backgroundColor: AppTheme.accentBlush,
          foregroundColor: AppTheme.primaryRose,
          height: buttonHeight,
        );
      case CustomButtonVariant.whatsapp:
        return _buildButton(
          context,
          backgroundColor: AppTheme.whatsappGreen,
          foregroundColor: Colors.white,
          height: buttonHeight,
        );
      case CustomButtonVariant.outline:
        return _buildOutlineButton(context, height: buttonHeight);
    }
  }

  Widget _buildButton(
    BuildContext context, {
    required Color backgroundColor,
    required Color foregroundColor,
    required double height,
  }) {
    final child = icon != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: 20),
            label: Text(label),
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              minimumSize:
                  isFullWidth ? Size(double.infinity, height) : Size(0, height),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              ),
              elevation: 0,
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              minimumSize:
                  isFullWidth ? Size(double.infinity, height) : Size(0, height),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              ),
              elevation: 0,
            ),
            child: Text(label),
          );

    return child;
  }

  Widget _buildOutlineButton(BuildContext context, {required double height}) {
    return icon != null
        ? OutlinedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: 20),
            label: Text(label),
            style: OutlinedButton.styleFrom(
              minimumSize:
                  isFullWidth ? Size(double.infinity, height) : Size(0, height),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              ),
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              minimumSize:
                  isFullWidth ? Size(double.infinity, height) : Size(0, height),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              ),
            ),
            child: Text(label),
          );
  }
}
