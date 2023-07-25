import '../../domain/cell_coord.dart';
import '../../domain/cell_coord_selection.dart';
import '../datasource/prefs_datasource.dart';

class PrefsRepository {
  final PrefsDataSource datasource;

  const PrefsRepository(this.datasource);

  Future<CellCoordSelection> getNameCellIndex() async {
    final int? row = await datasource.getNameCellRowIndex();
    final int? col = await datasource.getNameCellColIndex();
    final int? rowLimit = await datasource.getNameCellRowIndexLimit();
    final int? colLimit = await datasource.getNameCellColIndexLimit();

    CellCoord? start;
    if (row != null && col != null) start = CellCoord(row, col);
    CellCoord? limit;
    if (rowLimit != null && colLimit != null) limit = CellCoord(rowLimit, colLimit);
    return CellCoordSelection(start, limit);
  }

  Future<bool> setNameCellIndex({CellCoord? start, CellCoord? limit}) async {
    assert(start != null || limit != null);
    bool startUpdateResponse = true;
    bool limitUpdateResponse = true;
    if (start != null) {
      startUpdateResponse = await datasource.setNameCellRowIndex(start.row) && await datasource.setNameCellColIndex(start.col);
    }
    if (limit != null) {
      limitUpdateResponse = await datasource.setNameCellRowIndexLimit(limit.row) && await datasource.setNameCellColIndexLimit(limit.col);
    }

    return startUpdateResponse && limitUpdateResponse;
  }

  Future<CellCoordSelection> getQuantityCellIndex() async {
    final int? row = await datasource.getQuantityCellRowIndex();
    final int? col = await datasource.getQuantityCellColIndex();
    final int? rowLimit = await datasource.getQuantityCellRowIndexLimit();
    final int? colLimit = await datasource.getQuantityCellColIndexLimit();

    CellCoord? start;
    if (row != null && col != null) start = CellCoord(row, col);
    CellCoord? limit;
    if (rowLimit != null && colLimit != null) limit = CellCoord(rowLimit, colLimit);
    return CellCoordSelection(start, limit);
  }

  Future<bool> setQuantityCellIndex({CellCoord? start, CellCoord? limit}) async {
    assert(start != null || limit != null);
    bool startUpdateResponse = true;
    bool limitUpdateResponse = true;
    if (start != null) {
      startUpdateResponse = await datasource.setQuantityCellRowIndex(start.row) && await datasource.setQuantityCellColIndex(start.col);
    }
    if (limit != null) {
      limitUpdateResponse = await datasource.setQuantityCellRowIndexLimit(limit.row) && await datasource.setQuantityCellColIndexLimit(limit.col);
    }
    return startUpdateResponse && limitUpdateResponse;
  }

  Future<CellCoordSelection> getHeightCellIndex() async {
    final int? row = await datasource.getHeightCellRowIndex();
    final int? col = await datasource.getHeightCellColIndex();
    final int? rowLimit = await datasource.getHeightCellRowIndexLimit();
    final int? colLimit = await datasource.getHeightCellColIndexLimit();

    CellCoord? start;
    if (row != null && col != null) start = CellCoord(row, col);
    CellCoord? limit;
    if (rowLimit != null && colLimit != null) limit = CellCoord(rowLimit, colLimit);
    return CellCoordSelection(start, limit);
  }

  Future<bool> setHeightCellIndex({CellCoord? start, CellCoord? limit}) async {
    assert(start != null || limit != null);
    bool startUpdateResponse = true;
    bool limitUpdateResponse = true;
    if (start != null) {
      startUpdateResponse = await datasource.setHeightCellRowIndex(start.row) && await datasource.setHeightCellColIndex(start.col);
    }
    if (limit != null) {
      limitUpdateResponse = await datasource.setHeightCellRowIndexLimit(limit.row) && await datasource.setHeightCellColIndexLimit(limit.col);
    }
    return startUpdateResponse && limitUpdateResponse;
  }

  Future<CellCoordSelection> getWidthCellIndex() async {
    final int? row = await datasource.getWidthCellRowIndex();
    final int? col = await datasource.getWidthCellColIndex();
    final int? rowLimit = await datasource.getWidthCellRowIndexLimit();
    final int? colLimit = await datasource.getWidthCellColIndexLimit();

    CellCoord? start;
    if (row != null && col != null) start = CellCoord(row, col);
    CellCoord? limit;
    if (rowLimit != null && colLimit != null) limit = CellCoord(rowLimit, colLimit);
    return CellCoordSelection(start, limit);
  }

  Future<bool> setWidthCellIndex({CellCoord? start, CellCoord? limit}) async {
    assert(start != null || limit != null);
    bool startUpdateResponse = true;
    bool limitUpdateResponse = true;
    if (start != null) {
      startUpdateResponse = await datasource.setWidthCellRowIndex(start.row) && await datasource.setWidthCellColIndex(start.col);
    }
    if (limit != null) {
      limitUpdateResponse = await datasource.setWidthCellRowIndexLimit(limit.row) && await datasource.setWidthCellColIndexLimit(limit.col);
    }
    return startUpdateResponse && limitUpdateResponse;
  }
}