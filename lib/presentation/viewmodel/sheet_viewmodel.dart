import 'package:excel/excel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sheet_viewmodel.g.dart';

@riverpod
class SheetViewModel extends _$SheetViewModel {
  @override
  Sheet? build() => null;

  set(Sheet sheet) => state = sheet;
}
