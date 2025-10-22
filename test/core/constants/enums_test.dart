import 'package:faiseur/core/constants/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TodoStatus enum', () {
    test('has all required values', () {
      expect(
        TodoStatus.values,
        containsAll([
          TodoStatus.new_,
          TodoStatus.assigned,
          TodoStatus.inProgress,
          TodoStatus.done,
          TodoStatus.archived,
        ]),
      );
    });

    test('displayName returns correct string', () {
      expect(TodoStatus.new_.displayName, 'New');
      expect(TodoStatus.assigned.displayName, 'Assigned');
      expect(TodoStatus.inProgress.displayName, 'In Progress');
      expect(TodoStatus.done.displayName, 'Done');
      expect(TodoStatus.archived.displayName, 'Archived');
    });

    test('shortName returns correct string', () {
      expect(TodoStatus.new_.shortName, 'NEW');
      expect(TodoStatus.assigned.shortName, 'ASN');
      expect(TodoStatus.inProgress.shortName, 'INP');
      expect(TodoStatus.done.shortName, 'DND');
      expect(TodoStatus.archived.shortName, 'ARC');
    });
  });

  group('TodoPriority enum', () {
    test('has all required values', () {
      expect(
        TodoPriority.values,
        containsAll([TodoPriority.low, TodoPriority.medium, TodoPriority.high, TodoPriority.urgent]),
      );
    });

    test('displayName returns correct string', () {
      expect(TodoPriority.low.displayName, 'Low');
      expect(TodoPriority.medium.displayName, 'Medium');
      expect(TodoPriority.high.displayName, 'High');
      expect(TodoPriority.urgent.displayName, 'Urgent');
    });

    test('emoji returns correct emoji', () {
      expect(TodoPriority.low.emoji, '🟢');
      expect(TodoPriority.medium.emoji, '🟡');
      expect(TodoPriority.high.emoji, '🟠');
      expect(TodoPriority.urgent.emoji, '🔴');
    });
  });

  group('UserRole enum', () {
    test('has all required values', () {
      expect(UserRole.values, containsAll([UserRole.owner, UserRole.editor, UserRole.viewer]));
    });

    test('displayName returns correct string', () {
      expect(UserRole.owner.displayName, 'Owner');
      expect(UserRole.editor.displayName, 'Editor');
      expect(UserRole.viewer.displayName, 'Viewer');
    });

    test('canEdit returns correct boolean', () {
      expect(UserRole.owner.canEdit, true);
      expect(UserRole.editor.canEdit, true);
      expect(UserRole.viewer.canEdit, false);
    });

    test('isAdmin returns correct boolean', () {
      expect(UserRole.owner.isAdmin, true);
      expect(UserRole.editor.isAdmin, false);
      expect(UserRole.viewer.isAdmin, false);
    });
  });

  group('GamificationLevel enum', () {
    test('has all required values', () {
      expect(
        GamificationLevel.values,
        containsAll([
          GamificationLevel.novice,
          GamificationLevel.apprentice,
          GamificationLevel.journeyman,
          GamificationLevel.expert,
          GamificationLevel.master,
        ]),
      );
    });

    test('requiredXp returns correct threshold', () {
      expect(GamificationLevel.novice.requiredXp, 0);
      expect(GamificationLevel.apprentice.requiredXp, 100);
      expect(GamificationLevel.journeyman.requiredXp, 500);
      expect(GamificationLevel.expert.requiredXp, 1500);
      expect(GamificationLevel.master.requiredXp, 5000);
    });
  });

  group('RedemptionStatus enum', () {
    test('has all required values', () {
      expect(
        RedemptionStatus.values,
        containsAll([RedemptionStatus.pending, RedemptionStatus.approved, RedemptionStatus.denied]),
      );
    });

    test('emoji returns correct emoji', () {
      expect(RedemptionStatus.pending.emoji, '⏳');
      expect(RedemptionStatus.approved.emoji, '✅');
      expect(RedemptionStatus.denied.emoji, '❌');
    });
  });

  group('ViewType enum', () {
    test('has all required values', () {
      expect(
        ViewType.values,
        containsAll([ViewType.list, ViewType.kanban, ViewType.card, ViewType.sprint, ViewType.calendar]),
      );
    });

    test('icon returns correct emoji', () {
      expect(ViewType.list.icon, '📋');
      expect(ViewType.kanban.icon, '📊');
      expect(ViewType.card.icon, '🗂️');
      expect(ViewType.sprint.icon, '🎯');
      expect(ViewType.calendar.icon, '📅');
    });
  });
}
