import 'package:excel2maxcut/data/datasource/prefs_datasource.dart';
import 'package:excel2maxcut/data/repository/prefs_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/database/database_provider.dart';

part 'data_module.g.dart';

@riverpod
PrefsDataSource _plannerDatasource(_PlannerDatasourceRef ref) {
  final database = ref.watch(databaseProvider.future);
  return PrefsDataSource(database);
}

@riverpod
PrefsRepository prefsRepository(PrefsRepositoryRef ref) {
  return PrefsRepository(ref.read(_plannerDatasourceProvider));
}
