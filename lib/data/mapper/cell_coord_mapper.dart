import 'package:excel2maxcut/domain/cell_coord.dart';

import '../entity/cell_coords_entity.dart';

class CellCoordMapper {
  static CellCoordEntity toEntity(CellCoord model) {
    return (model.row, model.col);
  }

  static CellCoord toModel(CellCoordEntity entity) {
    return CellCoord(entity.$1, entity.$2);
  }
}
