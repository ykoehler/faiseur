import 'package:flutter/material.dart';

/// A custom loading indicator widget that matches the Material Design 3 theme.
///
/// Shows a circular progress indicator with optional message text.
class AppLoadingIndicator extends StatelessWidget {
  /// Creates a loading indicator.
  const AppLoadingIndicator({this.message, this.size = 48, this.strokeWidth = 4, super.key});

  /// Optional message to display below the loading indicator
  final String? message;

  /// Size of the loading indicator in logical pixels
  final double size;

  /// Width of the progress indicator stroke
  final double strokeWidth;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
          ),
        ),
        if (message != null) ...[
          const SizedBox(height: 16),
          Text(message!, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
        ],
      ],
    ),
  );
}

/// A compact loading indicator for use in smaller spaces.
///
/// Displays a smaller loading indicator suitable for buttons, cards, or inline usage.
class AppLoadingIndicatorSmall extends StatelessWidget {
  /// Creates a small loading indicator.
  const AppLoadingIndicatorSmall({this.size = 24, this.strokeWidth = 2, super.key});

  /// Size of the loading indicator in logical pixels
  final double size;

  /// Width of the progress indicator stroke
  final double strokeWidth;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size,
    height: size,
    child: CircularProgressIndicator(
      strokeWidth: strokeWidth,
      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
    ),
  );
}

/// A linear progress indicator for showing determinate progress.
///
/// Shows a horizontal progress bar with optional label.
class AppLinearProgressIndicator extends StatelessWidget {
  /// Creates a linear progress indicator.
  const AppLinearProgressIndicator({required this.value, this.label, this.minHeight = 4, super.key});

  /// Progress value between 0 and 1
  final double value;

  /// Optional label to display
  final String? label;

  /// Minimum height of the progress bar
  final double minHeight;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (label != null) ...[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label!, style: Theme.of(context).textTheme.bodySmall),
            Text('${(value * 100).toStringAsFixed(0)}%', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 8),
      ],
      ClipRRect(
        borderRadius: BorderRadius.circular(minHeight / 2),
        child: LinearProgressIndicator(
          value: value,
          minHeight: minHeight,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
        ),
      ),
    ],
  );
}
