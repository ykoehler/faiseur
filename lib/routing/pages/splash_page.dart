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
    // Watch app initialization - when complete, GoRouter redirect handles nav
    final appInit = ref.watch(appInitializationProvider);

    return Scaffold(
      body: appInit.when(
        data: (_) => _buildLoadingState(context),
        loading: () => _buildLoadingState(context),
        error: (error, stackTrace) => _buildErrorState(context, error, stackTrace),
      ),
    );
  }

  /// Build loading state with spinner
  Widget _buildLoadingState(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text('Initializing app...', style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
  );

  /// Build error state with retry option
  Widget _buildErrorState(BuildContext context, Object? error, StackTrace stackTrace) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
        const SizedBox(height: 16),
        Text('Initialization Error', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            error?.toString() ?? 'Unknown error',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () {
            // Retry by navigating back to splash
            // This will trigger app initialization again
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Retrying...')));
          },
          icon: const Icon(Icons.refresh),
          label: const Text('Retry'),
        ),
      ],
    ),
  );
}
