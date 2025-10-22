import 'package:faiseur/core/data/datasources/firestore_datasource_impl.dart';
import 'package:faiseur/features/todos/data/datasources/todos_remote_datasource.dart';
import 'package:faiseur/features/todos/data/datasources/todos_remote_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_data_providers.g.dart';

/// Provider for FirestoreDatasourceImpl singleton
@riverpod
FirestoreDatasourceImpl firestoreDatasource(Ref ref) => FirestoreDatasourceImpl();

/// Provider for TodosRemoteDatasource
@riverpod
TodosRemoteDatasource todosRemoteDatasource(Ref ref) =>
    TodosRemoteDatasourceImpl(firestoreDatasource: ref.watch(firestoreDatasourceProvider));
