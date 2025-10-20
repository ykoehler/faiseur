/// BuildContext utility extensions for Faiseur.
///
/// Provides convenient methods for accessing common properties and
/// showing dialogs/snackbars without verbose imports.
library;

import 'package:flutter/material.dart';

/// Extension methods on BuildContext
extension BuildContextExtensions on BuildContext {
  /// Returns MediaQuery data
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns screen size
  Size get screenSize => mediaQuery.size;

  /// Returns screen width
  double get screenWidth => screenSize.width;

  /// Returns screen height
  double get screenHeight => screenSize.height;

  /// Returns device padding (for notch/safe area)
  EdgeInsets get devicePadding => mediaQuery.padding;

  /// Returns device view insets (for keyboard)
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  /// Returns true if device is in landscape
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  /// Returns true if device is in portrait
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  /// Returns true if device is a tablet
  bool get isTablet => screenWidth >= 600;

  /// Returns true if device is a phone
  bool get isPhone => screenWidth < 600;

  /// Returns theme data
  ThemeData get theme => Theme.of(this);

  /// Returns text theme
  TextTheme get textTheme => theme.textTheme;

  /// Returns color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Returns primary color
  Color get primaryColor => colorScheme.primary;

  /// Returns secondary color
  Color get secondaryColor => colorScheme.secondary;

  /// Returns error color
  Color get errorColor => colorScheme.error;

  /// Returns surface color
  Color get surfaceColor => colorScheme.surface;

  /// Returns if dark mode is enabled
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Returns if light mode is enabled
  bool get isLightMode => theme.brightness == Brightness.light;

  /// Returns bottom padding (includes safe area and keyboard)
  double get bottomPadding => devicePadding.bottom + viewInsets.bottom;

  /// Returns top padding (safe area)
  double get topPadding => devicePadding.top;

  /// Pop current route
  void pop<T>([T? result]) => Navigator.pop(this, result);

  /// Shows a snackbar with message
  void showSnackbar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }

  /// Shows an error snackbar
  void showErrorSnackbar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: errorColor,
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }

  /// Shows a success snackbar
  void showSuccessSnackbar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: colorScheme.primary,
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }

  /// Shows a confirmation dialog
  Future<bool> showConfirmationDialog({
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) async =>
      await showDialog<bool>(
        context: this,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(cancelText),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(confirmText),
            ),
          ],
        ),
      ) ??
      false;

  /// Shows an alert dialog
  Future<void> showAlertDialog({
    required String title,
    required String message,
    String buttonText = 'OK',
  }) async =>
      showDialog(
        context: this,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(buttonText),
            ),
          ],
        ),
      );

  /// Shows a loading dialog
  void showLoadingDialog({String message = 'Loading...'}) {
    showDialog<void>(
      context: this,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 16),
            Text(message),
          ],
        ),
      ),
    );
  }

  /// Closes the loading dialog if one is open
  void closeLoadingDialog() {
    Navigator.of(this, rootNavigator: true).pop();
  }

  /// Hides keyboard
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  /// Shows keyboard
  void showKeyboard() {
    FocusScope.of(this).requestFocus(FocusNode());
  }

  /// Returns true if keyboard is visible
  bool get isKeyboardVisible => viewInsets.bottom > 0;

  /// Gets the scaffold messenger state
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Gets the scaffold state
  ScaffoldState get scaffold => Scaffold.of(this);
}
