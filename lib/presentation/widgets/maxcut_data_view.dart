import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/text_editing_view.dart';
import '../../domain/maxcutdata.dart';
import '../viewmodel/maxcut_data_viewmodel.dart';
import '../viewmodel/maxcut_datatype_config_viewmodel.dart';
import 'maxcut_datatype_default_values_selector.dart';

class MaxCutDataView extends ConsumerWidget {
  final int index;
  const MaxCutDataView(this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxCutDataState = ref.watch(maxCutDataViewModelProvider(index));
    return maxCutDataState.maybeWhen(
      error: (exception) => Text("Error: ${exception.toString()}"),
      orElse: () => const LoadingWidget(),
      success: (maxCutData) {
        final maxCutObjects = maxCutData.objects;
        if (maxCutObjects.isEmpty) return const SizedBox.shrink();

        return SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                MaxCutDataType.values.length,
                (rowIndex) {
                  final maxCutDataType = MaxCutDataType.values[rowIndex];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: List.generate(
                        maxCutObjects.length + 1,
                        (colIndex) {
                          if (colIndex == 0) {
                            return Text(
                              maxCutDataType.fieldName,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            );
                          }
                          final fixedColIndex = colIndex - 1;
                          final maxCutObject = maxCutObjects[fixedColIndex];
                          final data = maxCutObject[maxCutDataType];
                          return _MaxDataCell(
                            data: data,
                            maxDataObjectIndex: fixedColIndex,
                            dataType: maxCutDataType,
                            index: index,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MaxDataCell extends ConsumerWidget {
  final MaxCutData? data;

  /// The Index of the data object (in the list of data objects) that refers to this cell
  final int maxDataObjectIndex;

  final MaxCutDataType dataType;

  final int index;

  const _MaxDataCell({
    required this.data,
    required this.maxDataObjectIndex,
    required this.dataType,
    required this.index,
  });

  void showEditingDialog(BuildContext context, WidgetRef ref, MaxCutData? data, int maxDataObjectIndex, MaxCutDataType dataType, int index) {
    final String adjustedData = data ?? "";
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              width: 400,
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 180,
                      child: TextEditingView(
                        adjustedData,
                        onSubmitted: (newData) => newValueSelectedHandler(context, ref, newData, index),
                        onSetPreset: (newData) => setNewPresetHandler(context, ref, newData, index),
                      ),
                    ),
                    const Text(
                      "Presets:",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MaxCutDataTypeDefaultValuesSelector(
                      maxCutDataType: dataType,
                      onChanged: (newData) => newValueSelectedHandler(context, ref, newData, index),
                      onRemoved: (newData) => removePreset(context, ref, newData, index),
                    ),
                    const Divider(),
                    Center(
                      child: TextButton(
                        onPressed: () => addToAllPieces(context, ref, adjustedData, index),
                        child: const Text("Add To All Pieces"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void addToAllPiecesHandler(BuildContext context, WidgetRef ref, String data, int index) {
    addToAllPieces(context, ref, data, index);
    Navigator.of(context).pop();
  }

  void addToAllPieces(BuildContext context, WidgetRef ref, String data, int index) {
    final response = ref.read(maxCutDataViewModelProvider(index).notifier).addToAllPieces(data, dataType);

    if (response == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error: While Updating All Data"),
        ),
      );
    }
  }

  void newValueSelectedHandler(BuildContext context, WidgetRef ref, String newData, int index) {
    saveData(context, ref, newData, index);
    Navigator.of(context).pop();
  }

  void setNewPresetHandler(BuildContext context, WidgetRef ref, String newData, int index) {
    setNewPreset(context, ref, newData, index);
    saveData(context, ref, newData, index);
    Navigator.of(context).pop();
  }

  void setNewPreset(BuildContext context, WidgetRef ref, String newData, int index) {
    //TODO: Handle Response
    ref.read(maxCutDataTypeConfigViewModelProvider(dataType).notifier).addDefaultValue(newData);
  }

  void removePreset(BuildContext context, WidgetRef ref, String newData, int index) {
    //TODO: Handle Response
    ref.read(maxCutDataTypeConfigViewModelProvider(dataType).notifier).removeDefaultValue(newData);
  }

  void saveData(BuildContext context, WidgetRef ref, String newData, int index) {
    final response = ref.read(maxCutDataViewModelProvider(index).notifier).customizeData(newData, dataType, maxDataObjectIndex);

    if (response == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error: While Updating Data"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
      ),
      onPressed: () => showEditingDialog(context, ref, data, maxDataObjectIndex, dataType, index),
      child: Text(data ?? dataType.defaultValue ?? "/"),
    );
  }
}
