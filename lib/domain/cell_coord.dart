import 'package:excel/excel.dart';

import '../core/extension/number_to_aphabet_extension.dart';

class CellCoord {
  final int row;
  final int col;
  
  /// Cell Coordinates ([row], [column])
  const CellCoord(this.row, this.col);

  static CellCoord fromCellIndex(CellIndex index) => CellCoord(index.rowIndex, index.columnIndex);

  @override
  String toString() => "${(col + 1).toAlphabet()}${row + 1}";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CellCoord &&
      other.row == row &&
      other.col == col;
  }

  @override
  int get hashCode => row.hashCode ^ col.hashCode;
}