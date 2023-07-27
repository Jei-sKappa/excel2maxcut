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
                          return MaxDataCell(
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

class MaxDataCell extends ConsumerWidget {
  final MaxCutData? data;

  /// The Index of the data object (in the list of data objects) that refers to this cell
  final int maxDataObjectIndex;

  final MaxCutDataType dataType;

  const MaxDataCell({
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

class TextEditingView extends StatefulWidget {
  final String text;
  final bool showPrevious;
  final void Function(String) onSubmitted;
  const TextEditingView(
    this.text, {
    this.showPrevious = true,
    required this.onSubmitted,
    super.key,
  });

  @override
  State<TextEditingView> createState() => _TextEditingViewState();
}

class _TextEditingViewState extends State<TextEditingView> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Text",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.showPrevious && widget.text != "")
                Text(
                  'Previous: "${widget.text}"',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
          Expanded(
            child: Center(
              child: TextField(
                controller: controller,
                onEditingComplete: () => widget.onSubmitted(controller.text.trim()),
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  labelText: 'Enter new value',
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
