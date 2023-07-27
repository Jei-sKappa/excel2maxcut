import 'cell_coord.dart';

/// Represents a selection of cells in a grid.
/// Es: A3 -> A7
/// [from]: 4
/// [to]: 8
/// [fixed]: 0
/// [isVertical]: true
class CellSelection {
  final int from;
  final int to;
  final int fixed;
  final bool isVertical;

  const CellSelection({
    required this.from,
    required this.to,
    required this.fixed,
    required this.isVertical,
  });

  /// Returns the [CellSelection] from the given [CellCoord]s.
  /// Is Null if the given [CellCoord]s are not valid.
  static CellSelection? fromCellCoords({
    required CellCoord start,
    required CellCoord limit,
  }) {
    final isVertical = start.col == limit.col;
    final isHorizontal = start.row == limit.row;

    /// Between [isVertical] and [isHorizontal] only one can be true
    if (isVertical == isHorizontal) {
      return null;
    }

    // Fill Data
    if (isVertical) {
      return CellSelection(fixed: start.col, from: start.row, to: limit.row, isVertical: true);
    } else {
      return CellSelection(fixed: start.row, from: start.col, to: limit.col, isVertical: false);
    }
  }
}

// class NamedCellSelection {
//   final String name;
//   final CellSelection? value;

//   const NamedCellSelection(this.name, [this.value]);
// }
