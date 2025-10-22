/// UI sizing constants for consistent spacing and dimensions throughout the
/// app.
///
/// These values follow Material Design 3 guidelines and ensure a cohesive
/// visual hierarchy across all screens and components.
library;

import 'package:flutter/material.dart';

/// Padding and margin sizes
class AppSpacing {
  AppSpacing._();

  /// Extra small spacing (2dp)
  static const double xs = 2;

  /// Small spacing (4dp)
  static const double sm = 4;

  /// Medium spacing (8dp)
  static const double md = 8;

  /// Large spacing (16dp)
  static const double lg = 16;

  /// Extra large spacing (24dp)
  static const double xl = 24;

  /// Extra extra large spacing (32dp)
  static const double xxl = 32;

  /// Extra extra extra large spacing (48dp)
  static const double xxxl = 48;

  // Convenience groupings for common use cases
  static const double marginHorizontal = lg;
  static const double marginVertical = lg;
  static const double paddingSmall = md;
  static const double paddingMedium = lg;
  static const double paddingLarge = xl;
}

/// Border radius constants for Material Design 3
class AppRadius {
  AppRadius._();

  /// Extra small radius (2dp) - subtle
  static const double xs = 2;

  /// Small radius (4dp)
  static const double sm = 4;

  /// Medium radius (8dp)
  static const double md = 8;

  /// Large radius (12dp)
  static const double lg = 12;

  /// Extra large radius (16dp)
  static const double xl = 16;

  /// Extra extra large radius (28dp) - for large components
  static const double xxl = 28;

  /// Full radius (circular)
  static const double full = 999;
}

/// Icon size constants
class AppIconSize {
  AppIconSize._();

  /// Extra small icon (16dp)
  static const double xs = 16;

  /// Small icon (20dp)
  static const double sm = 20;

  /// Medium icon (24dp)
  static const double md = 24;

  /// Large icon (32dp)
  static const double lg = 32;

  /// Extra large icon (48dp)
  static const double xl = 48;

  /// Extra extra large icon (64dp)
  static const double xxl = 64;

  /// Profile picture size (64dp)
  static const double profilePicture = 64;

  /// Avatar size in lists (32dp)
  static const double avatar = 32;

  /// Small avatar for mentions/tags (24dp)
  static const double avatarSmall = 24;
}

/// Text input and form field constants
class AppInputSize {
  AppInputSize._();

  /// Standard text field height (48dp)
  static const double textFieldHeight = 48;

  /// Small text field height (40dp)
  static const double textFieldHeightSmall = 40;

  /// Large text field height (56dp)
  static const double textFieldHeightLarge = 56;

  /// Standard button height (48dp)
  static const double buttonHeight = 48;

  /// Small button height (40dp)
  static const double buttonHeightSmall = 40;

  /// Standard button padding
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md);

  /// Icon button size (48dp touch target)
  static const double iconButtonSize = 48;
}

/// Card and container sizes
class AppCardSize {
  AppCardSize._();

  /// Standard card elevation (2dp)
  static const double elevation = 2;

  /// Elevated card elevation (8dp)
  static const double elevationElevated = 8;

  /// Standard card padding
  static const double padding = AppSpacing.lg;

  /// Small card padding
  static const double paddingSmall = AppSpacing.md;

  /// List item height
  static const double listItemHeight = 56;

  /// List item with trailing widget
  static const double listItemHeightLarge = 72;

  /// Dialog width on tablets
  static const double dialogWidthTablet = 512;
}

/// Typography sizes (in dp for Flutter)
class AppFontSize {
  AppFontSize._();

  /// Display large (57dp)
  static const double displayLarge = 57;

  /// Display medium (45dp)
  static const double displayMedium = 45;

  /// Display small (36dp)
  static const double displaySmall = 36;

  /// Headline large (32dp)
  static const double headlineLarge = 32;

  /// Headline medium (28dp)
  static const double headlineMedium = 28;

  /// Headline small (24dp)
  static const double headlineSmall = 24;

  /// Title large (22dp)
  static const double titleLarge = 22;

  /// Title medium (16dp)
  static const double titleMedium = 16;

  /// Title small (14dp)
  static const double titleSmall = 14;

  /// Body large (16dp)
  static const double bodyLarge = 16;

  /// Body medium (14dp)
  static const double bodyMedium = 14;

  /// Body small (12dp)
  static const double bodySmall = 12;

  /// Label large (14dp)
  static const double labelLarge = 14;

  /// Label medium (12dp)
  static const double labelMedium = 12;

  /// Label small (11dp)
  static const double labelSmall = 11;
}

/// Divider and separator sizes
class AppDividerSize {
  AppDividerSize._();

  /// Standard divider height (1dp)
  static const double height = 1;

  /// Thick divider (2dp)
  static const double heightThick = 2;

  /// Divider indent from edges
  static const double indent = AppSpacing.lg;
}

/// Animation and transition constants (not durations, just size-related)
class AppMotionSize {
  AppMotionSize._();

  /// Swipe gesture sensitivity
  static const double swipeVelocityThreshold = 500;

  /// Scroll threshold for showing/hiding FAB
  static const double scrollThreshold = 100;
}

/// Responsive breakpoints
class AppBreakpoints {
  AppBreakpoints._();

  /// Mobile device width threshold
  static const double mobile = 600;

  /// Tablet device width threshold
  static const double tablet = 900;

  /// Desktop device width threshold
  static const double desktop = 1200;

  /// Large desktop width threshold
  static const double largeDesktop = 1600;
}
