import 'package:excel2maxcut/data/repository/cell_coords_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/database/database_provider.dart';
import 'datasource/cell_coords_datasource.dart';

part 'data_module.g.dart';

@riverpod
CellCoordsDataSource _cellCoordsDatasource(_CellCoordsDatasourceRef ref) {
  final database = ref.watch(databaseProvider.future);
  return CellCoordsDataSource(database);
}

@riverpod
CellCoordsRepository cellCoordsRepository(CellCoordsRepositoryRef ref) {
  return CellCoordsRepository(ref.read(_cellCoordsDatasourceProvider));
}
