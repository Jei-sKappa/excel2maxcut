import 'dart:io';

import 'package:excel2maxcut/domain/maxcutdata.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/all_max_cut_result_provider.dart';
import '../state/state.dart';

part 'save_file_button_viewmodel.g.dart';

@riverpod
class SaveFileButtonViewModel extends _$SaveFileButtonViewModel {
  @override
  State build() => const State.init();

  Future saveFile() async {
    state = const State.loading();

    final results = ref.read(allMaxCutResultProvider);
    if (results.isEmpty) {
      state = State.error(Exception("No data to export"));
      return;
    }

    String csvData = MaxCutResult.dumpAll(results);

    final String path = (await getApplicationSupportDirectory()).path;
    // final filePath = "$path/excel2maxcut-${DateTime.now()}.csv";
    final filePath = "$path/export.csv";
    debugPrint(filePath);

    final File file = File(filePath);
    final savedFile = await file.writeAsString(csvData);
    if (!(await savedFile.exists())) {
      state = State.error(Exception("Error while saving file"));
      return;
    }

    state = const State.success(null); //TODO: Refactor this null
  }
}
