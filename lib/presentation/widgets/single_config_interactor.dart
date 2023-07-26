import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/cell_coord.dart';
import '../viewmodel/config_type_viewmodel.dart';
import '../viewmodel/cell_coord_viewmodel.dart';

class SingleConfigInteractor extends ConsumerWidget {
  final ConfigType configType;
  const SingleConfigInteractor(this.configType, {super.key});

  String _format(CellCoord? coord) => coord == null ? "/" : coord.toString();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedConfigTypeViewModel = ref.read(selectedConfigTypeViewModelProvider.notifier);
    final selectedConfigType = ref.watch(selectedConfigTypeViewModelProvider);
    final cellCoordState = ref.watch(cellCoordViewModelProvider(configType));
    return ChoiceChip(
      selected: selectedConfigType == configType,
      onSelected: (_) => selectedConfigTypeViewModel.set(configType),
      label: cellCoordState.maybeWhen(
        success: (coord) => Text(_format(coord)),
        error: (exception) {
          final snackBar = SnackBar(
            content: Text(exception.toString()),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return const Text("err");
        },
        orElse: () => const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
