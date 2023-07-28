import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/cell_coord.dart';
import '../state/state.dart';
import 'cell_coord_viewmodel.dart';
import 'config_type_viewmodel.dart';

part 'cell_content_viewmodel.g.dart';

//TODO: Implement this
enum CellState {
  normal,
  hovered,
  selected,
}

@riverpod
class CellContentViewModel extends _$CellContentViewModel {
  @override
  State<CellState> build() => const State.success(CellState.normal);

  void tapHanlder(CellCoord coord) {
    final selectedConfigType = ref.read(selectedConfigTypeViewModelProvider);
    if (selectedConfigType == null){
      //TODO: Show warning in some way
      return;
    }

    final cellCoordViewModel = ref.read(cellCoordViewModelProvider(selectedConfigType).notifier);
    cellCoordViewModel.save(coord);
  }
}
