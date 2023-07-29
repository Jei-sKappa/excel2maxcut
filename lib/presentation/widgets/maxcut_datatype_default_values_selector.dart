import 'package:excel2maxcut/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/maxcutdata.dart';
import '../viewmodel/maxcut_datatype_config_viewmodel.dart';

//TODO: Rename "default values" to "presets"
class MaxCutDataTypeDefaultValuesSelector extends ConsumerStatefulWidget {
  final MaxCutDataType maxCutDataType;
  final void Function(String) onChanged;
  const MaxCutDataTypeDefaultValuesSelector({
    required this.maxCutDataType,
    required this.onChanged,
    super.key,
  });

  @override
  ConsumerState<MaxCutDataTypeDefaultValuesSelector> createState() => _MaxCutDataTypeDefaultValuesSelectorState();
}

class _MaxCutDataTypeDefaultValuesSelectorState extends ConsumerState<MaxCutDataTypeDefaultValuesSelector> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final configState = ref.watch(maxCutDataTypeConfigViewModelProvider(widget.maxCutDataType));
    return configState.maybeWhen(
      error: (exception) {
        final snackBar = SnackBar(
          content: Text(exception.toString()),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return const Text("err");
      },
      orElse: () => const LoadingWidget(),
      success: (config) {
        final defaultValues = config?.defaultValues ?? [];

        if (defaultValues.isEmpty) {
          return const Text("No Presets");
        }

        return DropdownButton<String>(
          value: selectedValue ?? defaultValues.first, // I use .first wihout checking if it's empty because I checked it before
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            if (value != null) {
              widget.onChanged(value);
            }
          },
          items: List.generate(defaultValues.length, (index) {
            final value = defaultValues[index];
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }),
        );
      },
    );
  }
}
