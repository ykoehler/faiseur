/// Core enumerations used throughout the Faiseur application.
///
/// This file contains all enum definitions for the application's domain model,
/// ensuring consistent values across the codebase.
library;

/// Represents the status of a todo item in a workflow.
///
/// The default workflow includes: new → assigned → done
/// However, custom workflows can define custom status sequences.
enum TodoStatus {
  /// Todo has just been created, not yet assigned
  new_,

  /// Todo has been assigned to one or more users
  assigned,

  /// Todo is currently being worked on
  inProgress,

  /// Todo has been completed
  done,

  /// Todo has been archived (not displayed by default)
  archived;

  /// Returns a user-friendly display name for the status.
  String get displayName => switch (this) {
    TodoStatus.new_ => 'New',
    TodoStatus.assigned => 'Assigned',
    TodoStatus.inProgress => 'In Progress',
    TodoStatus.done => 'Done',
    TodoStatus.archived => 'Archived',
  };

  /// Returns a short abbreviation for the status.
  String get shortName => switch (this) {
    TodoStatus.new_ => 'NEW',
    TodoStatus.assigned => 'ASN',
    TodoStatus.inProgress => 'INP',
    TodoStatus.done => 'DND',
    TodoStatus.archived => 'ARC',
  };
}

/// Represents the priority level of a todo item.
enum TodoPriority {
  /// Low priority - can be done when time permits
  low,

  /// Medium priority - should be done soon
  medium,

  /// High priority - should be prioritized
  high,

  /// Urgent priority - must be done ASAP
  urgent;

  /// Returns a user-friendly display name for the priority.
  String get displayName => switch (this) {
    TodoPriority.low => 'Low',
    TodoPriority.medium => 'Medium',
    TodoPriority.high => 'High',
    TodoPriority.urgent => 'Urgent',
  };

  /// Returns an emoji representation of the priority.
  String get emoji => switch (this) {
    TodoPriority.low => '🟢',
    TodoPriority.medium => '🟡',
    TodoPriority.high => '🟠',
    TodoPriority.urgent => '🔴',
  };
}

/// Represents the user's role in a shared list.
enum UserRole {
  /// List owner - can manage all aspects including collaborators
  owner,

  /// Editor - can create, edit, and delete todos
  editor,

  /// Viewer - can only view todos (read-only access)
  viewer;

  /// Returns a user-friendly display name for the role.
  String get displayName => switch (this) {
    UserRole.owner => 'Owner',
    UserRole.editor => 'Editor',
    UserRole.viewer => 'Viewer',
  };

  /// Returns whether this role has edit permissions.
  bool get canEdit => this == UserRole.owner || this == UserRole.editor;

  /// Returns whether this role has admin permissions.
  bool get isAdmin => this == UserRole.owner;
}

/// Represents the gamification level based on total XP.
enum GamificationLevel {
  novice,
  apprentice,
  journeyman,
  expert,
  master;

  /// Returns a user-friendly display name for the level.
  String get displayName => switch (this) {
    GamificationLevel.novice => 'Novice',
    GamificationLevel.apprentice => 'Apprentice',
    GamificationLevel.journeyman => 'Journeyman',
    GamificationLevel.expert => 'Expert',
    GamificationLevel.master => 'Master',
  };

  /// Returns the required XP threshold for this level.
  int get requiredXp => switch (this) {
    GamificationLevel.novice => 0,
    GamificationLevel.apprentice => 100,
    GamificationLevel.journeyman => 500,
    GamificationLevel.expert => 1500,
    GamificationLevel.master => 5000,
  };
}

/// Represents the status of a reward redemption request.
enum RedemptionStatus {
  /// Request has been submitted, awaiting approval
  pending,

  /// Request has been approved
  approved,

  /// Request has been denied
  denied;

  /// Returns a user-friendly display name for the status.
  String get displayName => switch (this) {
    RedemptionStatus.pending => 'Pending',
    RedemptionStatus.approved => 'Approved',
    RedemptionStatus.denied => 'Denied',
  };

  /// Returns an emoji representation of the status.
  String get emoji => switch (this) {
    RedemptionStatus.pending => '⏳',
    RedemptionStatus.approved => '✅',
    RedemptionStatus.denied => '❌',
  };
}

/// Represents the supported view types for displaying todos.
enum ViewType {
  /// Traditional list view
  list,

  /// Kanban board view (columns by status)
  kanban,

  /// Grid of todo cards
  card,

  /// Sprint/iteration view
  sprint,

  /// Calendar view (by due date)
  calendar;

  /// Returns a user-friendly display name for the view.
  String get displayName => switch (this) {
    ViewType.list => 'List',
    ViewType.kanban => 'Kanban',
    ViewType.card => 'Card',
    ViewType.sprint => 'Sprint',
    ViewType.calendar => 'Calendar',
  };

  /// Returns an emoji icon for the view.
  String get icon => switch (this) {
    ViewType.list => '📋',
    ViewType.kanban => '📊',
    ViewType.card => '🗂️',
    ViewType.sprint => '🎯',
    ViewType.calendar => '📅',
  };
}

/// Represents the app's theme mode setting.
enum ThemeMode {
  /// Use system theme
  system,

  /// Force light theme
  light,

  /// Force dark theme
  dark;

  /// Returns a user-friendly display name for the theme mode.
  String get displayName => switch (this) {
    ThemeMode.system => 'System',
    ThemeMode.light => 'Light',
    ThemeMode.dark => 'Dark',
  };
}

/// Represents the type of action in an activity log entry.
enum ActivityActionType {
  /// Todo/list was created
  created,

  /// Todo/list was updated
  updated,

  /// Todo/list was deleted
  deleted,

  /// Todo was marked as completed
  completed,

  /// Todo was assigned to user
  assigned,

  /// Comment was added
  commented,

  /// Reward was redeemed
  redeemed;

  /// Returns a user-friendly display name for the action.
  String get displayName => switch (this) {
    ActivityActionType.created => 'Created',
    ActivityActionType.updated => 'Updated',
    ActivityActionType.deleted => 'Deleted',
    ActivityActionType.completed => 'Completed',
    ActivityActionType.assigned => 'Assigned',
    ActivityActionType.commented => 'Commented',
    ActivityActionType.redeemed => 'Redeemed',
  };
}

/// Represents the type of entity in activity/notification contexts.
enum EntityType {
  /// Activity refers to a TodoList
  list,

  /// Activity refers to a Todo item
  todo,

  /// Activity refers to a Comment
  comment,

  /// Activity refers to a Reward redemption
  redemption;

  /// Returns a user-friendly display name for the entity type.
  String get displayName => switch (this) {
    EntityType.list => 'List',
    EntityType.todo => 'Todo',
    EntityType.comment => 'Comment',
    EntityType.redemption => 'Redemption',
  };
}
