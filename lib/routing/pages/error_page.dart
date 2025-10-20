/// Error page shown when navigation or app errors occur.
///
/// Displays error details and provides options to retry or navigate back.

import 'package:flutter/material.dart';

/// Error page widget.
///
/// Shows when there's an error loading a page or during navigation.
class ErrorPage extends StatelessWidget {
  /// Creates an error page.
  ///
  /// [error] is optional error message to display.
  const ErrorPage({
    Key? key,
    this.error,
  }) : super(key: key);

  /// Optional error message to display
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            if (error != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  error!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Go Back'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    // Navigate to home
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('Go Home'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
