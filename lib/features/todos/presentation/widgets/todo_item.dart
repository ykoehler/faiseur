import 'package:faiseur/core/constants/enums.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:flutter/material.dart';

/// A widget that displays a single todo item in a list.
///
/// Shows the todo's title, status, priority, and due date.
/// Provides actions for toggling status and deleting.
class TodoItem extends StatelessWidget {
  /// Creates a todo item widget.
  const TodoItem({
    required this.todo,
    required this.onTap,
    required this.onStatusChanged,
    required this.onDelete,
    super.key,
  });

  /// The todo to display
  final Todo todo;

  /// Callback when the item is tapped
  final VoidCallback onTap;

  /// Callback when the status is changed
  final void Function(TodoStatus) onStatusChanged;

  /// Callback when the delete action is triggered
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Status checkbox
            _buildCheckbox(context),
            const SizedBox(width: 12),
            // Title and metadata
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  if (todo.description != null && todo.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        todo.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  if (todo.dueDate != null) _buildDueDate(context),
                ],
              ),
            ),
            // Priority indicator
            _buildPriorityBadge(),
            const SizedBox(width: 8),
            // Delete button
            _buildDeleteButton(),
          ],
        ),
      ),
    ),
  );

  Widget _buildCheckbox(BuildContext context) {
    final isCompleted = todo.status == TodoStatus.done;
    return Checkbox(
      value: isCompleted,
      onChanged: (value) {
        if (value != null) {
          final newStatus = value ? TodoStatus.done : TodoStatus.new_;
          onStatusChanged(newStatus);
        }
      },
    );
  }

  Widget _buildTitle() => Text(
    todo.title,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      decoration: todo.status == TodoStatus.done
          ? TextDecoration.lineThrough
          : null,
      color: todo.status == TodoStatus.done ? Colors.grey[500] : null,
    ),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );

  Widget _buildDueDate(BuildContext context) {
    final dueDate = todo.dueDate;
    if (dueDate == null) {
      return const SizedBox.shrink();
    }

    final now = DateTime.now();
    final isOverdue = dueDate.isBefore(now) && todo.status != TodoStatus.done;
    final daysUntil = dueDate.difference(now).inDays;

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            size: 14,
            color: isOverdue ? Colors.red : Colors.grey[600],
          ),
          const SizedBox(width: 4),
          Text(
            _formatDueDate(dueDate, daysUntil),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isOverdue ? Colors.red : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDueDate(DateTime dueDate, int daysUntil) {
    if (daysUntil == 0) {
      return 'Today';
    }
    if (daysUntil == 1) {
      return 'Tomorrow';
    }
    if (daysUntil == -1) {
      return 'Overdue';
    }
    if (daysUntil < 0) {
      return '${-daysUntil} days overdue';
    }
    if (daysUntil <= 7) {
      return 'In $daysUntil days';
    }
    return '${dueDate.month}/${dueDate.day}';
  }

  Widget _buildPriorityBadge() {
    final colors = {
      TodoPriority.low: Colors.blue,
      TodoPriority.medium: Colors.orange,
      TodoPriority.high: Colors.red,
    };

    final labels = {
      TodoPriority.low: 'L',
      TodoPriority.medium: 'M',
      TodoPriority.high: 'H',
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colors[todo.priority]?.withValues(alpha: 0.1),
        border: Border.all(color: colors[todo.priority] ?? Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        labels[todo.priority] ?? 'M',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: colors[todo.priority],
        ),
      ),
    );
  }

  Widget _buildDeleteButton() => PopupMenuButton<String>(
    onSelected: (value) {
      if (value == 'delete') {
        onDelete();
      }
    },
    itemBuilder: (context) => [
      const PopupMenuItem(
        value: 'delete',
        child: Row(
          children: [
            Icon(Icons.delete, size: 18, color: Colors.red),
            SizedBox(width: 8),
            Text('Delete', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    ],
    child: Icon(Icons.more_vert, color: Colors.grey[600]),
  );
}
