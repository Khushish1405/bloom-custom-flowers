import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ──────────────────────────────────────────────
/// App Theme — Bloom Custom Flowers
/// ──────────────────────────────────────────────
/// Elegant, warm, floral theme using Material 3.
/// Playfair Display for headings, Inter for body.
/// ──────────────────────────────────────────────

class AppTheme {
  AppTheme._();

  // ── Brand Colors ──────────────────────────────
  static const Color primaryRose = Color(0xFFBE3455);
  static const Color primaryRoseDark = Color(0xFF8C1D3D);
  static const Color accentBlush = Color(0xFFF9D1D1);
  static const Color accentPeach = Color(0xFFFCE4D6);
  static const Color backgroundCream = Color(0xFFFFF9F5);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color surfaceWarm = Color(0xFFFFF5EE);
  static const Color textPrimary = Color(0xFF2D1B1E);
  static const Color textSecondary = Color(0xFF6B4C52);
  static const Color textLight = Color(0xFF9E8389);
  static const Color gold = Color(0xFFD4A854);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color whatsappGreen = Color(0xFF25D366);
  static const Color dividerColor = Color(0xFFEDE0E3);

  // ── Gradients ─────────────────────────────────
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFBE3455),
      Color(0xFFD4597A),
      Color(0xFFE8849B),
    ],
  );

  static const LinearGradient softGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFF9F5),
      Color(0xFFFFF0F0),
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFFF5EE),
    ],
  );

  // ── Shadows ───────────────────────────────────
  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: primaryRose.withValues(alpha: 0.08),
          blurRadius: 20,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 12,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: primaryRose.withValues(alpha: 0.04),
          blurRadius: 24,
          offset: const Offset(0, 8),
        ),
      ];

  // ── Border Radius ─────────────────────────────
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;

  // ── Spacing ───────────────────────────────────
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
  static const double spacingHuge = 64.0;

  // ── Content Width ─────────────────────────────
  static const double maxContentWidth = 1200.0;
  static const double maxNarrowWidth = 800.0;

  // ── Theme Data ────────────────────────────────
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primaryRose,
      brightness: Brightness.light,
      primary: primaryRose,
      onPrimary: Colors.white,
      secondary: gold,
      onSecondary: Colors.white,
      surface: backgroundWhite,
      onSurface: textPrimary,
      error: const Color(0xFFD32F2F),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundCream,

      // ── Typography ─────────────────────────────
      textTheme: _buildTextTheme(),

      // ── AppBar ─────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundWhite,
        foregroundColor: textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: false,
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: primaryRose,
          letterSpacing: 0.5,
        ),
      ),

      // ── Elevated Button ────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryRose,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMedium),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),

      // ── Outlined Button ────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryRose,
          side: const BorderSide(color: primaryRose, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMedium),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),

      // ── Text Button ────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryRose,
          textStyle: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ── Card ───────────────────────────────────
      cardTheme: CardThemeData(
        color: backgroundWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLarge),
          side: BorderSide(color: dividerColor.withValues(alpha: 0.5)),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── Input Decoration ───────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: backgroundWhite,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: const BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: const BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: const BorderSide(color: primaryRose, width: 2),
        ),
        labelStyle: GoogleFonts.inter(color: textSecondary),
        hintStyle: GoogleFonts.inter(color: textLight),
      ),

      // ── Chip ───────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: surfaceWarm,
        selectedColor: accentBlush,
        labelStyle: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSmall),
        ),
        side: BorderSide.none,
      ),

      // ── Divider ────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 1,
      ),

      // ── Drawer ─────────────────────────────────
      drawerTheme: const DrawerThemeData(
        backgroundColor: backgroundWhite,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  // ── Text Theme Builder ────────────────────────
  static TextTheme _buildTextTheme() {
    return TextTheme(
      // Display
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 52,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.5,
        height: 1.15,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.3,
        height: 1.2,
      ),
      displaySmall: GoogleFonts.playfairDisplay(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        height: 1.25,
      ),

      // Headline
      headlineLarge: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        height: 1.3,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        height: 1.3,
      ),
      headlineSmall: GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        height: 1.35,
      ),

      // Title
      titleLarge: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        height: 1.4,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        height: 1.4,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        height: 1.4,
      ),

      // Body
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textSecondary,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textSecondary,
        height: 1.5,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textLight,
        height: 1.5,
      ),

      // Label
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0.3,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        letterSpacing: 0.3,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: textLight,
        letterSpacing: 0.5,
      ),
    );
  }
}
