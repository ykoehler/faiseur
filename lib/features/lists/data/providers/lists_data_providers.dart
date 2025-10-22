import 'package:faiseur/core/data/datasources/firestore_datasource_impl.dart';
import 'package:faiseur/features/lists/data/datasources/lists_remote_datasource.dart';
import 'package:faiseur/features/lists/data/datasources/lists_remote_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lists_data_providers.g.dart';

/// Provider for FirestoreDatasourceImpl singleton
@riverpod
FirestoreDatasourceImpl firestoreDatasource(Ref ref) =>
    FirestoreDatasourceImpl();

/// Provider for ListsRemoteDatasource
@riverpod
ListsRemoteDatasource listsRemoteDatasource(Ref ref) =>
    ListsRemoteDatasourceImpl(
      firestoreDatasource: ref.watch(firestoreDatasourceProvider),
    );
