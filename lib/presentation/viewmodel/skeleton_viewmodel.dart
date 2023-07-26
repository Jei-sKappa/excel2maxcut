import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/state.dart';

part 'skeleton_viewmodel.g.dart';

@riverpod
class SkeletonViewModel extends _$SkeletonViewModel {
  @override
  State<Excel> build() {
    getFile(); // TODO: Remove
    return const State.init();
  }

  Future<File?> _getExcelFileFromLocalAppMemory() async {
    const filePath = "file.xlsx";
    final path = await getApplicationDocumentsDirectory();
    final file = File('${path.path}/$filePath');
    if (!(await file.exists())) return null;

    return file;
  }

  void getFile() async {
    state = const State.loading();

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
        excel = _decodeExcelPlatformFile(filePickerResult.files.first);
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

  Excel? _decodeExcelPlatformFile(PlatformFile file) {
    final bytes = file.bytes;
    if (bytes == null) return null;

    return Excel.decodeBytes(bytes);
  }

  Future<Excel> _decodeExcelFile(File file) async {
    final bytes = await file.readAsBytes();
    return Excel.decodeBytes(bytes);
  }
}
