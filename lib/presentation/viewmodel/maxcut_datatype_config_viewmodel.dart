import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_module.dart';
import '../../domain/datatype_config.dart';
import '../../domain/maxcutdata.dart';
import '../state/state.dart';

part 'maxcut_datatype_config_viewmodel.g.dart';

@riverpod
class MaxCutDataTypeConfigViewModel extends _$MaxCutDataTypeConfigViewModel {
  @override
  State<DataTypeConfig?> build(MaxCutDataType dataType) {
    _load();
    return const State.loading();
  }

  DataTypeConfigKey get _dataTypeKey => dataType.fieldName;

  Future<void> _load() async {
    final repository = ref.read(dataTypeConfigRepositoryProvider);
    final coords = await repository.getConfig(_dataTypeKey);
    state = State.success(coords);
  }

  Future<void> _update(DataTypeConfig config) async {
    final repository = ref.read(dataTypeConfigRepositoryProvider);
    final completed = await repository.setConfig(config);
    if (!completed) {
      state = State.error(Exception("Error while saving the config"));
    } else {
      _load();
    }
  }

  Future<void> addDefaultValue(String newValue) async {
    state = const State.loading();

    final repository = ref.read(dataTypeConfigRepositoryProvider);
    final currentConfig = await repository.getConfig(_dataTypeKey);
    final newConfig = currentConfig.copyWith(
      defaultValues: [...currentConfig.defaultValues ?? [], newValue],
    );
    save(newConfig);
  }

  Future<void> save(DataTypeConfig config) async {
    state = const State.loading();

    final repository = ref.read(dataTypeConfigRepositoryProvider);
    final currentConfig = await repository.getConfig(_dataTypeKey);
    //TODO: Use Equatable or Freezed for equality check (IN ALL DOMAIN MODELS not only this one)
    // 'cause probabily right now this equality check is always false
    if (currentConfig == config) {
      state = State.success(config);
      return;
    }

    _update(config);
  }
}
