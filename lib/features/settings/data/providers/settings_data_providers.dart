import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faiseur/features/settings/data/datasources/settings_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_data_providers.g.dart';

/// Provider for Firestore instance singleton.
@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) => FirebaseFirestore.instance;

/// Provider for settings remote datasource.
@riverpod
SettingsRemoteDatasource settingsRemoteDatasource(Ref ref) =>
    SettingsRemoteDatasourceImpl(
      firestore: ref.watch(firebaseFirestoreProvider),
    );
