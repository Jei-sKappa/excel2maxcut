import 'package:excel/excel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sheet_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class SheetViewModel extends _$SheetViewModel {
  @override
  Sheet? build(int index) => null;

  set(Sheet sheet) => state = sheet;
}
