import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/state.dart';

part 'excel_viewmodel.g.dart';

class ExcelState {
  final Excel excel;
  final String fileName;

  ExcelState({
    required this.excel,
    required this.fileName,
  });

  ExcelState copyWith({
    Excel? excel,
    String? fileName,
  }) {
    return ExcelState(
      excel: excel ?? this.excel,
      fileName: fileName ?? this.fileName,
    );
  }
}

@Riverpod(keepAlive: true)
class ExcelViewModel extends _$ExcelViewModel {
  @override
  State<ExcelState> build(int index) {
    return const State.init();
  }

  void getFile() async {
    state = const State.loading();
    await Future.delayed(const Duration(seconds: 1));

    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      withData: true,
    );

    if (filePickerResult == null) {
      state = State.error(Exception("No file picked"));
      return;
    }

    final file = filePickerResult.files.first;
    final fileName = file.name;
    debugPrint("Picked file '$fileName' at path '${file.path}'");
    final Excel? excel = await _decodeExcelPlatformFile(filePickerResult.files.first);

    if (excel == null) {
      state = State.error(Exception("Error decoding excel file"));
      return;
    }

    state = State.success(ExcelState(
      excel: excel,
      fileName: fileName,
    ));
  }

  Excel _decodeFile(List<int> data) {
    return Excel.decodeBytes(data);
  }

  Future<Excel?> _decodeExcelPlatformFile(PlatformFile file) async {
    final bytes = file.bytes;
    if (bytes == null) return null;

    final excel = _decodeFile(bytes);
    return excel;
  }
}
