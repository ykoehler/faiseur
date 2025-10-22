/// Input validators for Faiseur forms.
///
/// Provides reusable validation functions for common input types.
library;

import 'package:faiseur/core/constants/app_constants.dart';
import 'package:faiseur/core/extensions/string_extensions.dart';

/// Form validators for input validation
class Validators {
  Validators._(); // Private constructor to prevent instantiation

  /// Validates required fields
  static String? required(String? value) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    return null;
  }

  /// Validates email format
  static String? email(String? value) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if (!(value?.isValidEmail ?? false)) {
      return ValidationConstants.invalidEmail;
    }
    return null;
  }

  /// Validates password strength
  static String? password(String? value) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if ((value?.length ?? 0) < ValidationConstants.minPasswordLength) {
      return 'Password must be at least '
          '${ValidationConstants.minPasswordLength} characters';
    }
    if ((value?.length ?? 0) > ValidationConstants.maxPasswordLength) {
      return 'Password cannot exceed '
          '${ValidationConstants.maxPasswordLength} characters';
    }
    return null;
  }

  /// Validates password confirmation
  static String? confirmPassword(String? value, String? originalPassword) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  /// Validates username format
  static String? username(String? value) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if ((value?.length ?? 0) < ValidationConstants.minUsernameLength) {
      return 'Username must be at least '
          '${ValidationConstants.minUsernameLength} characters';
    }
    if ((value?.length ?? 0) > ValidationConstants.maxUsernameLength) {
      return 'Username cannot exceed '
          '${ValidationConstants.maxUsernameLength} characters';
    }
    if (!RegExp(ValidationConstants.usernamePattern).hasMatch(value ?? '')) {
      return ValidationConstants.invalidUsername;
    }
    return null;
  }

  /// Validates list name
  static String? listName(String? value) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if ((value?.length ?? 0) < ValidationConstants.minListNameLength) {
      return 'List name must have at least one character';
    }
    if ((value?.length ?? 0) > ValidationConstants.maxListNameLength) {
      return 'List name cannot exceed '
          '${ValidationConstants.maxListNameLength} characters';
    }
    return null;
  }

  /// Validates todo title
  static String? todoTitle(String? value) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if ((value?.length ?? 0) < ValidationConstants.minTodoTitleLength) {
      return 'Todo title must have at least one character';
    }
    if ((value?.length ?? 0) > ValidationConstants.maxTodoTitleLength) {
      return 'Todo title cannot exceed '
          '${ValidationConstants.maxTodoTitleLength} characters';
    }
    return null;
  }

  /// Validates todo description
  static String? todoDescription(String? value) {
    if ((value?.length ?? 0) > ValidationConstants.maxTodoDescriptionLength) {
      return 'Description cannot exceed '
          '${ValidationConstants.maxTodoDescriptionLength} characters';
    }
    return null;
  }

  /// Validates minimum length
  static String? minLength(String? value, int minLength) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if ((value?.length ?? 0) < minLength) {
      return 'Must be at least $minLength characters';
    }
    return null;
  }

  /// Validates maximum length
  static String? maxLength(String? value, int maxLength) {
    if ((value?.length ?? 0) > maxLength) {
      return 'Cannot exceed $maxLength characters';
    }
    return null;
  }

  /// Validates that value is within min and max length
  static String? lengthRange(String? value, int min, int max) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    final length = value!.length;
    if (length < min) {
      return 'Must be at least $min characters';
    }
    if (length > max) {
      return 'Cannot exceed $max characters';
    }
    return null;
  }

  /// Validates custom pattern
  static String? pattern(String? value, String pattern, String message) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if (!RegExp(pattern).hasMatch(value ?? '')) {
      return message;
    }
    return null;
  }

  /// Validates URL format
  static String? url(String? value) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if (!(value?.isValidUrl ?? false)) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  /// Validates numeric value
  static String? numeric(String? value) {
    if (value?.isBlankNullOrEmpty ?? true) {
      return ValidationConstants.requiredField;
    }
    if (int.tryParse(value ?? '') == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  /// Validates numeric range
  static String? numericRange(String? value, int min, int max) {
    final numError = numeric(value);
    if (numError != null) {
      return numError;
    }

    final num = int.parse(value!);
    if (num < min || num > max) {
      return 'Must be between $min and $max';
    }
    return null;
  }

  /// Compose multiple validators
  static String? compose(String? value, List<String? Function(String?)> validators) {
    for (final validator in validators) {
      final result = validator(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
