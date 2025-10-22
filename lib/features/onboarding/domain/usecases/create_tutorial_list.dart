import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/lists/domain/repositories/lists_repository.dart';
import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';

/// Use case for creating a tutorial list on first launch
///
/// Creates a sample list with onboarding instructions and tips
/// to help new users get started with the app.
class CreateTutorialList {
  CreateTutorialList({required this.listsRepository, required this.todosRepository});

  final ListsRepository listsRepository;
  final TodosRepository todosRepository;

  /// Sample tutorial todos to populate the getting started list
  static const List<Map<String, String>> _tutorialTodos = [
    {
      'title': '✨ Welcome to Faiseur!',
      'description': 'This is a sample todo. You can mark it complete by clicking the checkbox.',
    },
    {'title': '📝 Create your own todos', 'description': 'Tap the + button to create new todos in this list.'},
    {
      'title': '🎯 Set priorities and due dates',
      'description': 'Each todo can have a priority level and due date to help you stay organized.',
    },
    {
      'title': '👥 Collaborate with others',
      'description': 'You can share lists with friends and family to collaborate together.',
    },
    {
      'title': '🌙 Customize your experience',
      'description': 'Visit Settings to change themes, notifications, and more!',
    },
  ];

  /// Creates a tutorial/onboarding list for the user
  ///
  /// This creates a "Getting Started" list with helpful information
  /// for new users to understand how to use the app.
  ///
  /// Parameters:
  /// - [ownerId]: The ID of the user to create the tutorial list for
  /// - [title]: Optional custom name for the list (default: "Getting Started")
  /// - [description]: Optional custom description for the list
  /// - [color]: Color hex code for the list (default: blue)
  ///
  /// Returns the created TodoList
  ///
  /// Throws [ArgumentError] if ownerId is empty
  /// Throws [Exception] if the list cannot be created in Firestore
  Future<TodoList> call({
    required String ownerId,
    String title = 'Getting Started',
    String? description,
    String color = '#2196F3', // Material blue
  }) async {
    // Validate required fields
    if (ownerId.isEmpty) {
      throw ArgumentError('ownerId cannot be empty');
    }

    if (title.isEmpty) {
      throw ArgumentError('title cannot be empty');
    }

    if (title.length > 200) {
      throw ArgumentError('title cannot exceed 200 characters');
    }

    if (description != null && description.length > 1000) {
      throw ArgumentError('description cannot exceed 1000 characters');
    }

    // Create the tutorial list
    final tutorialList = await listsRepository.createList(
      title: title,
      color: color,
      ownerId: ownerId,
      description: description ?? 'Learn how to use Faiseur. Complete these tasks to get started!',
    );

    // Create sample todos in the list
    for (final todoData in _tutorialTodos) {
      try {
        await todosRepository.createTodo(
          listId: tutorialList.id,
          title: todoData['title']!,
          createdBy: ownerId,
          description: todoData['description'],
          // Don't set due dates or other fields for tutorial todos
        );
      } catch (e) {
        // Log error but continue creating other todos
        // Ignore individual todo creation failures
      }
    }

    return tutorialList;
  }

  /// Get tutorial steps data
  ///
  /// Returns the list of all tutorial todos for reference
  List<Map<String, String>> getTutorialTodos() => List.from(_tutorialTodos);
}
