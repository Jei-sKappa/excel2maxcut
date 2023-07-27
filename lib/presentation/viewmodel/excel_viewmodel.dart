import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/state.dart';

part 'excel_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class ExcelViewModel extends _$ExcelViewModel {
  @override
  State<Excel> build(int index) {
    return const State.init();
  }

  Future<File?> _getExcelFileFromLocalAppMemory() async {
    const filePath = "SCHEDA_DI_LAVORO_2023_GD.xlsx";
    final path = await getApplicationDocumentsDirectory();
    final file = File('${path.path}/$filePath');
    if (!(await file.exists())) return null;

    return file;
  }

  void getFile() async {
    state = const State.loading();
    await Future.delayed(const Duration(seconds: 1));

    Excel? excel;

    final localFile = await _getExcelFileFromLocalAppMemory();
    if (localFile == null) {
      // Try with File picker
      FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
        withData: true,
      );
      if (filePickerResult != null) {
        debugPrint("File picked: ${filePickerResult.files.first.path}");
        excel = await _decodeExcelPlatformFile(filePickerResult.files.first);
      }
    } else {
      debugPrint("Local File picked: ${localFile.path}");
      excel = await _decodeExcelFile(localFile);
    }

    if (excel != null) {
      debugPrint("Excel decoded");
      state = State.success(excel);
    } else {
      state = State.error(Exception("Error decoding excel file"));
    }
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

  Future<Excel> _decodeExcelFile(File file) async {
    final bytes = await file.readAsBytes();
    final excel = _decodeFile(bytes);
    return excel;
  }
}
