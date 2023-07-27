import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/loading_widget.dart';
import '../viewmodel/save_file_button_viewmodel.dart';

class SaveFileButton extends ConsumerWidget {
  const SaveFileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveFileButtonViewModel = ref.read(saveFileButtonViewModelProvider.notifier);
    final state = ref.watch(saveFileButtonViewModelProvider);

    return state.when(
        loading: () => const LoadingWidget(),
        error: (exception) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(exception.toString()),
              ),
            );
          });
          return TextButton(
            onPressed: () async {
              await saveFileButtonViewModel.saveFile();
            },
            child: const Text(
              "Export",
              style: TextStyle(color: Colors.red),
            ),
          );
        },
        init: () {
          return TextButton(
            onPressed: () async {
              await saveFileButtonViewModel.saveFile();
            },
            child: const Text("Export"),
          );
        },
        success: (_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("File saved"),
              ),
            );
          });
          return TextButton(
            onPressed: () async {
              await saveFileButtonViewModel.saveFile();
            },
            child: const Text("Export"),
          );
        });
  }
}
