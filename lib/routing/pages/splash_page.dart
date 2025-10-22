import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/providers/app_providers.dart';

/// Splash page widget.
///
/// Shows during app initialization. Uses app state providers to determine
/// when to proceed.
class SplashPage extends ConsumerWidget {
  /// Creates a splash page.
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch app initialization status (sync provider that returns bool)
    final isInitialized = ref.watch(appInitializedProvider);

    return Scaffold(body: Center(child: _buildLoadingState(context, isInitialized)));
  }

  /// Build loading state with spinner
  Widget _buildLoadingState(BuildContext context, bool isInitialized) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(isInitialized ? 'Loading...' : 'Initializing app...', style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
  );
}
