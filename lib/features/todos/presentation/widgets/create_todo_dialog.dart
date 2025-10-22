import 'package:flutter/material.dart';

/// Parameters returned from the create todo dialog
class CreateTodoDialogParams {
  /// Creates parameters for a new todo
  CreateTodoDialogParams({required this.title, this.description = '', this.dueDate});

  /// The title of the todo
  final String title;

  /// Optional description
  final String description;

  /// Optional due date
  final DateTime? dueDate;
}

/// Dialog for creating a new todo
class CreateTodoDialog extends StatefulWidget {
  /// Creates a create todo dialog
  const CreateTodoDialog({super.key});

  @override
  State<CreateTodoDialog> createState() => _CreateTodoDialogState();
}

class _CreateTodoDialogState extends State<CreateTodoDialog> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  DateTime? _selectedDueDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Create Todo'),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Enter todo title',
              border: OutlineInputBorder(),
            ),
            maxLength: 500,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Enter todo description (optional)',
              border: OutlineInputBorder(),
            ),
            maxLength: 5000,
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          _buildDueDatePicker(),
        ],
      ),
    ),
    actions: [
      TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
      ElevatedButton(onPressed: _validateAndSubmit, child: const Text('Create')),
    ],
  );

  Widget _buildDueDatePicker() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.calendar_today, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(
            _selectedDueDate == null
                ? 'No due date'
                : '${_selectedDueDate!.month}/${_selectedDueDate!.day}/${_selectedDueDate!.year}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          TextButton(onPressed: _selectDueDate, child: const Text('Set Date')),
          if (_selectedDueDate != null)
            TextButton(onPressed: () => setState(() => _selectedDueDate = null), child: const Text('Clear')),
        ],
      ),
    ],
  );

  Future<void> _selectDueDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDueDate ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() => _selectedDueDate = picked);
    }
  }

  void _validateAndSubmit() {
    final title = _titleController.text.trim();

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a title')));
      return;
    }

    Navigator.of(context).pop(
      CreateTodoDialogParams(title: title, description: _descriptionController.text.trim(), dueDate: _selectedDueDate),
    );
  }
}
