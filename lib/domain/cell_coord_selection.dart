import 'cell_coord.dart';

class CellCoordSelection {
  final CellCoord? start;
  final CellCoord? limit;
  const CellCoordSelection(this.start, this.limit);
}

class NotNullCellCoordSelection extends CellCoordSelection {
  @override
  CellCoord get start => super.start!;

  @override
  CellCoord get limit => super.limit!;
  const NotNullCellCoordSelection(CellCoord start, CellCoord limit) : super(start, limit);
}
