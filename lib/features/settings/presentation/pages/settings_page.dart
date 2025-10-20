/// Settings page.
///
/// Placeholder for settings feature UI implementation.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Settings page widget.
class SettingsPage extends ConsumerWidget {
  /// Creates a settings page.
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.settings, size: 64),
            const SizedBox(height: 16),
            const Text('Settings Page'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement settings
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('TODO: Implement settings')),
                );
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
