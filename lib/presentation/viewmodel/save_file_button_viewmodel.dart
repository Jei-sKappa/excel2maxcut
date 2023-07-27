import 'dart:io';

import 'package:excel2maxcut/domain/maxcutdata.dart';
import 'package:file_selector/file_selector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/all_max_cut_result_provider.dart';
import '../state/state.dart';

part 'save_file_button_viewmodel.g.dart';

@riverpod
class SaveFileButtonViewModel extends _$SaveFileButtonViewModel {
  @override
  State build() => const State.init();

  Future<String?> _getSavePath(String fileName) async {
    final FileSaveLocation? result = await getSaveLocation(
      suggestedName: fileName,
      acceptedTypeGroups: [
        const XTypeGroup(
          label: 'csv',
          extensions: ['csv'],
          mimeTypes: ['text/csv'],
        ),
      ],
    );

    return result?.path;
  }

  Future saveFile() async {
    state = const State.loading();

    final results = ref.read(allMaxCutResultProvider);
    if (results.isEmpty) {
      state = State.error(Exception("No data to export"));
      return;
    }

    String csvData = MaxCutResult.dumpAll(results);

    //TODO: Should set default file name to the first excel file name
    String fileName = "export.csv";
    final String? path = await _getSavePath(fileName);
    if (path == null) {
      state = State.error(Exception("Canceled"));
      return;
    }

    final File file = File(path);
    final savedFile = await file.writeAsString(csvData);
    if (!(await savedFile.exists())) {
      state = State.error(Exception("Error while saving file"));
      return;
    }

    state = const State.success(null); //TODO: Refactor this null
  }
}
