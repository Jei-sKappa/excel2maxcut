import 'package:excel/excel.dart';

import '../core/extension/number_to_aphabet.dart';

class CellCoord {
  final int row;
  final int col;
  const CellCoord(this.row, this.col);

  static CellCoord fromCellIndex(CellIndex index) => CellCoord(index.rowIndex, index.columnIndex);

  @override
  String toString() => "${(col + 1).toAlphabet()}${row + 1}";
}