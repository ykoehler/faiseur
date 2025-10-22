import 'package:flutter/material.dart';

/// A widget for displaying empty state screens.
///
/// Shows an icon, title, message, and optional action button when no data is available.
class AppEmptyState extends StatelessWidget {
  /// Creates an empty state widget.
  const AppEmptyState({
    required this.icon,
    required this.title,
    required this.message,
    this.action,
    this.actionLabel,
    this.iconSize = 80,
    super.key,
  });

  /// Icon to display
  final IconData icon;

  /// Title text
  final String title;

  /// Message/description text
  final String message;

  /// Optional callback for action button
  final VoidCallback? action;

  /// Label for the action button
  final String? actionLabel;

  /// Size of the icon
  final double iconSize;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: iconSize, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
          if (action != null && actionLabel != null) ...[
            const SizedBox(height: 24),
            ElevatedButton(onPressed: action, child: Text(actionLabel!)),
          ],
        ],
      ),
    ),
  );
}

/// An empty state widget for search results.
///
/// Displays when a search query returns no results.
class AppEmptySearchState extends StatelessWidget {
  /// Creates an empty search state widget.
  const AppEmptySearchState({required this.query, this.onClear, super.key});

  /// The search query that returned no results
  final String query;

  /// Optional callback to clear search
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No results found',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'No matches for "$query"',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
          if (onClear != null) ...[
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onClear,
              child: const Text('Clear Search'),
            ),
          ],
        ],
      ),
    ),
  );
}

/// An empty state widget with placeholder items (skeleton loading).
///
/// Shows placeholder cards while data is loading.
class AppEmptyStateSkeleton extends StatelessWidget {
  /// Creates an empty state skeleton widget.
  const AppEmptyStateSkeleton({
    this.itemCount = 3,
    this.isListView = false,
    super.key,
  });

  /// Number of skeleton items to display
  final int itemCount;

  /// Whether to use list view style or grid
  final bool isListView;

  @override
  Widget build(BuildContext context) {
    if (isListView) {
      return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) => const _SkeletonItem(),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => const _SkeletonItem(isGrid: true),
    );
  }
}

/// Individual skeleton item for loading state.
class _SkeletonItem extends StatelessWidget {
  const _SkeletonItem({this.isGrid = false});

  final bool isGrid;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      highlightColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [Container(height: isGrid ? 100 : 60, color: Colors.white)],
      ),
    ),
  );
}

/// Simple shimmer effect for skeleton loading.
class Shimmer extends StatefulWidget {
  const Shimmer.fromColors({
    required this.baseColor,
    required this.highlightColor,
    required this.child,
    super.key,
  });

  final Color baseColor;
  final Color highlightColor;
  final Widget child;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    builder: (context, child) => ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        stops: [
          _controller.value - 0.3,
          _controller.value,
          _controller.value + 0.3,
        ],
        colors: [widget.baseColor, widget.highlightColor, widget.baseColor],
      ).createShader(bounds),
      child: widget.child,
    ),
  );
}

/// An empty state with custom content.
///
/// Allows full customization of the empty state appearance.
class AppCustomEmptyState extends StatelessWidget {
  /// Creates a custom empty state widget.
  const AppCustomEmptyState({required this.child, super.key});

  /// Custom widget to display as empty state
  final Widget child;

  @override
  Widget build(BuildContext context) => Center(
    child: SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.all(24), child: child),
    ),
  );
}
