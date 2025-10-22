import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/lists/domain/repositories/lists_repository.dart';

/// Use case for creating a tutorial list on first launch
///
/// Creates a sample list with onboarding instructions and tips
/// to help new users get started with the app.
class CreateTutorialList {
  CreateTutorialList(this.listsRepository);

  final ListsRepository listsRepository;

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

    return tutorialList;
  }

  /// Get tutorial steps data
  ///
  /// Returns the list of all tutorial steps for reference
  List<Map<String, String>> getTutorialSteps() => [
    {'step': '1. Welcome to Faiseur', 'description': 'Learn the basics of task management'},
    {'step': '2. Create Lists', 'description': 'Organize your tasks into different lists'},
    {'step': '3. Add Todos', 'description': 'Create and manage individual tasks'},
    {'step': '4. Customize Your Preferences', 'description': 'Personalize your app experience'},
    {'step': '5. You\'re All Set!', 'description': 'Start using Faiseur to organize your life'},
  ];
}
