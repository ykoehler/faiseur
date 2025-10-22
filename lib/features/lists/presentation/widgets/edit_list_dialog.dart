import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:flutter/material.dart';

/// Parameters for updating a list
class EditListDialogParams {
  /// Creates a new EditListDialogParams
  EditListDialogParams({required this.title, required this.description, required this.color});

  /// The updated title
  final String title;

  /// The updated description
  final String description;

  /// The updated color hex code
  final String color;
}

/// A dialog for editing an existing list.
class EditListDialog extends StatefulWidget {
  /// Creates an EditListDialog.
  const EditListDialog({required this.list, super.key});

  /// The TodoList to edit
  final TodoList list;

  @override
  State<EditListDialog> createState() => _EditListDialogState();
}

class _EditListDialogState extends State<EditListDialog> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late String _selectedColor;

  static const _colorOptions = [
    '#3498db', // Blue
    '#e74c3c', // Red
    '#2ecc71', // Green
    '#f39c12', // Orange
    '#9b59b6', // Purple
    '#1abc9c', // Teal
    '#34495e', // Dark gray
    '#f1c40f', // Yellow
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.list.title);
    _descriptionController = TextEditingController(text: widget.list.description ?? '');
    _selectedColor = widget.list.color;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Edit List'),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title field
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              prefixIcon: const Icon(Icons.list),
            ),
            maxLength: 255,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          // Description field
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Description (optional)',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              prefixIcon: const Icon(Icons.description),
            ),
            maxLines: 3,
            maxLength: 1000,
          ),
          const SizedBox(height: 16),
          // Color selector
          Text('Color', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _colorOptions.length,
              itemBuilder: (context, index) {
                final color = _colorOptions[index];
                final isSelected = color == _selectedColor;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: _parseColor(color),
                        border: Border.all(color: isSelected ? Colors.black : Colors.transparent, width: 3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
      ElevatedButton(onPressed: _isFormValid() ? _handleSave : null, child: const Text('Save')),
    ],
  );

  bool _isFormValid() => _titleController.text.trim().isNotEmpty;

  void _handleSave() {
    final params = EditListDialogParams(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      color: _selectedColor,
    );
    Navigator.of(context).pop(params);
  }

  Color _parseColor(String hexColor) {
    try {
      return Color(int.parse(hexColor.replaceFirst('#', '0xff')));
    } catch (_) {
      return Colors.grey;
    }
  }
}
