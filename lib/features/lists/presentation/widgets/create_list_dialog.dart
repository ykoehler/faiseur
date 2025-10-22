import 'package:flutter/material.dart';

/// Parameters for creating a new list
class CreateListDialogParams {
  /// Creates a new CreateListDialogParams
  CreateListDialogParams({required this.title, required this.description, required this.color});

  /// The title entered by the user
  final String title;

  /// The description entered by the user
  final String description;

  /// The color hex code selected by the user
  final String color;
}

/// A dialog for creating a new list.
class CreateListDialog extends StatefulWidget {
  /// Creates a CreateListDialog.
  const CreateListDialog({super.key, this.initialColor = '#3498db'});

  /// The initial color to select
  final String initialColor;

  @override
  State<CreateListDialog> createState() => _CreateListDialogState();
}

class _CreateListDialogState extends State<CreateListDialog> {
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
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _selectedColor = widget.initialColor;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Create New List'),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title field
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'List name',
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
              hintText: 'What is this list for?',
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
      ElevatedButton(onPressed: _isFormValid() ? _handleCreate : null, child: const Text('Create')),
    ],
  );

  bool _isFormValid() => _titleController.text.trim().isNotEmpty;

  void _handleCreate() {
    final params = CreateListDialogParams(
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
