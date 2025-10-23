# AI Coding Agents Guide for Faiseur

This document provides recommendations and best practices for using AI coding
agents (GitHub Copilot, Cursor, Claude, etc.) to develop the Faiseur project
efficiently.

## 📋 Table of Contents

1. [Quick Start for Agents](#quick-start-for-agents)
2. [Context Files to Reference](#context-files-to-reference)
3. [Effective Prompting Strategies](#effective-prompting-strategies)
4. [Phase-by-Phase Agent Usage](#phase-by-phase-agent-usage)
5. [Code Generation Best Practices](#code-generation-best-practices)
6. [Common Agent Tasks](#common-agent-tasks)
7. [Testing with Agents](#testing-with-agents)
8. [Debugging with Agents](#debugging-with-agents)
9. [Agent Limitations](#agent-limitations)

---

## Quick Start for Agents

### Essential Context to Provide

When starting a new conversation with an AI agent, provide this context:

```
I'm working on Faiseur, a Flutter todo app with Firebase backend.

Key facts:
- Clean architecture with feature-first organization
- Riverpod for state management
- Freezed for immutable models
- Multi-platform: Web, macOS, iOS, Android
- Current phase: [Phase 1/2/3/4]
- Current step: [e.g., "Step 1.3: Authentication Feature"]

Please reference:
- docs/architecture.md for technical architecture
- docs/implementation-plan.md for current task details
- .github/copilot-instructions.md for coding guidelines
```

### First Agent Interaction Template

```
I need help implementing [specific feature].

Current context:
- Feature: [e.g., "User authentication"]
- Location: lib/features/auth/
- Requirements: See docs/requirements.md REQ-1.1 to REQ-1.6
- Architecture: Clean architecture with domain/data/presentation layers

Please:
1. Review the architecture in docs/architecture.md
2. Generate [entities/repositories/UI] following the pattern
3. Include Freezed annotations for models
4. Add proper error handling
5. Write unit tests
```

---

## Context Files to Reference

### Always Reference These Files

**For Architecture Understanding:**
- `docs/architecture.md` - Overall technical design, folder structure, patterns
- `.github/copilot-instructions.md` - Coding standards and conventions
- `pubspec.yaml` - Available dependencies

**For Feature Implementation:**
- `docs/requirements.md` - Specific feature requirements with REQ-IDs
- `docs/implementation-plan.md` - Step-by-step tasks for current phase
- `docs/design.md` - UI/UX specifications

**For Firebase:**
- `docs/firebase-setup.md` - Firebase configuration
- `docs/architecture.md` (Firestore Schema section) - Database structure

### Example: Asking Agent to Reference Files

```
Please read docs/architecture.md (sections "Feature Module Structure" 
and "Data Architecture") before generating the lists repository.

Follow the pattern exactly as described, using:
- Repository interface in domain/repositories/
- Implementation in data/repositories/
- Remote datasource in data/datasources/
- Models with Freezed in data/models/
```

---

## Effective Prompting Strategies

### 1. Feature Implementation Prompts

**❌ Avoid Vague Prompts:**
```
Create authentication
```

**✅ Use Specific Prompts:**
```
Create authentication feature following clean architecture:

1. Domain layer:
   - Create User entity in lib/features/auth/domain/entities/user.dart
   - Use Freezed for immutability
   - Fields: id, email, username, displayName, createdAt

2. Create AuthRepository interface with methods:
   - signInWithEmail(email, password)
   - signUpWithEmail(email, password, username)
   - signOut()
   - getCurrentUser()

Reference docs/architecture.md for the pattern.
```

### 2. Multi-Step Complex Tasks

Break down into smaller prompts:

```
Step 1: "Create the Todo entity with Freezed in 
lib/features/todos/domain/entities/todo.dart. Include all fields 
from docs/architecture.md Firestore schema."

Step 2: "Create the TodoModel that extends Todo entity and adds 
fromJson/toJson methods."

Step 3: "Create TodosRepository interface with CRUD methods."

Step 4: "Implement TodosRepositoryImpl using Firestore."
```

### 3. UI Component Prompts

**Provide Design Context:**
```
Create the TodoItem widget following Material Design 3.

Requirements from docs/design.md:
- Checkbox for status toggle
- Title (single or multi-line)
- Assignee avatar (24dp)
- Due date badge if set
- Priority color indicator
- XP badge if gamified
- Swipe actions: complete (right), delete (left)

Use Riverpod hooks for state management.
Make it a ConsumerWidget.
```

### 4. Test Generation Prompts

```
Generate comprehensive unit tests for CreateTodoUseCase:

Test cases:
1. Should create todo successfully
2. Should throw exception if title is empty
3. Should handle Firestore errors gracefully
4. Should validate all required fields

Use mocktail for mocking TodosRepository.
Follow the test pattern in docs/architecture.md.
```

---

## Phase-by-Phase Agent Usage

### Phase 1: MVP (Weeks 1-8)

**Week 1: Setup**
```
Agent, help me:
1. Verify Firebase configuration is correct
2. Create the core error handling classes
3. Set up the theme system with Material Design 3
```

**Week 2: Auth**
```
Agent, implement authentication feature:
1. Start with domain layer (entities, repository interface)
2. Then data layer (Firebase implementation)
3. Finally presentation layer (sign in/up UI)
4. Reference docs/implementation-plan.md Step 1.3
```

**Week 3: Lists**
```
Agent, implement lists feature following the same pattern as auth:
1. Domain: TodoList entity, repository interface, use cases
2. Data: Firestore implementation, models
3. Presentation: Lists home page, list cards, create dialog
```

**Week 4: Todos**
```
Agent, implement todos feature:
1. Todo entity with all fields from Firestore schema
2. Repository with CRUD + real-time stream
3. List detail page with todo items
4. Todo detail sheet for editing
```

### Phase 2: Collaboration (Weeks 9-14)

```
Agent, add collaboration features:
1. Update List model to include collaborators map
2. Add user search functionality
3. Create "Add Collaborator" flow
4. Update Firestore security rules
5. Reference docs/architecture.md security rules section
```

### Phase 3: Multiple Views (Weeks 15-19)

```
Agent, implement Kanban view:
1. Create view abstraction interface
2. Build KanbanView widget with horizontal columns
3. Implement drag-and-drop using flutter ReorderableList
4. Add status change animations
5. Reference docs/design.md Kanban View section
```

### Phase 4: Gamification (Weeks 20-26)

```
Agent, implement gamification system:
1. Update Todo model with XP field
2. Create Reward and Redemption entities
3. Build XP calculation logic
4. Create rewards catalog UI
5. Implement redemption workflow
```

---

## Code Generation Best Practices

### 1. Always Request Complete Files

**❌ Avoid:**
```
Agent: Add a method to the repository
```
(Results in incomplete code snippets)

**✅ Better:**
```
Show me the complete updated TodosRepository interface with the new 
method included. Include all existing methods plus the new one.
```

### 2. Request Layer-by-Layer

```
First, show me just the domain layer (entity and repository interface).
Once approved, we'll move to data layer.
Then presentation layer.
```

### 3. Specify Imports

```
When generating Riverpod providers, use these imports:
- import 'package:riverpod_annotation/riverpod_annotation.dart';
- Use @riverpod annotation (not old Provider syntax)
- Generate with: dart run build_runner build
```

### 4. Request Tests Alongside Code

```
For each use case you generate, also generate the corresponding 
unit test file. Use mocktail for mocking dependencies.
```

### 5. Respect Line Length Limits

**Always enforce a maximum line length of 120 characters** in all generated code and files,
unless it is impossible to do so (e.g., long URLs, auto-generated code that cannot be wrapped).

When asking agents to generate code, explicitly request this:

```
Generate this code with a maximum line length of 120 characters. 
Break long lines appropriately (function arguments, method chains, 
string concatenations, etc.) to stay within this limit.
```

Examples of proper wrapping:
```dart
// ✅ Good: Long parameter list wrapped
final result = someVeryLongFunctionName(
  parameter1: value1,
  parameter2: value2,
  parameter3: value3,
);

// ✅ Good: Long string broken into parts
final message = 'This is a very long message that exceeds '
    'the line length limit so it is split across '
    'multiple lines for readability';

// ✅ Good: Method chains wrapped
final data = repository
    .fetchItems()
    .where((item) => item.isActive)
    .map((item) => item.toModel())
    .toList();

// ❌ Avoid: Exceeding 120 characters
final result = someVeryLongFunctionName(parameter1: value1, parameter2: value2, parameter3: value3);
```

### 6. Address All Lint Issues Properly

**All generated code must pass linting without any issues**, including info-level warnings.
Do NOT skip lint issues using ignore comments or linter overrides.

When asking agents to generate code, explicitly request this:

```
Generate this code following all project lint rules. After generation, 
run `flutter analyze` and fix any issues found (errors, warnings, and 
info-level issues). Do not use ignore comments.
```

Best practices:
- ✅ Fix the root cause of lint issues (e.g., restructure code, rename variables)
- ✅ Follow Dart/Flutter best practices to prevent lint violations
- ✅ Use modern language features and idioms
- ✅ Request agents to run analysis and report results
- ❌ Never use `// ignore:` or `// ignore_for_file:` comments
- ❌ Never suppress warnings with linter configuration
- ❌ Never commit code with unaddressed lint issues

Example prompt:
```
After generating the code, run `flutter analyze` and show me any 
lint issues. Fix all issues (errors, warnings, and info) by improving 
the code, not by adding ignore comments.
```

---

## Common Agent Tasks

### Task 1: Create a New Feature Module

```
Agent, scaffold a new feature module for [feature_name]:

1. Create folder structure:
   lib/features/[feature_name]/
   ├── domain/
   │   ├── entities/
   │   ├── repositories/
   │   └── usecases/
   ├── data/
   │   ├── models/
   │   ├── datasources/
   │   └── repositories/
   └── presentation/
       ├── pages/
       ├── widgets/
       └── providers/

2. Create barrel file: lib/features/[feature_name]/[feature_name].dart

Follow the pattern in docs/architecture.md.
```

### Task 2: Add a New Field to an Entity

```
Agent, add a "dueDate" field to the Todo entity:

1. Update lib/features/todos/domain/entities/todo.dart
2. Update lib/features/todos/data/models/todo_model.dart
3. Update Firestore schema documentation
4. Update all usecases that create/update todos
5. Update UI to display due date
6. Run code generation after

Show me each file change separately.
```

### Task 3: Implement a New Use Case

```
Agent, create a new use case: ArchiveTodoUseCase

Requirements:
- Input: todoId, listId
- Validation: Check todo exists and user has permission
- Action: Update todo.archived = true in Firestore
- Error handling: Handle not found, permission denied
- Return: Updated Todo or throw exception

Place in lib/features/todos/domain/usecases/archive_todo.dart
Follow the pattern of other use cases.
Include unit tests.
```

### Task 4: Create a New UI Component

```
Agent, create a TodoCard widget for the card view:

Design specs from docs/design.md:
- Material 3 Card with elevation
- Title (max 2 lines, ellipsis)
- Status badge (top-right)
- Assignee avatar (bottom-left)
- Due date (if set)
- Priority color accent
- Tap to open detail
- Long press for context menu

Make it a ConsumerWidget using Riverpod.
Include hover effects for web/desktop.
```

### Task 5: Write Firestore Security Rules

```
Agent, generate Firestore security rules for the todos collection:

Requirements:
- Users can only read todos in lists they're collaborators of
- Users can create todos in lists they're collaborators of
- Users can update todos they created or are assigned to
- Only list owners can delete todos
- Check user is authenticated

Reference the pattern in docs/architecture.md security rules section.
```

### Task 6: Create Integration Tests

```
Agent, write an integration test for the todo creation flow:

Test scenario:
1. User signs in
2. Creates a new list
3. Adds a todo to the list
4. Verifies todo appears in the list
5. Completes the todo
6. Verifies status updates

Use integration_test package.
Mock Firebase with emulators.
```

---

## Testing with Agents

### Unit Test Generation

```
Agent, generate unit tests for [ClassName]:

Test cases to cover:
1. Success path: [describe expected behavior]
2. Edge cases: [list edge cases]
3. Error cases: [list error scenarios]
4. Validation: [list validation rules]

Use:
- mocktail for mocking
- arrange-act-assert pattern
- descriptive test names
- group related tests

Target: >80% code coverage
```

### Widget Test Generation

```
Agent, generate widget tests for [WidgetName]:

Test:
1. Widget renders correctly with data
2. Widget renders empty state
3. User interactions (taps, swipes, etc.)
4. State changes update UI
5. Error state displays correctly

Mock providers using ProviderScope with overrides.
```

### Integration Test Guidance

```
Agent, help me set up integration tests for [feature]:

1. Configure Firebase emulators
2. Create test user accounts
3. Seed test data
4. Run through user journey
5. Verify end-to-end behavior
6. Clean up after tests
```

---

## Debugging with Agents

### Error Analysis Prompts

```
Agent, I'm getting this error:
[paste error message]

Context:
- File: [file path]
- What I was trying to do: [description]
- Recent changes: [what you changed]

Please:
1. Explain what the error means
2. Identify the likely cause
3. Suggest a fix
4. Show updated code if applicable
```

### Performance Issues

```
Agent, the [feature] is slow:

Symptoms:
- [describe slow behavior]
- Happens when: [conditions]
- Performance: [e.g., "takes 5 seconds"]

Help me:
1. Identify the bottleneck
2. Profile the code
3. Suggest optimizations
4. Show optimized implementation
```

### State Management Issues

```
Agent, my Riverpod provider isn't updating the UI:

Code:
[paste provider code]
[paste widget code]

Expected: UI updates when data changes
Actual: UI doesn't update

Debug this issue.
```

---

## Agent Limitations

### What Agents Do Well

✅ **Excellent for:**
- Generating boilerplate code (models, repositories, etc.)
- Creating tests from specifications
- Implementing well-defined features
- Code refactoring with clear goals
- Documentation generation
- Following established patterns
- Suggesting library usage
- Debugging with clear error messages

### What Agents Struggle With

❌ **Limited in:**
- Making high-level architectural decisions
- Understanding complex project context without guidance
- Keeping track of changes across many files
- Balancing trade-offs (performance vs. simplicity)
- Creative UI/UX design decisions
- Knowing current versions of dependencies
- Understanding business logic nuances

### Best Practices to Mitigate Limitations

1. **Break Down Complex Tasks**
   - Don't ask agent to "implement entire feature"
   - Break into: entity → repository → use case → UI → tests

2. **Provide Explicit Context**
   - Reference specific files and sections
   - Paste relevant code snippets
   - Explain the "why" not just the "what"

3. **Verify Generated Code**
   - Always review generated code
   - Run tests immediately
   - Check for deprecated APIs
   - Verify imports are correct

4. **Iterate and Refine**
   - Start with basic implementation
   - Ask agent to improve/optimize
   - Request specific changes
   - Refactor in steps

5. **Use Multiple Agents**
   - Use Copilot for inline completions
   - Use Claude/ChatGPT for complex explanations
   - Use Cursor for codebase-aware refactoring

---

## Advanced Agent Techniques

### Chain of Thought Prompting

```
Agent, think step-by-step about implementing offline sync:

1. First, analyze what data needs to sync
2. Then, consider conflict resolution strategies
3. Next, design the local cache structure
4. Finally, implement the sync logic

Show your reasoning at each step before showing code.
```

### Constraint-Based Generation

```
Agent, create the Settings page with these constraints:

Must have:
- Account section (username, email, avatar)
- Theme switcher (light/dark/auto)
- Notification preferences
- Sign out button

Must NOT have:
- More than 3 levels of nesting
- Custom widgets (use Material components)
- Complex state management

Keep it simple and clean.
```

### Comparative Implementations

```
Agent, show me two approaches to implementing [feature]:

Approach 1: [describe approach]
Pros and cons:

Approach 2: [describe approach]
Pros and cons:

Recommend which approach for this project and why.
```

### Documentation-First Development

```
Agent, before writing code, create documentation for [feature]:

1. Write the public API documentation
2. Describe expected behavior
3. List edge cases
4. Show example usage

Then generate the implementation that matches the docs.
```

---

## Agent Workflow Examples

### Example 1: Complete Feature Implementation

```markdown
Session Goal: Implement todo assignment feature

Prompt 1: "Review docs/requirements.md REQ-5.1 and REQ-5.2. 
Explain the assignment feature requirements in your own words."

Prompt 2: "Update the Todo entity to include assignedTo field 
(array of user IDs). Show complete updated entity."

Prompt 3: "Update TodoModel with Firestore serialization for 
assignedTo. Show complete model."

Prompt 4: "Create AssignTodoUseCase that validates user exists 
before assigning. Include error handling."

Prompt 5: "Update list detail page to show assignee avatars on 
todo items. Reference docs/design.md for avatar size and placement."

Prompt 6: "Generate unit tests for AssignTodoUseCase."

Prompt 7: "Run tests and fix any issues."
```

### Example 2: Bug Fix with Agent

```markdown
Issue: Todo completion not syncing to Firestore

Prompt 1: "I have a bug where todo completion doesn't sync. Here's 
the code: [paste CompleteTodoUseCase]. What's wrong?"

Prompt 2: "You identified the issue. Now show me the corrected 
complete file with the fix."

Prompt 3: "Generate a test that would have caught this bug."

Prompt 4: "Update the documentation to explain the correct pattern."
```

### Example 3: Refactoring with Agent

```markdown
Goal: Refactor authentication to use better error handling

Prompt 1: "Analyze lib/features/auth/ and identify areas where 
error handling could be improved."

Prompt 2: "Show me a better error handling pattern using sealed 
classes and the freezed package."

Prompt 3: "Refactor AuthRepository to use the new error pattern. 
Show updated interface and implementation."

Prompt 4: "Update all usecases to handle the new error types."

Prompt 5: "Update UI to display user-friendly error messages."

Prompt 6: "Update tests to cover new error scenarios."
```

---

## Productivity Tips

### 1. Create Template Prompts

Save commonly used prompts:

```markdown
## My Template Prompts

### New Entity Template
"Create a [EntityName] entity in lib/features/[feature]/domain/entities/ 
with Freezed. Fields: [list fields]. Reference docs/architecture.md 
for pattern."

### New Repository Template
"Create [Name]Repository interface with methods: [list methods]. 
Then create implementation using Firestore in data/repositories/."

### New Page Template
"Create [PageName] in lib/features/[feature]/presentation/pages/. 
ConsumerWidget with Riverpod. Reference docs/design.md for layout."
```

### 2. Use Agent for Code Review

```
Agent, review this code for:
1. Clean architecture violations
2. Riverpod best practices
3. Error handling completeness
4. Test coverage gaps
5. Performance issues
6. Accessibility concerns

[paste code]
```

### 3. Generate Documentation

```
Agent, generate dartdoc comments for this class following these rules:
- Clear one-line summary
- Detailed description
- Parameter descriptions
- Return value description
- Throws documentation
- Usage example

[paste code]
```

### 4. Batch Similar Tasks

```
Agent, I need to create 5 similar use cases:
1. CreateTodoUseCase
2. UpdateTodoUseCase
3. DeleteTodoUseCase
4. ArchiveTodoUseCase
5. UnarchiveTodoUseCase

They all follow the same pattern. Generate them as a batch with:
- Similar structure
- Consistent error handling
- Matching test coverage
```

---

## Final Recommendations

### DO's ✅

- ✅ Always reference project documentation
- ✅ Break complex tasks into smaller prompts
- ✅ Verify generated code compiles and tests pass
- ✅ Request tests alongside implementation
- ✅ Ask for explanations, not just code
- ✅ Iterate on generated code
- ✅ Use agents for boilerplate and patterns
- ✅ Keep conversations focused on one feature
- ✅ Save successful prompts for reuse

### DON'Ts ❌

- ❌ Don't assume agent knows project context
- ❌ Don't accept code without reviewing
- ❌ Don't skip tests "to save time"
- ❌ Don't let agent make architectural decisions alone
- ❌ Don't paste entire files (extract relevant parts)
- ❌ Don't ask vague questions
- ❌ Don't commit generated code without testing
- ❌ Don't ignore agent suggestions without reason
- ❌ **Never bypass pre-commit hooks (no `--no-verify` flags)** - Even if you bypass local
  hooks, CI/CD will enforce them anyway, causing PR failures and wasted time

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────┐
│  AI AGENT QUICK REFERENCE FOR FAISEUR          │
├─────────────────────────────────────────────────┤
│                                                 │
│  Start Prompt Template:                         │
│  "Working on [feature] in [phase]. Reference    │
│   docs/[doc].md. Need: [specific task]."        │
│                                                 │
│  Key Context Files:                             │
│  - docs/architecture.md (tech design)           │
│  - docs/requirements.md (what to build)         │
│  - docs/implementation-plan.md (how to build)   │
│                                                 │
│  Code Generation Pattern:                       │
│  1. Domain (entities, repos)                    │
│  2. Data (models, datasources)                  │
│  3. Presentation (UI, providers)                │
│  4. Tests (unit, widget, integration)           │
│                                                 │
│  Always Request:                                │
│  ✓ Complete files (not snippets)                │
│  ✓ Tests alongside code                         │
│  ✓ Error handling                               │
│  ✓ Documentation comments                       │
│                                                 │
│  Verify Before Committing:                      │
│  ✓ flutter analyze                              │
│  ✓ flutter test                                 │
│  ✓ Code follows architecture                    │
│  ✓ Tests pass                                   │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

**Remember:** AI agents are powerful tools, but you're the architect. Use agents to
accelerate development while maintaining code quality and architectural integrity.

**Last Updated:** October 23, 2025
