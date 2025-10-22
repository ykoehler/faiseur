/// Material Design 3 typography system for Faiseur.
///
/// Defines the text styles used throughout the application following
/// Material Design 3 guidelines.
library;

import 'package:flutter/material.dart';

/// Typography configuration for the app
class AppTypography {
  AppTypography._();

  /// Font family for the app
  static const String fontFamily = 'Roboto';

  /// Creates light text style
  static TextStyle _buildTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required double lineHeight,
    Color? color,
    TextDecoration? decoration,
  }) => TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: lineHeight / fontSize,
    letterSpacing: _getLetterSpacing(fontSize),
    color: color,
    decoration: decoration,
    fontFamily: fontFamily,
  );

  /// Calculates letter spacing based on font size per Material Design 3
  static double _getLetterSpacing(double fontSize) {
    if (fontSize <= 12) {
      return 0.5;
    }
    if (fontSize <= 14) {
      return 0.25;
    }
    if (fontSize == 16) {
      return 0.15;
    }
    return 0;
  }

  /// Display Large (57dp)
  static final TextStyle displayLarge = _buildTextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    lineHeight: 64,
  );

  /// Display Medium (45dp)
  static final TextStyle displayMedium = _buildTextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    lineHeight: 52,
  );

  /// Display Small (36dp)
  static final TextStyle displaySmall = _buildTextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    lineHeight: 44,
  );

  /// Headline Large (32dp)
  static final TextStyle headlineLarge = _buildTextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    lineHeight: 40,
  );

  /// Headline Medium (28dp)
  static final TextStyle headlineMedium = _buildTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    lineHeight: 36,
  );

  /// Headline Small (24dp)
  static final TextStyle headlineSmall = _buildTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    lineHeight: 32,
  );

  /// Title Large (22dp)
  static final TextStyle titleLarge = _buildTextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    lineHeight: 28,
  );

  /// Title Medium (16dp)
  static final TextStyle titleMedium = _buildTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    lineHeight: 24,
  );

  /// Title Small (14dp)
  static final TextStyle titleSmall = _buildTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    lineHeight: 20,
  );

  /// Body Large (16dp)
  static final TextStyle bodyLarge = _buildTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    lineHeight: 24,
  );

  /// Body Medium (14dp)
  static final TextStyle bodyMedium = _buildTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    lineHeight: 20,
  );

  /// Body Small (12dp)
  static final TextStyle bodySmall = _buildTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    lineHeight: 16,
  );

  /// Label Large (14dp)
  static final TextStyle labelLarge = _buildTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    lineHeight: 20,
  );

  /// Label Medium (12dp)
  static final TextStyle labelMedium = _buildTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    lineHeight: 16,
  );

  /// Label Small (11dp)
  static final TextStyle labelSmall = _buildTextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    lineHeight: 16,
  );
}
