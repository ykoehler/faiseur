import 'package:cloud_firestore/cloud_firestore.dart';

/// Convert a Firestore timestamp-like value into a [DateTime].
DateTime parseFirestoreTimestamp(dynamic value, {required String fieldName}) {
  if (value == null) {
    throw ArgumentError.notNull(fieldName);
  }
  if (value is DateTime) {
    return value;
  }
  if (value is Timestamp) {
    return value.toDate();
  }
  if (value is String) {
    return DateTime.parse(value);
  }
  if (value is int) {
    return DateTime.fromMillisecondsSinceEpoch(value);
  }
  if (value is double) {
    return DateTime.fromMillisecondsSinceEpoch(value.toInt());
  }
  throw ArgumentError('Unsupported timestamp value for "$fieldName": $value');
}

/// Convert a nullable Firestore timestamp-like value into a nullable [DateTime].
DateTime? parseFirestoreTimestampNullable(dynamic value, {required String fieldName}) {
  if (value == null) {
    return null;
  }
  return parseFirestoreTimestamp(value, fieldName: fieldName);
}

/// Convert a [DateTime] into the value expected by Firestore clients.
Object timestampFromDateTime(DateTime value) => Timestamp.fromDate(value);

/// Convert a nullable [DateTime] into a Firestore-friendly value.
Object? timestampFromNullableDateTime(DateTime? value) => value == null ? null : timestampFromDateTime(value);
