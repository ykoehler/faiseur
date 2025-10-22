import 'package:flutter/material.dart';

/// A custom error widget for displaying error states.
///
/// Shows an error icon, message, and optional action button.
class AppErrorWidget extends StatelessWidget {
  /// Creates an error widget.
  const AppErrorWidget({required this.error, this.onRetry, this.details, super.key});

  /// The error message to display
  final String error;

  /// Optional callback when retry button is pressed
  final VoidCallback? onRetry;

  /// Optional error details or description
  final String? details;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
          const SizedBox(height: 16),
          Text(
            error,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.error),
            textAlign: TextAlign.center,
          ),
          if (details != null) ...[
            const SizedBox(height: 8),
            Text(details!, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
          ],
          if (onRetry != null) ...[
            const SizedBox(height: 24),
            ElevatedButton.icon(onPressed: onRetry, icon: const Icon(Icons.refresh), label: const Text('Retry')),
          ],
        ],
      ),
    ),
  );
}

/// A dialog showing detailed error information.
///
/// Used for showing error details in a dismissible dialog.
class AppErrorDialog extends StatelessWidget {
  /// Creates an error dialog.
  const AppErrorDialog({required this.title, required this.message, this.stackTrace, this.onDismiss, super.key});

  /// Title of the error
  final String title;

  /// Error message
  final String message;

  /// Optional stack trace for debugging
  final String? stackTrace;

  /// Optional callback when dialog is dismissed
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) => AlertDialog(
    icon: Icon(Icons.error, color: Theme.of(context).colorScheme.error),
    title: Text(title),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          if (stackTrace != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                stackTrace!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          onDismiss?.call();
          Navigator.of(context).pop();
        },
        child: const Text('OK'),
      ),
    ],
  );
}

/// Shows a snackbar with error styling.
///
/// Convenience method for displaying error messages as snackbars.
void showAppErrorSnackbar(
  BuildContext context, {
  required String message,
  Duration duration = const Duration(seconds: 4),
  VoidCallback? onRetry,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).colorScheme.error,
      action: onRetry != null
          ? SnackBarAction(label: 'Retry', textColor: Theme.of(context).colorScheme.onError, onPressed: onRetry)
          : null,
      duration: duration,
    ),
  );
}

/// A banner widget for displaying persistent error information.
///
/// Displays at the top of the screen with dismissible option.
class AppErrorBanner extends StatefulWidget {
  /// Creates an error banner.
  const AppErrorBanner({required this.message, this.onDismiss, this.onRetry, super.key});

  /// Error message to display
  final String message;

  /// Optional callback when dismissed
  final VoidCallback? onDismiss;

  /// Optional callback for retry action
  final VoidCallback? onRetry;

  @override
  State<AppErrorBanner> createState() => _AppErrorBannerState();
}

class _AppErrorBannerState extends State<AppErrorBanner> {
  bool _dismissed = false;

  @override
  Widget build(BuildContext context) {
    if (_dismissed) {
      return const SizedBox.shrink();
    }

    return Material(
      color: Theme.of(context).colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(Icons.error, color: Theme.of(context).colorScheme.error),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.message,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onErrorContainer),
              ),
            ),
            if (widget.onRetry != null) ...[
              const SizedBox(width: 8),
              TextButton(
                onPressed: widget.onRetry,
                child: Text('Retry', style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
            ],
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onErrorContainer),
              onPressed: () {
                setState(() => _dismissed = true);
                widget.onDismiss?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
