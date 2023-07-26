import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_type_viewmodel.g.dart';

enum ConfigType {
  name,
  nameLimit,
  quantity,
  quantityLimit,
  height,
  heightLimit,
  width,
  widthLimit,
}

class ConfigTypeActionTuple<T>{
  final String name;
  final (T,T) tuple;

  const ConfigTypeActionTuple(this.name, this.tuple);
}

class ConfigTypeAction {
  static List<ConfigTypeActionTuple<T>> actionAll<T>(T Function(ConfigType) action) {
    final response = [
      ConfigTypeActionTuple("Name", (action(ConfigType.name), action(ConfigType.nameLimit))),
      ConfigTypeActionTuple("Quantity", (action(ConfigType.quantity), action(ConfigType.quantityLimit))),
      ConfigTypeActionTuple("Height", (action(ConfigType.height), action(ConfigType.heightLimit))),
      ConfigTypeActionTuple("Width", (action(ConfigType.width), action(ConfigType.widthLimit))),
    ];

    return response;
  }

  static Future<List<ConfigTypeActionTuple<T>>> actionAllFuture<T>(Future<T> Function(ConfigType) action) async {
    final responses = [
      ConfigTypeActionTuple("Name", (await action(ConfigType.name), await action(ConfigType.nameLimit))),
      ConfigTypeActionTuple("Quantity", (await action(ConfigType.quantity), await action(ConfigType.quantityLimit))),
      ConfigTypeActionTuple("Height", (await action(ConfigType.height), await action(ConfigType.heightLimit))),
      ConfigTypeActionTuple("Width", (await action(ConfigType.width), await action(ConfigType.widthLimit))),
    ];

    return responses;
  }
}

@riverpod
class SelectedConfigTypeViewModel extends _$SelectedConfigTypeViewModel {
  @override
  ConfigType? build() => null;

  void set(ConfigType type) {
    ConfigType? newType = type;
    if (state == type) newType = null;

    state = newType;
  }

  // bool isSelected(ConfigType type) => state == type;
}
