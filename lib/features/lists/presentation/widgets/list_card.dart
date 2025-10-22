import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:flutter/material.dart';

/// A card widget displaying a TodoList with title, description, and action buttons.
class ListCard extends StatelessWidget {
  /// Creates a ListCard widget.
  const ListCard({required this.list, super.key, this.onTap, this.onEdit, this.onDelete, this.isLoading = false});

  /// The TodoList to display
  final TodoList list;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Callback when the edit button is pressed
  final VoidCallback? onEdit;

  /// Callback when the delete button is pressed
  final VoidCallback? onDelete;

  /// Whether the card is in a loading state
  final bool isLoading;

  @override
  Widget build(BuildContext context) => Card(
    elevation: 2,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            // Color indicator
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 8,
                height: 48,
                decoration: BoxDecoration(
                  color: _parseColor(list.color),
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(12)),
                ),
              ),
            ),
            // Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title and menu
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        list.title,
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    PopupMenuButton<String>(
                      enabled: !isLoading,
                      onSelected: (value) {
                        if (value == 'edit') {
                          onEdit?.call();
                        } else if (value == 'delete') {
                          onDelete?.call();
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Row(children: [Icon(Icons.edit, size: 20), SizedBox(width: 12), Text('Edit')]),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete, size: 20, color: Colors.red),
                              SizedBox(width: 12),
                              Text('Delete', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (list.description != null && list.description!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    list.description!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 12),
                // Stats row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _StatBadge(icon: Icons.check_circle_outline, label: '${list.completedCount}/${list.todoCount}'),
                    Text(
                      '${list.collaborators.length} ${list.collaborators.length == 1 ? 'collaborator' : 'collaborators'}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Color _parseColor(String hexColor) {
    try {
      return Color(int.parse(hexColor.replaceFirst('#', '0xff')));
    } catch (_) {
      return Colors.grey;
    }
  }
}

/// A small badge displaying an icon and label
class _StatBadge extends StatelessWidget {
  const _StatBadge({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 16, color: Colors.grey[600]),
      const SizedBox(width: 6),
      Text(label, style: Theme.of(context).textTheme.bodySmall),
    ],
  );
}
