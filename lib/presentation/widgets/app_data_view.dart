import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/loading_widget.dart';
import '../viewmodel/app_data_viewmodel.dart';

class AppDataView extends ConsumerWidget {
  const AppDataView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDataViewModel = ref.watch(appDataViewModelProvider.notifier);
    final appDataState = ref.watch(appDataViewModelProvider);
    return appDataState.maybeWhen(
      orElse: () => const LoadingWidget(),
      success: (appData) {
        if (appData.isEmpty) return const SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () => appDataViewModel.saveFile(appData),
              child: const Text("Export"),
            ),
            SingleChildScrollView(
              child: Row(
                children: List.generate(
                  appData.first.length, //TODO: They should be all equal thanks to the transposition. But make it more evident and safe
                  (rowIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: List.generate(
                          appData.length + 1,
                          (colIndex) {
                            if (colIndex == 0) {
                              if (rowIndex == 0) return const Text("Name", style: TextStyle(fontWeight: FontWeight.bold));
                              if (rowIndex == 1) return const Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold));
                              if (rowIndex == 2) return const Text("Height", style: TextStyle(fontWeight: FontWeight.bold));
                              if (rowIndex == 3) return const Text("Width", style: TextStyle(fontWeight: FontWeight.bold));
                            }
                            final fixedColIndex = colIndex - 1;
                            String? data = appData[fixedColIndex][rowIndex];
                            return Text(data ?? "/");
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
