/// Material Design 3 theme configuration for Faiseur.
///
/// Provides both light and dark theme data following Material Design 3
/// guidelines.
library;

import 'package:flutter/material.dart';

import 'colors.dart';
import 'typography.dart';

/// App theme configuration
class AppTheme {
  AppTheme._();

  /// Creates light theme data
  static ThemeData get lightTheme {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: LightColors.primary,
      onPrimary: LightColors.onPrimary,
      primaryContainer: LightColors.primaryContainer,
      onPrimaryContainer: LightColors.onPrimary,
      secondary: LightColors.secondary,
      onSecondary: LightColors.onSecondary,
      secondaryContainer: LightColors.secondaryContainer,
      onSecondaryContainer: LightColors.secondary,
      tertiary: LightColors.tertiary,
      onTertiary: LightColors.onTertiary,
      tertiaryContainer: LightColors.tertiaryContainer,
      onTertiaryContainer: LightColors.tertiary,
      error: LightColors.error,
      onError: LightColors.onError,
      errorContainer: LightColors.errorContainer,
      onErrorContainer: LightColors.error,
      outline: LightColors.outline,
      outlineVariant: LightColors.outlineVariant,
      surface: LightColors.surface,
      onSurface: LightColors.onSurface,
      surfaceContainerHighest: LightColors.surfaceVariant,
      onSurfaceVariant: LightColors.onSurfaceVariant,
      scrim: Colors.black,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      textTheme: _buildTextTheme(LightColors.onBackground),
      scaffoldBackgroundColor: LightColors.background,
      appBarTheme: _buildAppBarTheme(colorScheme),
      floatingActionButtonTheme: _buildFabTheme(colorScheme),
      cardTheme: _buildCardTheme(colorScheme),
      elevatedButtonTheme: _buildElevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _buildOutlinedButtonTheme(colorScheme),
      textButtonTheme: _buildTextButtonTheme(colorScheme),
      inputDecorationTheme: _buildInputDecorationTheme(colorScheme),
      chipTheme: _buildChipTheme(colorScheme),
      progressIndicatorTheme: _buildProgressIndicatorTheme(colorScheme),
      snackBarTheme: _buildSnackBarTheme(colorScheme),
      dialogTheme: _buildDialogTheme(colorScheme),
      bottomSheetTheme: _buildBottomSheetTheme(colorScheme),
    );
  }

  /// Creates dark theme data
  static ThemeData get darkTheme {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: DarkColors.primary,
      onPrimary: DarkColors.onPrimary,
      primaryContainer: DarkColors.primaryContainer,
      onPrimaryContainer: DarkColors.primary,
      secondary: DarkColors.secondary,
      onSecondary: DarkColors.onSecondary,
      secondaryContainer: DarkColors.secondaryContainer,
      onSecondaryContainer: DarkColors.secondary,
      tertiary: DarkColors.tertiary,
      onTertiary: DarkColors.onTertiary,
      tertiaryContainer: DarkColors.tertiaryContainer,
      onTertiaryContainer: DarkColors.tertiary,
      error: DarkColors.error,
      onError: DarkColors.onError,
      errorContainer: DarkColors.errorContainer,
      onErrorContainer: DarkColors.error,
      outline: DarkColors.outline,
      outlineVariant: DarkColors.outlineVariant,
      surface: DarkColors.surface,
      onSurface: DarkColors.onSurface,
      surfaceContainerHighest: DarkColors.surfaceVariant,
      onSurfaceVariant: DarkColors.onSurfaceVariant,
      scrim: Colors.black,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      textTheme: _buildTextTheme(DarkColors.onBackground),
      scaffoldBackgroundColor: DarkColors.background,
      appBarTheme: _buildAppBarTheme(colorScheme),
      floatingActionButtonTheme: _buildFabTheme(colorScheme),
      cardTheme: _buildCardTheme(colorScheme),
      elevatedButtonTheme: _buildElevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _buildOutlinedButtonTheme(colorScheme),
      textButtonTheme: _buildTextButtonTheme(colorScheme),
      inputDecorationTheme: _buildInputDecorationTheme(colorScheme),
      chipTheme: _buildChipTheme(colorScheme),
      progressIndicatorTheme: _buildProgressIndicatorTheme(colorScheme),
      snackBarTheme: _buildSnackBarTheme(colorScheme),
      dialogTheme: _buildDialogTheme(colorScheme),
      bottomSheetTheme: _buildBottomSheetTheme(colorScheme),
    );
  }

  static TextTheme _buildTextTheme(Color onSurface) => TextTheme(
        displayLarge: AppTypography.displayLarge.copyWith(color: onSurface),
        displayMedium: AppTypography.displayMedium.copyWith(color: onSurface),
        displaySmall: AppTypography.displaySmall.copyWith(color: onSurface),
        headlineLarge: AppTypography.headlineLarge.copyWith(color: onSurface),
        headlineMedium: AppTypography.headlineMedium.copyWith(color: onSurface),
        headlineSmall: AppTypography.headlineSmall.copyWith(color: onSurface),
        titleLarge: AppTypography.titleLarge.copyWith(color: onSurface),
        titleMedium: AppTypography.titleMedium.copyWith(color: onSurface),
        titleSmall: AppTypography.titleSmall.copyWith(color: onSurface),
        bodyLarge: AppTypography.bodyLarge.copyWith(color: onSurface),
        bodyMedium: AppTypography.bodyMedium.copyWith(color: onSurface),
        bodySmall: AppTypography.bodySmall.copyWith(color: onSurface),
        labelLarge: AppTypography.labelLarge.copyWith(color: onSurface),
        labelMedium: AppTypography.labelMedium.copyWith(color: onSurface),
        labelSmall: AppTypography.labelSmall.copyWith(color: onSurface),
      );

  static AppBarTheme _buildAppBarTheme(ColorScheme colorScheme) => AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: colorScheme.onSurface,
        ),
      );

  static FloatingActionButtonThemeData _buildFabTheme(
    ColorScheme colorScheme,
  ) =>
      FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 6,
        highlightElevation: 8,
      );

  static CardThemeData _buildCardTheme(ColorScheme colorScheme) =>
      CardThemeData(
        color: colorScheme.surface,
        shadowColor: colorScheme.scrim,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      );

  static ElevatedButtonThemeData _buildElevatedButtonTheme(
    ColorScheme colorScheme,
  ) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );

  static OutlinedButtonThemeData _buildOutlinedButtonTheme(
    ColorScheme colorScheme,
  ) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outline),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );

  static TextButtonThemeData _buildTextButtonTheme(ColorScheme colorScheme) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      );

  static InputDecorationTheme _buildInputDecorationTheme(
    ColorScheme colorScheme,
  ) =>
      InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      );

  static ChipThemeData _buildChipTheme(ColorScheme colorScheme) =>
      ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        disabledColor: colorScheme.surface,
        selectedColor: colorScheme.primaryContainer,
        labelStyle: TextStyle(color: colorScheme.onSurface),
        secondaryLabelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        brightness: colorScheme.brightness,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );

  static ProgressIndicatorThemeData _buildProgressIndicatorTheme(
    ColorScheme colorScheme,
  ) =>
      ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.surfaceContainerHighest,
        circularTrackColor: colorScheme.surfaceContainerHighest,
      );

  static SnackBarThemeData _buildSnackBarTheme(ColorScheme colorScheme) =>
      SnackBarThemeData(
        backgroundColor: colorScheme.onSurface,
        contentTextStyle: TextStyle(color: colorScheme.surface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );

  static DialogThemeData _buildDialogTheme(ColorScheme colorScheme) =>
      DialogThemeData(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        titleTextStyle: AppTypography.headlineSmall.copyWith(
          color: colorScheme.onSurface,
        ),
      );

  static BottomSheetThemeData _buildBottomSheetTheme(ColorScheme colorScheme) =>
      BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        elevation: 2,
      );
}
