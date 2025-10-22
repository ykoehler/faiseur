import 'package:flutter/material.dart';
import 'loading_indicator.dart';

/// A custom elevated button that matches the app's design system.
///
/// Provides loading and disabled states with consistent styling.
class AppButton extends StatelessWidget {
  /// Creates an app button.
  const AppButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.size = AppButtonSize.medium,
    this.fullWidth = false,
    super.key,
  });

  /// Button label text
  final String label;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button is enabled
  final bool isEnabled;

  /// Optional icon to display before the label
  final IconData? icon;

  /// Button size
  final AppButtonSize size;

  /// Whether the button should take full width
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final isDisabled = isLoading || !isEnabled;

    final buttonChild = isLoading
        ? SizedBox(
            height: _getHeight(),
            child: const AppLoadingIndicatorSmall(),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[Icon(icon), const SizedBox(width: 8)],
              Text(label),
            ],
          );

    final button = ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: _getPadding(),
        minimumSize: Size.zero,
      ),
      child: buttonChild,
    );

    return fullWidth ? button : button;
  }

  double _getHeight() {
    switch (size) {
      case AppButtonSize.small:
        return 32;
      case AppButtonSize.medium:
        return 48;
      case AppButtonSize.large:
        return 56;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    }
  }
}

/// A custom outlined button that matches the app's design system.
///
/// Provides loading and disabled states with consistent styling.
class AppOutlinedButton extends StatelessWidget {
  /// Creates an outlined button.
  const AppOutlinedButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.size = AppButtonSize.medium,
    this.fullWidth = false,
    super.key,
  });

  /// Button label text
  final String label;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button is enabled
  final bool isEnabled;

  /// Optional icon to display before the label
  final IconData? icon;

  /// Button size
  final AppButtonSize size;

  /// Whether the button should take full width
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final isDisabled = isLoading || !isEnabled;

    final buttonChild = isLoading
        ? SizedBox(
            height: _getHeight(),
            child: const AppLoadingIndicatorSmall(),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[Icon(icon), const SizedBox(width: 8)],
              Text(label),
            ],
          );

    final button = OutlinedButton(
      onPressed: isDisabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        padding: _getPadding(),
        minimumSize: Size.zero,
      ),
      child: buttonChild,
    );

    return fullWidth ? button : button;
  }

  double _getHeight() {
    switch (size) {
      case AppButtonSize.small:
        return 32;
      case AppButtonSize.medium:
        return 48;
      case AppButtonSize.large:
        return 56;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    }
  }
}

/// A custom text button that matches the app's design system.
class AppTextButton extends StatelessWidget {
  /// Creates a text button.
  const AppTextButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    super.key,
  });

  /// Button label text
  final String label;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button is enabled
  final bool isEnabled;

  /// Optional icon to display before the label
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final isDisabled = isLoading || !isEnabled;

    final buttonChild = isLoading
        ? const AppLoadingIndicatorSmall(size: 16)
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[Icon(icon), const SizedBox(width: 4)],
              Text(label),
            ],
          );

    return TextButton(
      onPressed: isDisabled ? null : onPressed,
      child: buttonChild,
    );
  }
}

/// Button size options
enum AppButtonSize {
  /// Small button (32dp height)
  small,

  /// Medium button (48dp height) - default
  medium,

  /// Large button (56dp height)
  large,
}

/// A floating action button with loading and disabled states.
class AppFloatingActionButton extends StatelessWidget {
  /// Creates a floating action button.
  const AppFloatingActionButton({
    required this.icon,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.tooltip,
    this.heroTag,
    super.key,
  });

  /// Icon to display
  final IconData icon;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button is enabled
  final bool isEnabled;

  /// Tooltip text
  final String? tooltip;

  /// Hero tag for animation
  final Object? heroTag;

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    onPressed: (isLoading || !isEnabled) ? null : onPressed,
    tooltip: tooltip,
    heroTag: heroTag,
    child: isLoading ? const AppLoadingIndicatorSmall(size: 24) : Icon(icon),
  );
}

/// A button row widget for side-by-side buttons.
///
/// Typically used for dialog or bottom sheet actions.
class AppButtonRow extends StatelessWidget {
  /// Creates a button row.
  const AppButtonRow({
    required this.primaryLabel,
    required this.onPrimaryPressed,
    this.secondaryLabel,
    this.onSecondaryPressed,
    this.primaryLoading = false,
    this.secondaryLoading = false,
    super.key,
  });

  /// Primary button label
  final String primaryLabel;

  /// Primary button callback
  final VoidCallback onPrimaryPressed;

  /// Secondary button label
  final String? secondaryLabel;

  /// Secondary button callback
  final VoidCallback? onSecondaryPressed;

  /// Whether primary button is loading
  final bool primaryLoading;

  /// Whether secondary button is loading
  final bool secondaryLoading;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      if (secondaryLabel != null && onSecondaryPressed != null) ...[
        AppTextButton(
          label: secondaryLabel!,
          onPressed: onSecondaryPressed!,
          isLoading: secondaryLoading,
        ),
        const SizedBox(width: 8),
      ],
      AppButton(
        label: primaryLabel,
        onPressed: onPrimaryPressed,
        isLoading: primaryLoading,
      ),
    ],
  );
}
