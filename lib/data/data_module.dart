import 'package:excel2maxcut/data/repository/cell_coords_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/database/database_provider.dart';
import 'datasource/cell_coords_datasource.dart';
import 'datasource/datatype_config_datasource.dart';
import 'repository/datatype_config_repository.dart';

part 'data_module.g.dart';

@riverpod
CellCoordsDataSource _cellCoordsDatasource(_CellCoordsDatasourceRef ref) {
  final database = ref.watch(databaseProvider.future);
  return CellCoordsDataSource(database);
}

@riverpod
DataTypeConfigDataSource _dataTypeConfigDatasource(_DataTypeConfigDatasourceRef ref) {
  final database = ref.watch(databaseProvider.future);
  return DataTypeConfigDataSource(database);
}

@riverpod
CellCoordsRepository cellCoordsRepository(CellCoordsRepositoryRef ref) {
  return CellCoordsRepository(ref.read(_cellCoordsDatasourceProvider));
}

@riverpod
DataTypeConfigRepository dataTypeConfigRepository(DataTypeConfigRepositoryRef ref) {
  return DataTypeConfigRepository(ref.read(_dataTypeConfigDatasourceProvider));
}
