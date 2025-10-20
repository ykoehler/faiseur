/// String utility extensions for Faiseur.
///
/// Provides convenient methods for common string operations
/// like trimming, validation, and formatting.

/// Extension methods on String
extension StringExtensions on String {
  /// Returns true if string is null, empty, or contains only whitespace
  bool get isBlankNullOrEmpty => isEmpty || trim().isEmpty;

  /// Returns true if string is not blank or empty
  bool get isNotBlankOrEmpty => !isBlankNullOrEmpty;

  /// Returns string with whitespace trimmed, returns empty if null
  String get trimmed => trim();

  /// Capitalizes the first character of the string
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalizes the first character of each word
  String get capitalizeEachWord {
    if (isEmpty) return this;
    return split(' ')
        .map((word) => word.capitalize)
        .join(' ');
  }

  /// Returns string with all lowercase
  String get lowercase => toLowerCase();

  /// Returns string with all uppercase
  String get uppercase => toUpperCase();

  /// Truncates string to maxLength and adds ellipsis if longer
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength - ellipsis.length)}$ellipsis';
  }

  /// Returns true if string matches email regex pattern
  bool get isValidEmail {
    const pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    return RegExp(pattern).hasMatch(this);
  }

  /// Returns true if string contains only alphanumeric characters
  bool get isAlphanumeric => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);

  /// Returns true if string contains only letters
  bool get isAlpha => RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  /// Returns true if string contains only digits
  bool get isNumeric => RegExp(r'^[0-9]+$').hasMatch(this);

  /// Converts string to integer, returns null if invalid
  int? toIntOrNull() {
    try {
      return int.parse(this);
    } catch (e) {
      return null;
    }
  }

  /// Converts string to double, returns null if invalid
  double? toDoubleOrNull() {
    try {
      return double.parse(this);
    } catch (e) {
      return null;
    }
  }

  /// Removes all whitespace from string
  String removeWhitespace() => replaceAll(RegExp(r'\s+'), '');

  /// Returns true if string is a valid URL
  bool get isValidUrl {
    try {
      Uri.parse(this);
      return toString().startsWith('http');
    } catch (e) {
      return false;
    }
  }

  /// Returns slug version of string (lowercase, dashes instead of spaces)
  String get toSlug {
    return lowercase
        .replaceAll(RegExp(r'[^\w\s-]'), '')
        .trim()
        .replaceAll(RegExp(r'[-\s]+'), '-');
  }

  /// Splits string into chunks of specified size
  List<String> chunk(int size) {
    if (size <= 0) return [];
    final chunks = <String>[];
    for (int i = 0; i < length; i += size) {
      chunks.add(substring(i, i + size > length ? length : i + size));
    }
    return chunks;
  }
}

/// Extension methods on List<String>
extension ListStringExtensions on List<String> {
  /// Joins strings with separator, filtering out empty strings
  String joinNonEmpty(String separator) {
    return where((s) => s.isNotBlankOrEmpty).join(separator);
  }

  /// Returns CSV representation
  String toCsv() => joinNonEmpty(',');
}
