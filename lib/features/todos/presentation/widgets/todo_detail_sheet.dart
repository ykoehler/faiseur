import 'package:faiseur/core/constants/enums.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:flutter/material.dart';

/// Bottom sheet for viewing and editing todo details
class TodoDetailSheet extends StatefulWidget {
  /// Creates a todo detail sheet
  const TodoDetailSheet({
    required this.todo,
    required this.onUpdate,
    super.key,
  });

  /// The todo to display
  final Todo todo;

  /// Callback when the todo is updated
  final void Function(Todo) onUpdate;

  @override
  State<TodoDetailSheet> createState() => _TodoDetailSheetState();
}

class _TodoDetailSheetState extends State<TodoDetailSheet> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TodoStatus _selectedStatus;
  late TodoPriority _selectedPriority;
  DateTime? _selectedDueDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _descriptionController = TextEditingController(
      text: widget.todo.description ?? '',
    );
    _selectedStatus = widget.todo.status;
    _selectedPriority = widget.todo.priority;
    _selectedDueDate = widget.todo.dueDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
    expand: false,
    builder: (context, scrollController) => ListView(
      controller: scrollController,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      children: [
        // Header with title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Todo Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Title field
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(),
          ),
          maxLength: 500,
        ),
        const SizedBox(height: 16),
        // Description field
        TextField(
          controller: _descriptionController,
          decoration: const InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(),
          ),
          maxLength: 5000,
          maxLines: 4,
        ),
        const SizedBox(height: 16),
        // Status dropdown
        _buildStatusDropdown(),
        const SizedBox(height: 16),
        // Priority dropdown
        _buildPriorityDropdown(),
        const SizedBox(height: 16),
        // Due date picker
        _buildDueDatePicker(),
        const SizedBox(height: 24),
        // Action buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _saveChanges,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _buildStatusDropdown() => DropdownButtonFormField<TodoStatus>(
    initialValue: _selectedStatus,
    decoration: const InputDecoration(
      labelText: 'Status',
      border: OutlineInputBorder(),
    ),
    items: TodoStatus.values
        .map(
          (status) => DropdownMenuItem(
            value: status,
            child: Text(_statusLabel(status)),
          ),
        )
        .toList(),
    onChanged: (value) {
      if (value != null) {
        setState(() => _selectedStatus = value);
      }
    },
  );

  Widget _buildPriorityDropdown() => DropdownButtonFormField<TodoPriority>(
    initialValue: _selectedPriority,
    decoration: const InputDecoration(
      labelText: 'Priority',
      border: OutlineInputBorder(),
    ),
    items: TodoPriority.values
        .map(
          (priority) => DropdownMenuItem(
            value: priority,
            child: Text(_priorityLabel(priority)),
          ),
        )
        .toList(),
    onChanged: (value) {
      if (value != null) {
        setState(() => _selectedPriority = value);
      }
    },
  );

  Widget _buildDueDatePicker() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Due Date', style: Theme.of(context).textTheme.labelMedium),
      const SizedBox(height: 8),
      Row(
        children: [
          Icon(Icons.calendar_today, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _selectedDueDate == null
                  ? 'No due date'
                  : '${_selectedDueDate!.month}/${_selectedDueDate!.day}/${_selectedDueDate!.year}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          TextButton(onPressed: _selectDueDate, child: const Text('Change')),
          if (_selectedDueDate != null)
            TextButton(
              onPressed: () => setState(() => _selectedDueDate = null),
              child: const Text('Clear'),
            ),
        ],
      ),
    ],
  );

  Future<void> _selectDueDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate:
          _selectedDueDate ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() => _selectedDueDate = picked);
    }
  }

  void _saveChanges() {
    final title = _titleController.text.trim();

    if (title.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a title')));
      return;
    }

    final updatedTodo = widget.todo.copyWith(
      title: title,
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      status: _selectedStatus,
      priority: _selectedPriority,
      dueDate: _selectedDueDate,
      updatedAt: DateTime.now(),
    );

    widget.onUpdate(updatedTodo);
  }

  String _statusLabel(TodoStatus status) => status.toString().split('.').last;

  String _priorityLabel(TodoPriority priority) {
    final labels = {
      TodoPriority.low: 'Low',
      TodoPriority.medium: 'Medium',
      TodoPriority.high: 'High',
    };
    return labels[priority] ?? 'Medium';
  }
}
