import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_module.dart';
import '../../domain/cell_coord.dart';
import '../state/state.dart';
import 'app_data_viewmodel.dart';
import 'config_type_viewmodel.dart';

part 'cell_coord_viewmodel.g.dart';

// @riverpod
// void allCellCoords(AllCellCoordsRef ref) {
//   ConfigTypeAction.actionAll((configType) {
//     ref.listen(
//       cellCoordViewModelProvider(configType),
//       (_, __) => ref.invalidateSelf(),
//     );
//   });
// }

@riverpod
class CellCoordViewModel extends _$CellCoordViewModel {
  @override
  State<CellCoord?> build(ConfigType configType) {
    _load();
    return const State.loading();
  }

  Future _load() async {
    final repository = ref.read(prefsRepositoryProvider);
    final coords = await repository.get(configType);
    state = State.success(coords);
  }

  Future save(CellCoord coord) async {
    state = const State.loading();

    final repository = ref.read(prefsRepositoryProvider);
    final currentCoord = await repository.get(configType);
    if(currentCoord == coord){
      state = State.success(coord);
      return;
    }

    ref.invalidate(appDataViewModelProvider); // AppData depends on this so when this changes, AppData should be invalidated
    final completed = await repository.set(configType, coord);
    if (!completed) {
      state = State.error(Exception("Error while saving the config"));
    } else {
      _load();
    }
  }
}
