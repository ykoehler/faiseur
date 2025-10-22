import 'package:flutter/material.dart';

/// A custom dialog widget that matches the app's design system.
///
/// Provides a consistent dialog appearance with title, content, and actions.
class AppDialog extends StatelessWidget {
  /// Creates an app dialog.
  const AppDialog({
    required this.title,
    required this.content,
    this.actions,
    this.icon,
    super.key,
  });

  /// Dialog title
  final String title;

  /// Dialog content
  final String content;

  /// Dialog actions (buttons)
  final List<AppDialogAction>? actions;

  /// Optional icon to display at the top
  final IconData? icon;

  @override
  Widget build(BuildContext context) => AlertDialog(
    icon: icon != null ? Icon(icon, size: 32) : null,
    title: Text(title),
    content: Text(content),
    actions: _buildActions(context),
    contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
    actionsPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  );

  List<Widget> _buildActions(BuildContext context) {
    if (actions == null || actions!.isEmpty) {
      return [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ];
    }

    return actions!
        .map(
          (action) => TextButton(
            onPressed: () {
              action.onPressed?.call();
              Navigator.of(context).pop(action.value);
            },
            child: Text(action.label),
          ),
        )
        .toList();
  }
}

/// An action for use in dialogs.
class AppDialogAction {
  /// Creates a dialog action.
  AppDialogAction({required this.label, this.onPressed, this.value});

  /// Action label
  final String label;

  /// Callback when action is pressed
  final VoidCallback? onPressed;

  /// Value to return when action is pressed
  final dynamic value;
}

/// A confirmation dialog.
///
/// Shows a message and asks user to confirm or cancel.
class AppConfirmationDialog extends StatelessWidget {
  /// Creates a confirmation dialog.
  const AppConfirmationDialog({
    required this.title,
    required this.message,
    this.confirmLabel = 'Confirm',
    this.cancelLabel = 'Cancel',
    this.isDangerous = false,
    super.key,
  });

  /// Dialog title
  final String title;

  /// Dialog message
  final String message;

  /// Confirm button label
  final String confirmLabel;

  /// Cancel button label
  final String cancelLabel;

  /// Whether this is a dangerous action (changes button color)
  final bool isDangerous;

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(false),
        child: Text(cancelLabel),
      ),
      ElevatedButton(
        style: isDangerous
            ? ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              )
            : null,
        onPressed: () => Navigator.of(context).pop(true),
        child: Text(confirmLabel),
      ),
    ],
  );
}

/// A dialog with custom content widget.
class AppCustomDialog extends StatelessWidget {
  /// Creates a custom dialog.
  const AppCustomDialog({
    required this.content,
    this.title,
    this.actions,
    this.icon,
    this.insetPadding = const EdgeInsets.symmetric(
      horizontal: 40,
      vertical: 24,
    ),
    super.key,
  });

  /// Dialog title
  final String? title;

  /// Dialog content widget
  final Widget content;

  /// Dialog actions
  final List<Widget>? actions;

  /// Optional icon
  final IconData? icon;

  /// Inset padding
  final EdgeInsets insetPadding;

  @override
  Widget build(BuildContext context) => Dialog(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 32),
              const SizedBox(height: 16),
            ],
            if (title != null) ...[
              Text(
                title!,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],
            content,
            if (actions != null) ...[
              const SizedBox(height: 24),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: actions!),
            ],
          ],
        ),
      ),
    ),
  );
}

/// A dialog with loading state.
class AppLoadingDialog extends StatelessWidget {
  /// Creates a loading dialog.
  const AppLoadingDialog({
    required this.message,
    this.title,
    this.dismissible = false,
    super.key,
  });

  /// Dialog title
  final String? title;

  /// Loading message
  final String message;

  /// Whether dialog can be dismissed
  final bool dismissible;

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: dismissible,
    child: Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) ...[
              Text(title!, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
            ],
            const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

/// A bottom sheet dialog.
class AppBottomSheet extends StatelessWidget {
  /// Creates a bottom sheet.
  const AppBottomSheet({
    required this.child,
    this.title,
    this.actions,
    this.isScrollable = true,
    super.key,
  });

  /// Sheet title
  final String? title;

  /// Sheet content
  final Widget child;

  /// Sheet actions
  final List<Widget>? actions;

  /// Whether the content is scrollable
  final bool isScrollable;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Handle bar
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outlineVariant,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
      if (title != null) ...[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(title!, style: Theme.of(context).textTheme.headlineSmall),
        ),
        Divider(height: 0, color: Theme.of(context).colorScheme.outline),
      ],
      if (isScrollable)
        Flexible(child: SingleChildScrollView(child: child))
      else
        child,
      if (actions != null) ...[
        Divider(height: 0, color: Theme.of(context).colorScheme.outline),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions!,
          ),
        ),
      ],
    ],
  );
}

/// Helper functions for showing dialogs
Future<T?> showAppDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  List<AppDialogAction>? actions,
  IconData? icon,
}) async => showDialog<T>(
  context: context,
  builder: (context) =>
      AppDialog(title: title, content: content, actions: actions, icon: icon),
);

/// Show a confirmation dialog
Future<bool?> showAppConfirmationDialog({
  required BuildContext context,
  required String title,
  required String message,
  String confirmLabel = 'Confirm',
  String cancelLabel = 'Cancel',
  bool isDangerous = false,
}) => showDialog<bool>(
  context: context,
  builder: (context) => AppConfirmationDialog(
    title: title,
    message: message,
    confirmLabel: confirmLabel,
    cancelLabel: cancelLabel,
    isDangerous: isDangerous,
  ),
);

/// Show a custom dialog
Future<T?> showAppCustomDialog<T>({
  required BuildContext context,
  required Widget content,
  String? title,
  List<Widget>? actions,
  IconData? icon,
}) async => showDialog<T>(
  context: context,
  builder: (context) => AppCustomDialog(
    title: title,
    content: content,
    actions: actions,
    icon: icon,
  ),
);

/// Show a loading dialog
Future<T?> showAppLoadingDialog<T>({
  required BuildContext context,
  required String message,
  String? title,
  bool dismissible = false,
}) async => showDialog<T>(
  context: context,
  barrierDismissible: dismissible,
  builder: (context) => AppLoadingDialog(
    title: title,
    message: message,
    dismissible: dismissible,
  ),
);

/// Show a bottom sheet
Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  String? title,
  List<Widget>? actions,
  bool isScrollable = true,
}) async => showModalBottomSheet<T>(
  context: context,
  builder: (context) => AppBottomSheet(
    title: title,
    actions: actions,
    isScrollable: isScrollable,
    child: child,
  ),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  ),
);
