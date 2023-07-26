import '../../domain/cell_coord.dart';
import '../../presentation/viewmodel/config_type_viewmodel.dart';
import '../datasource/prefs_datasource.dart';
import '../mapper/prefs_mapper.dart';

class PrefsRepository {
  final PrefsDataSource datasource;

  const PrefsRepository(this.datasource);

  Future<CellCoord?> get(ConfigType configType){
    switch (configType) {
      case ConfigType.name:
        return _getStartNameCoord();
      case ConfigType.nameLimit:
        return _getLimitNameCoord();
      case ConfigType.quantity:
        return _getStartQuantityCoord();
      case ConfigType.quantityLimit:
        return _getLimitQuantityCoord();
      case ConfigType.height:
        return _getStartHeightCoord();
      case ConfigType.heightLimit:
        return _getLimitHeightCoord();
      case ConfigType.width:
        return _getStartWidthCellIndex();
      case ConfigType.widthLimit:
        return _getLimitWidthCellIndex();
    }
  }

  Future<bool> set(ConfigType configType, CellCoord coord) {
    switch (configType) {
      case ConfigType.name:
        return _setStartNameCellIndex(coord);
      case ConfigType.nameLimit:
        return _setLimitNameCellIndex(coord);
      case ConfigType.quantity:
        return _setStartQuantityCellIndex(coord);
      case ConfigType.quantityLimit:
        return _setLimitQuantityCellIndex(coord);
      case ConfigType.height:
        return _setStartHeightCellIndex(coord);
      case ConfigType.heightLimit:
        return _setLimitHeightCellIndex(coord);
      case ConfigType.width:
        return _setStartWidthCellIndex(coord);
      case ConfigType.widthLimit:
        return _setLimitWidthCellIndex(coord);
    }
  }

  Future<CellCoord?> _getStartNameCoord() async {
    final row = await datasource.getNameCellRowIndex();
    final col = await datasource.getNameCellColIndex();
    if (row == null || col == null) return null;

    return PrefsMapper.toModel((row, col));
  }

  Future<bool> _setStartNameCellIndex(CellCoord coord) async {
    final rowResponse = await datasource.setNameCellRowIndex(coord.row);
    final colResponse = await datasource.setNameCellColIndex(coord.col);

    return rowResponse && colResponse;
  }

  Future<CellCoord?> _getLimitNameCoord() async {
    final row = await datasource.getNameCellRowIndexLimit();
    final col = await datasource.getNameCellColIndexLimit();
    if (row == null || col == null) return null;

    return PrefsMapper.toModel((row, col));
  }

  Future<bool> _setLimitNameCellIndex(CellCoord coord) async {
    final rowResponse = await datasource.setNameCellRowIndexLimit(coord.row);
    final colResponse = await datasource.setNameCellColIndexLimit(coord.col);

    return rowResponse && colResponse;
  }

  Future<CellCoord?> _getStartQuantityCoord() async {
    final row = await datasource.getQuantityCellRowIndex();
    final col = await datasource.getQuantityCellColIndex();
    if (row == null || col == null) return null;

    return PrefsMapper.toModel((row, col));
  }

  Future<bool> _setStartQuantityCellIndex(CellCoord coord) async {
    final rowResponse = await datasource.setQuantityCellRowIndex(coord.row);
    final colResponse = await datasource.setQuantityCellColIndex(coord.col);

    return rowResponse && colResponse;
  }

  Future<CellCoord?> _getLimitQuantityCoord() async {
    final row = await datasource.getQuantityCellRowIndexLimit();
    final col = await datasource.getQuantityCellColIndexLimit();
    if (row == null || col == null) return null;

    return PrefsMapper.toModel((row, col));
  }

  Future<bool> _setLimitQuantityCellIndex(CellCoord coord) async {
    final rowResponse = await datasource.setQuantityCellRowIndexLimit(coord.row);
    final colResponse = await datasource.setQuantityCellColIndexLimit(coord.col);

    return rowResponse && colResponse;
  }

  Future<CellCoord?> _getStartHeightCoord() async {
    final row = await datasource.getHeightCellRowIndex();
    final col = await datasource.getHeightCellColIndex();
    if (row == null || col == null) return null;

    return PrefsMapper.toModel((row, col));
  }

  Future<bool> _setStartHeightCellIndex(CellCoord coord) async {
    final rowResponse = await datasource.setHeightCellRowIndex(coord.row);
    final colResponse = await datasource.setHeightCellColIndex(coord.col);

    return rowResponse && colResponse;
  }

  Future<CellCoord?> _getLimitHeightCoord() async {
    final row = await datasource.getHeightCellRowIndexLimit();
    final col = await datasource.getHeightCellColIndexLimit();
    if (row == null || col == null) return null;

    return PrefsMapper.toModel((row, col));
  }

  Future<bool> _setLimitHeightCellIndex(CellCoord coord) async {
    final rowResponse = await datasource.setHeightCellRowIndexLimit(coord.row);
    final colResponse = await datasource.setHeightCellColIndexLimit(coord.col);

    return rowResponse && colResponse;
  }

  Future<CellCoord?> _getStartWidthCellIndex() async {
    final row = await datasource.getWidthCellRowIndex();
    final col = await datasource.getWidthCellColIndex();
    if (row == null || col == null) return null;

    return PrefsMapper.toModel((row, col));
  }

  Future<bool> _setStartWidthCellIndex(CellCoord coord) async {
    final rowResponse = await datasource.setWidthCellRowIndex(coord.row);
    final colResponse = await datasource.setWidthCellColIndex(coord.col);

    return rowResponse && colResponse;
  }

  Future<CellCoord?> _getLimitWidthCellIndex() async {
    final row = await datasource.getWidthCellRowIndexLimit();
    final col = await datasource.getWidthCellColIndexLimit();
    if (row == null || col == null) return null;

    return PrefsMapper.toModel((row, col));
  }

  Future<bool> _setLimitWidthCellIndex(CellCoord coord) async {
    final rowResponse = await datasource.setWidthCellRowIndexLimit(coord.row);
    final colResponse = await datasource.setWidthCellColIndexLimit(coord.col);

    return rowResponse && colResponse;
  }
}
