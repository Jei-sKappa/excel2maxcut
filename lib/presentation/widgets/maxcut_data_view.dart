import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/text_editing_view.dart';
import '../../domain/maxcutdata.dart';
import '../viewmodel/maxcut_data_viewmodel.dart';

class MaxCutDataView extends ConsumerWidget {
  const MaxCutDataView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxCutDataState = ref.watch(maxCutDataViewModelProvider);
    return maxCutDataState.maybeWhen(
      orElse: () => const Text("No Data"),
      loading: () => const LoadingWidget(),
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

  const _MaxDataCell({
    required this.data,
    required this.maxDataObjectIndex,
    required this.dataType,
    super.key,
  });

  void showEditingDialog(BuildContext context, WidgetRef ref, MaxCutData? data, int maxDataObjectIndex, MaxCutDataType dataType) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              width: 320,
              height: 200,
              child: TextEditingView(
                data ?? "",
                onSubmitted: (newData) => onSubmitted(context, ref, newData),
              ),
            ),
          );
        });
  }

  void onSubmitted(BuildContext context, WidgetRef ref, String newData) {
    saveData(context, ref, newData);
    Navigator.of(context).pop();
  }

  void saveData(BuildContext context, WidgetRef ref, String newData) {
    final response = ref.read(maxCutDataViewModelProvider.notifier).customizeData(newData, dataType, maxDataObjectIndex);

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
      onPressed: () => showEditingDialog(context, ref, data, maxDataObjectIndex, dataType),
      child: Text(data ?? "/"),
    );
  }
}