import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveFileButton extends ConsumerWidget {
  const SaveFileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: Readd this
    return const SizedBox.shrink();
    // final maxCutDataViewModel = ref.watch(maxCutDataViewModelProvider.notifier);
    // final maxCutDataState = ref.watch(maxCutDataViewModelProvider);
    // return maxCutDataState.maybeWhen(
    //   orElse: () => const SizedBox.shrink(),
    //   error: (exception) => Tooltip(
    //     message: "Error: $exception",
    //     child: const Icon(
    //       Icons.error,
    //       color: Colors.red,
    //     ),
    //   ),
    //   success: (_) => TextButton(
    //     onPressed: () async {
    //       final response = await maxCutDataViewModel.saveFile();
    //       late String message;
    //       if (response == false) {
    //         message = "Error: File not saved";
    //       } else {
    //         message = "File saved";
    //       }

    //       WidgetsBinding.instance.addPostFrameCallback((_) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(
    //             content: Text(message),
    //           ),
    //         );
    //       });
    //     },
    //     child: const Text("Export"),
    //   ),
    // );
  }
}
