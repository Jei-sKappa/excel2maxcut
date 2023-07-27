import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/maxcutdata.dart';
import '../viewmodel/maxcut_data_viewmodel.dart';
import '../viewmodel/multiple_excel_viewmodel.dart';

part 'all_max_cut_result_provider.g.dart';

@riverpod
List<MaxCutResult> allMaxCutResult(AllMaxCutResultRef ref) {
  int excelFilesCount = ref.watch(multipleExcelViewModelProvider).count;
  List<MaxCutResult> results = [];
  for (int i = 0; i < excelFilesCount; i++) {
    final result = ref.watch(maxCutDataViewModelProvider(i)).data;
    if (result == null) {
      // TODO: Show error
      continue;
    }
    results.add(result);
  }

  return results;
}
