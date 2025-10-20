/// Material Design 3 color palette for Faiseur.
///
/// Defines all colors used throughout the application to ensure
/// consistency and support for both light and dark themes.

import 'package:flutter/material.dart';

/// Light theme colors
class LightColors {
  LightColors._();

  // Primary colors
  static const Color primary = Color(0xFF6750A4);
  static const Color primaryContainer = Color(0xFFEADDFF);

  // Secondary colors
  static const Color secondary = Color(0xFF625B71);
  static const Color secondaryContainer = Color(0xFFE8DEF8);

  // Tertiary colors
  static const Color tertiary = Color(0xFF7D5260);
  static const Color tertiaryContainer = Color(0xFFFFD8E4);

  // Error colors
  static const Color error = Color(0xFFB3261E);
  static const Color errorContainer = Color(0xFFF9DEDC);

  // Neutral colors
  static const Color outline = Color(0xFF79747E);
  static const Color outlineVariant = Color(0xFFCAC7D0);
  static const Color surface = Color(0xFFFEFBFE);
  static const Color surfaceVariant = Color(0xFFEDE7F6);
  static const Color background = Color(0xFFFEFBFE);

  // Semantic colors
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF0288D1);

  // Text colors
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF1C1B1F);
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color onSurfaceVariant = Color(0xFF49454E);

  // Disabled colors
  static const Color disabledBackground = Color(0xFFE0E0E0);
  static const Color disabledForeground = Color(0xFFBDBDBD);
}

/// Dark theme colors
class DarkColors {
  DarkColors._();

  // Primary colors
  static const Color primary = Color(0xFFD0BCFF);
  static const Color primaryContainer = Color(0xFF4F378B);

  // Secondary colors
  static const Color secondary = Color(0xFFCCC7D0);
  static const Color secondaryContainer = Color(0xFF48454E);

  // Tertiary colors
  static const Color tertiary = Color(0xFFF4B8C8);
  static const Color tertiaryContainer = Color(0xFF633B48);

  // Error colors
  static const Color error = Color(0xFFF2B8B5);
  static const Color errorContainer = Color(0xFF8C1D18);

  // Neutral colors
  static const Color outline = Color(0xFF938F99);
  static const Color outlineVariant = Color(0xFF49454E);
  static const Color surface = Color(0xFF1C1B1F);
  static const Color surfaceVariant = Color(0xFF49454E);
  static const Color background = Color(0xFF1C1B1F);

  // Semantic colors
  static const Color success = Color(0xFF81C784);
  static const Color warning = Color(0xFFFFB74D);
  static const Color info = Color(0xFF4FC3F7);

  // Text colors
  static const Color onPrimary = Color(0xFF381E72);
  static const Color onSecondary = Color(0xFF332D35);
  static const Color onTertiary = Color(0xFF492532);
  static const Color onError = Color(0xFF601410);
  static const Color onBackground = Color(0xFFE6E1E6);
  static const Color onSurface = Color(0xFFE6E1E6);
  static const Color onSurfaceVariant = Color(0xFFCAC7D0);

  // Disabled colors
  static const Color disabledBackground = Color(0xFF424242);
  static const Color disabledForeground = Color(0xFF616161);
}
