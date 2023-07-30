import 'package:excel/excel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'excel_viewmodel.dart';

part 'sheet_index_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class SheetIndexViewModel extends _$SheetIndexViewModel {
  @override
  int build(int excelFileIndex) => 0;

  void set(int sheetIndex) => state = sheetIndex;

  // It's a helper method to get the sheet from the excel file
  // because of that i not use "state" as index
  Sheet? getSheet(int index){
    final excelState = ref.read(excelViewModelProvider(excelFileIndex));
    final excel = excelState.data;
    if (excel == null) return null;

    final sheetName = excel.tables.keys.elementAt(index); // State represents the index of the sheet
    return excel.tables[sheetName];
  }
}
