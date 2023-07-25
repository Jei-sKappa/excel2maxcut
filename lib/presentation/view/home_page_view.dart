import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/pick_file_widget.dart';
import 'excel_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Excel? excelFile;
  bool isLoading = false;

  Future<File?> _getLocalFile() async {
    const filePath = "SCHEDA_DI_LAVORO_2023_GD.xlsx";
    final path = await getApplicationDocumentsDirectory();
    final file = File('${path.path}/$filePath');
    if (!(await file.exists())) return null;

    return file;
  }

  void _pickExcelFile() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    Excel? excel;

    final localFile = await _getLocalFile();
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

      setState(() {
        excelFile = excel;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
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

  @override
  void initState() {
    _pickExcelFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excel Table'),
        elevation: 1,
      ),
      body: SafeArea(
        child: Builder(builder: (context) {
          if (isLoading) return const LoadingWidget();
          if (excelFile == null) return PickFileWidget(_pickExcelFile);

          return ExcelView(excelFile!);
        }),
      ),
    );
  }
}
