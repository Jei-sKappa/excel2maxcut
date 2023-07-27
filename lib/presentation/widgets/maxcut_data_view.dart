import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/loading_widget.dart';
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
                          return Text(data ?? "/");
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
