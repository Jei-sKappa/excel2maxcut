import 'dart:io';

import 'package:csv/csv.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:excel/excel.dart' hide Border;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/extension/number_to_aphabet.dart';

class PrefsDataSource {
  static final _prefs = SharedPreferences.getInstance();
  //
  static const _prefix = "exel2maxcut";
  //
  static const _nameField = "${_prefix}_name";
  static const _quantityField = "${_prefix}_quantity";
  static const _heightField = "${_prefix}_height";
  static const _widthField = "${_prefix}_width";
  //
  static const _nameFieldRow = "${_nameField}_row";
  static const _nameFieldCol = "${_nameField}_column";
  static const _quantityFieldRow = "${_quantityField}_row";
  static const _quantityFieldCol = "${_quantityField}_column";
  static const _heightFieldRow = "${_heightField}_row";
  static const _heightFieldCol = "${_heightField}_column";
  static const _widthFieldRow = "${_widthField}_row";
  static const _widthFieldCol = "${_widthField}_column";
  //
  static const _nameFieldRowLimit = "${_nameFieldRow}_limit";
  static const _nameFieldColLimit = "${_nameFieldCol}_limit";
  static const _quantityFieldRowLimit = "${_quantityFieldRow}_limit";
  static const _quantityFieldColLimit = "${_quantityFieldCol}_limit";
  static const _heightFieldRowLimit = "${_heightFieldRow}_limit";
  static const _heightFieldColLimit = "${_heightFieldCol}_limit";
  static const _widthFieldRowLimit = "${_widthFieldRow}_limit";
  static const _widthFieldColLimit = "${_widthFieldCol}_limit";

  Future<int?> getNameCellRowIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_nameFieldRow);
    return index;
  }

  Future<bool> setNameCellRowIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_nameFieldRow, index);
    return response;
  }

  Future<int?> getNameCellColIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_nameFieldCol);
    return index;
  }

  Future<bool> setNameCellColIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_nameFieldCol, index);
    return response;
  }

  Future<int?> getQuantityCellRowIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_quantityFieldRow);
    return index;
  }

  Future<bool> setQuantityCellRowIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_quantityFieldRow, index);
    return response;
  }

  Future<int?> getQuantityCellColIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_quantityFieldCol);
    return index;
  }

  Future<bool> setQuantityCellColIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_quantityFieldCol, index);
    return response;
  }

  Future<int?> getHeightCellRowIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_heightFieldRow);
    return index;
  }

  Future<bool> setHeightCellRowIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_heightFieldRow, index);
    return response;
  }

  Future<int?> getHeightCellColIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_heightFieldCol);
    return index;
  }

  Future<bool> setHeightCellColIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_heightFieldCol, index);
    return response;
  }

  Future<int?> getWidthCellRowIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_widthFieldRow);
    return index;
  }

  Future<bool> setWidthCellRowIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_widthFieldRow, index);
    return response;
  }

  Future<int?> getWidthCellColIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_widthFieldCol);
    return index;
  }

  Future<bool> setWidthCellColIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_widthFieldCol, index);
    return response;
  }

  Future<int?> getNameCellRowIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_nameFieldRowLimit);
    return index;
  }

  Future<bool> setNameCellRowIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_nameFieldRowLimit, index);
    return response;
  }

  Future<int?> getNameCellColIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_nameFieldColLimit);
    return index;
  }

  Future<bool> setNameCellColIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_nameFieldColLimit, index);
    return response;
  }

  Future<int?> getQuantityCellRowIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_quantityFieldRowLimit);
    return index;
  }

  Future<bool> setQuantityCellRowIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_quantityFieldRowLimit, index);
    return response;
  }

  Future<int?> getQuantityCellColIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_quantityFieldColLimit);
    return index;
  }

  Future<bool> setQuantityCellColIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_quantityFieldColLimit, index);
    return response;
  }

  Future<int?> getHeightCellRowIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_heightFieldRowLimit);
    return index;
  }

  Future<bool> setHeightCellRowIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_heightFieldRowLimit, index);
    return response;
  }

  Future<int?> getHeightCellColIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_heightFieldColLimit);
    return index;
  }

  Future<bool> setHeightCellColIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_heightFieldColLimit, index);
    return response;
  }

  Future<int?> getWidthCellRowIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_widthFieldRowLimit);
    return index;
  }

  Future<bool> setWidthCellRowIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_widthFieldRowLimit, index);
    return response;
  }

  Future<int?> getWidthCellColIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_widthFieldColLimit);
    return index;
  }

  Future<bool> setWidthCellColIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_widthFieldColLimit, index);
    return response;
  }
}

class CellCoord {
  final int row;
  final int col;
  const CellCoord(this.row, this.col);

  static CellCoord fromCellIndex(CellIndex index) => CellCoord(index.rowIndex, index.columnIndex);

  @override
  String toString() => "${(col + 1).toAlphabet()}${row + 1}";
}

class CellCoordSelection {
  final CellCoord? start;
  final CellCoord? limit;
  const CellCoordSelection(this.start, this.limit);
}

class NotNullCellCoordSelection extends CellCoordSelection {
  @override
  CellCoord get start => super.start!;

  @override
  CellCoord get limit => super.limit!;
  const NotNullCellCoordSelection(CellCoord start, CellCoord limit) : super(start, limit);
}

class PrefsRepository {
  final PrefsDataSource datasource;

  const PrefsRepository(this.datasource);

  Future<CellCoordSelection> getNameCellIndex() async {
    final int? row = await datasource.getNameCellRowIndex();
    final int? col = await datasource.getNameCellColIndex();
    final int? rowLimit = await datasource.getNameCellRowIndexLimit();
    final int? colLimit = await datasource.getNameCellColIndexLimit();

    CellCoord? start;
    if (row != null && col != null) start = CellCoord(row, col);
    CellCoord? limit;
    if (rowLimit != null && colLimit != null) limit = CellCoord(rowLimit, colLimit);
    return CellCoordSelection(start, limit);
  }

  Future<bool> setNameCellIndex({CellCoord? start, CellCoord? limit}) async {
    assert(start != null || limit != null);
    bool startUpdateResponse = true;
    bool limitUpdateResponse = true;
    if (start != null) {
      startUpdateResponse = await datasource.setNameCellRowIndex(start.row) && await datasource.setNameCellColIndex(start.col);
    }
    if (limit != null) {
      limitUpdateResponse = await datasource.setNameCellRowIndexLimit(limit.row) && await datasource.setNameCellColIndexLimit(limit.col);
    }

    return startUpdateResponse && limitUpdateResponse;
  }

  Future<CellCoordSelection> getQuantityCellIndex() async {
    final int? row = await datasource.getQuantityCellRowIndex();
    final int? col = await datasource.getQuantityCellColIndex();
    final int? rowLimit = await datasource.getQuantityCellRowIndexLimit();
    final int? colLimit = await datasource.getQuantityCellColIndexLimit();

    CellCoord? start;
    if (row != null && col != null) start = CellCoord(row, col);
    CellCoord? limit;
    if (rowLimit != null && colLimit != null) limit = CellCoord(rowLimit, colLimit);
    return CellCoordSelection(start, limit);
  }

  Future<bool> setQuantityCellIndex({CellCoord? start, CellCoord? limit}) async {
    assert(start != null || limit != null);
    bool startUpdateResponse = true;
    bool limitUpdateResponse = true;
    if (start != null) {
      startUpdateResponse = await datasource.setQuantityCellRowIndex(start.row) && await datasource.setQuantityCellColIndex(start.col);
    }
    if (limit != null) {
      limitUpdateResponse = await datasource.setQuantityCellRowIndexLimit(limit.row) && await datasource.setQuantityCellColIndexLimit(limit.col);
    }
    return startUpdateResponse && limitUpdateResponse;
  }

  Future<CellCoordSelection> getHeightCellIndex() async {
    final int? row = await datasource.getHeightCellRowIndex();
    final int? col = await datasource.getHeightCellColIndex();
    final int? rowLimit = await datasource.getHeightCellRowIndexLimit();
    final int? colLimit = await datasource.getHeightCellColIndexLimit();

    CellCoord? start;
    if (row != null && col != null) start = CellCoord(row, col);
    CellCoord? limit;
    if (rowLimit != null && colLimit != null) limit = CellCoord(rowLimit, colLimit);
    return CellCoordSelection(start, limit);
  }

  Future<bool> setHeightCellIndex({CellCoord? start, CellCoord? limit}) async {
    assert(start != null || limit != null);
    bool startUpdateResponse = true;
    bool limitUpdateResponse = true;
    if (start != null) {
      startUpdateResponse = await datasource.setHeightCellRowIndex(start.row) && await datasource.setHeightCellColIndex(start.col);
    }
    if (limit != null) {
      limitUpdateResponse = await datasource.setHeightCellRowIndexLimit(limit.row) && await datasource.setHeightCellColIndexLimit(limit.col);
    }
    return startUpdateResponse && limitUpdateResponse;
  }

  Future<CellCoordSelection> getWidthCellIndex() async {
    final int? row = await datasource.getWidthCellRowIndex();
    final int? col = await datasource.getWidthCellColIndex();
    final int? rowLimit = await datasource.getWidthCellRowIndexLimit();
    final int? colLimit = await datasource.getWidthCellColIndexLimit();

    CellCoord? start;
    if (row != null && col != null) start = CellCoord(row, col);
    CellCoord? limit;
    if (rowLimit != null && colLimit != null) limit = CellCoord(rowLimit, colLimit);
    return CellCoordSelection(start, limit);
  }

  Future<bool> setWidthCellIndex({CellCoord? start, CellCoord? limit}) async {
    assert(start != null || limit != null);
    bool startUpdateResponse = true;
    bool limitUpdateResponse = true;
    if (start != null) {
      startUpdateResponse = await datasource.setWidthCellRowIndex(start.row) && await datasource.setWidthCellColIndex(start.col);
    }
    if (limit != null) {
      limitUpdateResponse = await datasource.setWidthCellRowIndexLimit(limit.row) && await datasource.setWidthCellColIndexLimit(limit.col);
    }
    return startUpdateResponse && limitUpdateResponse;
  }
}

//! HomePage
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
          if (isLoading) return const _LoadingWidget();
          if (excelFile == null) return _PickFileWidget(_pickExcelFile);

          return _ExcelView(excelFile!);
        }),
      ),
    );
  }
}

//! ExcelView - TabWrapper
class _ExcelView extends StatelessWidget {
  final Excel excel;
  const _ExcelView(this.excel);

  @override
  Widget build(BuildContext context) {
    final Iterable<String> tableNames = excel.tables.keys;
    return DefaultTabController(
      length: tableNames.length,
      child: Column(
        children: [
          TabBar(
            tabs: List.generate(tableNames.length, (index) => Tab(text: tableNames.elementAt(index))),
            isScrollable: true,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: TabBarView(
              children: List.generate(tableNames.length, (index) {
                return _ExcelTable(excel.tables[tableNames.elementAt(index)]!);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

typedef ExcelRow = List<Data?>;

enum DataType {
  name,
  nameLimit,
  quantity,
  quantityLimit,
  height,
  heightLimit,
  width,
  widthLimit,
}

class GetTupleDataType {
  static (DataType, DataType) get nameTuple => (DataType.name, DataType.nameLimit);
  static (DataType, DataType) get quantityTuple => (DataType.quantity, DataType.quantityLimit);
  static (DataType, DataType) get heightTuple => (DataType.height, DataType.heightLimit);
  static (DataType, DataType) get widthTuple => (DataType.width, DataType.widthLimit);
}

//! ExcelTable - DataView + DataTable
class _ExcelTable extends StatefulWidget {
  final Sheet sheet;
  const _ExcelTable(this.sheet);

  @override
  State<_ExcelTable> createState() => _ExcelTableState();
}

class _ExcelTableState extends State<_ExcelTable> {
  late final PrefsRepository repository;
  late ScrollController vScrollController;
  late ScrollController hScrollController;
  late final List<ExcelRow> rows;
  late final int maxColsCount;
  DataType? selectedTypeCopy;

  @override
  void initState() {
    final datasource = PrefsDataSource();
    repository = PrefsRepository(datasource);
    vScrollController = ScrollController();
    hScrollController = ScrollController();
    rows = widget.sheet.rows;
    maxColsCount = widget.sheet.maxCols;
    super.initState();
  }

  @override
  void dispose() {
    vScrollController.dispose();
    hScrollController.dispose();
    super.dispose();
  }

  void _onCellTap(CellCoord coord) async {
    if (selectedTypeCopy == null) return;

    switch (selectedTypeCopy!) {
      case DataType.name:
        await repository.setNameCellIndex(start: coord);
        break;
      case DataType.quantity:
        await repository.setQuantityCellIndex(start: coord);
        break;
      case DataType.height:
        await repository.setHeightCellIndex(start: coord);
        break;
      case DataType.width:
        await repository.setWidthCellIndex(start: coord);
        break;
      case DataType.nameLimit:
        await repository.setNameCellIndex(limit: coord);
        break;
      case DataType.quantityLimit:
        await repository.setQuantityCellIndex(limit: coord);
        break;
      case DataType.heightLimit:
        await repository.setHeightCellIndex(limit: coord);
        break;
      case DataType.widthLimit:
        await repository.setWidthCellIndex(limit: coord);
        break;
    }

    setState(() {});
  }

  void onSelectedType(DataType? type) {
    selectedTypeCopy = type;
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    final Color staticCellsColor = isLightTheme ? Colors.grey.shade200 : Colors.grey.shade800;
    final Color firstStaticCellColor = isLightTheme ? Colors.grey.shade400 : Colors.grey.shade900;
    return Column(
      children: [
        _DataListSelector(
          sheet: widget.sheet,
          repository: repository,
          onSelectedType: onSelectedType,
        ),
        const Divider(),
        Flexible(
          fit: FlexFit.tight,
          child: DataTable2(
            scrollController: vScrollController,
            horizontalScrollController: hScrollController,
            isVerticalScrollBarVisible: true,
            isHorizontalScrollBarVisible: true,
            bottomMargin: 0,
            columnSpacing: 10,
            horizontalMargin: 0,
            border: TableBorder.all(width: 1.0),
            minWidth: 3500,
            dataRowHeight: 80,
            fixedTopRows: 1,
            fixedLeftColumns: 1,
            headingRowColor: MaterialStateProperty.resolveWith((states) => staticCellsColor),
            fixedColumnsColor: staticCellsColor,
            fixedCornerColor: firstStaticCellColor,
            columns: _getCols(),
            rows: _getRows(),
          ),
        ),
      ],
    );
  }

  List<DataColumn> _getCols() => List.generate(maxColsCount + 1, (index) => DataColumn(label: Center(child: Text(index.toAlphabet()))));

  List<DataRow> _getRows() {
    return List.generate(rows.length, (rowIndex) {
      final ExcelRow row = rows[rowIndex];
      return DataRow(
        cells: List.generate(row.length + 1, (columnIndex) {
          // final fixedRowIndex = rowIndex + 1;
          final fixedColumnIndex = columnIndex - 1;
          if (columnIndex == 0) return DataCell(Center(child: Text('${rowIndex + 1}')));

          final Data? cell = row[fixedColumnIndex];
          if (cell == null) {
            return DataCell(
              _CellContent(
                child: const SizedBox.shrink(),
                onTap: () => _onCellTap(CellCoord(rowIndex, fixedColumnIndex)),
              ),
            );
          }

          CellStyle? cellStyle = cell.cellStyle;
          // final textColor = cellStyle?.fontColor;
          // final fontSize = cellStyle?.fontSize;
          final fontWeight = cellStyle?.isBold == true ? FontWeight.bold : null;
          final fontStyle = cellStyle?.isItalic == true ? FontStyle.italic : null;
          return DataCell(
            _CellContent(
              child: Text(
                "${cell.value}",
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontStyle: fontStyle,
                ),
              ),
              onTap: () => _onCellTap(CellCoord(rowIndex, fixedColumnIndex)),
            ),
          );
        }),
      );
    });
  }
}

//! DataListSelector
class _DataListSelector extends StatefulWidget {
  final Sheet sheet;
  final PrefsRepository repository;
  final void Function(DataType? type) onSelectedType;
  const _DataListSelector({
    required this.sheet,
    required this.repository,
    required this.onSelectedType,
  });

  @override
  State<_DataListSelector> createState() => __DataListSelectorState();
}

class __DataListSelectorState extends State<_DataListSelector> {
  bool isDataLoaded = false;
  CellCoordSelection? nameCoords;
  CellCoordSelection? quantityCoords;
  CellCoordSelection? heightCoords;
  CellCoordSelection? widthCoords;
  DataType? dataSelected;

  Future loadData({bool shouldSetLoadState = false}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (shouldSetLoadState && isDataLoaded) {
      setState(() {
        isDataLoaded = false;
      });
    }
    nameCoords = await widget.repository.getNameCellIndex();
    quantityCoords = await widget.repository.getQuantityCellIndex();
    heightCoords = await widget.repository.getHeightCellIndex();
    widthCoords = await widget.repository.getWidthCellIndex();
    setState(() {
      isDataLoaded = true;
    });
  }

  void _setSelectedData(DataType type) {
    DataType? newType = type;
    if (dataSelected == type) newType = null;

    setState(() {
      dataSelected = newType;
    });
    widget.onSelectedType(newType);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void didUpdateWidget(_DataListSelector oldWidget) {
    loadData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (!isDataLoaded) return const _LoadingWidget();

      return Column(
        children: [
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _CellCoordData(
                  name: "Name",
                  coordSelection: nameCoords,
                  isSelected: (type) => dataSelected == type,
                  setSelectedData: _setSelectedData,
                  typeTuple: GetTupleDataType.nameTuple,
                ),
                _CellCoordData(
                  name: "Quantity",
                  coordSelection: quantityCoords,
                  isSelected: (type) => dataSelected == type,
                  setSelectedData: _setSelectedData,
                  typeTuple: GetTupleDataType.quantityTuple,
                ),
                _CellCoordData(
                  name: "Height",
                  coordSelection: heightCoords,
                  isSelected: (type) => dataSelected == type,
                  setSelectedData: _setSelectedData,
                  typeTuple: GetTupleDataType.heightTuple,
                ),
                _CellCoordData(
                  name: "Width",
                  coordSelection: widthCoords,
                  isSelected: (type) => dataSelected == type,
                  setSelectedData: _setSelectedData,
                  typeTuple: GetTupleDataType.widthTuple,
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: _ParsedData(
              sheet: widget.sheet,
              nameCoords: nameCoords!,
              quantityCoords: quantityCoords!,
              heightCoords: heightCoords!,
              widthCoords: widthCoords!,
            ),
          ),
        ],
      );
    });
  }
}

//! ParsedData
class _ParsedData extends StatelessWidget {
  final Sheet sheet;
  final CellCoordSelection nameCoords;
  final CellCoordSelection quantityCoords;
  final CellCoordSelection heightCoords;
  final CellCoordSelection widthCoords;
  const _ParsedData({
    required this.sheet,
    required this.nameCoords,
    required this.quantityCoords,
    required this.heightCoords,
    required this.widthCoords,
  });

  List<String> _getParsedData(NotNullCellCoordSelection cellCoordSelection) {
    print("\n\n\n");
    print("------- getParsedData -------");
    final start = cellCoordSelection.start;
    final limit = cellCoordSelection.limit;
    //TODO: Guardare prima che sia valido direttamente nella definizione della classe coords
    final tempIsVertical = start.col == limit.col;
    final tempIsHorizontal = start.row == limit.row;
    // assert(tempIsVertical != tempIsHorizontal); // Only 1 of the 2 must be true
    print("tempIsVertical: $tempIsVertical | tempIsHorizontal: $tempIsHorizontal");

    final isVertical = tempIsVertical;

    final rows = sheet.rows;
    final List<String> parsedData = [];

    print("Coord start: $start");
    print("Coord limit: $limit");

    if (isVertical) {
      for (int i = start.row; i <= limit.row; i++) {
        final ExcelRow row = rows[i];
        final cell = row[start.col]; // Start col == limit col
        if (cell == null || cell.isFormula) continue;
        final coord = CellCoord.fromCellIndex(cell.cellIndex);
        print("Coord: $coord | Value: ${cell.value}");
        parsedData.add("${cell.value}");
      }
    } else {
      for (int i = start.col; i <= limit.col; i++) {
        final ExcelRow row = rows[start.row]; // Start row == limit row
        final cell = row[i];
        if (cell == null || cell.isFormula) continue;
        final coord = CellCoord.fromCellIndex(cell.cellIndex);
        print("Coord: $coord | Value: ${cell.value}");
        parsedData.add("${cell.value}");
      }
    }

    return parsedData;
  }

  List<List<T?>> transposeMatrix<T>(List<List<T?>> matrix) {
    int rows = matrix.length;
    int maxCols = 0;
    for (int i = 0; i < rows; i++) {
      if (matrix[i].length > maxCols) {
        maxCols = matrix[i].length;
      }
    }

    List<List<T?>> transposedMatrix = List.generate(maxCols, (_) => List<T?>.filled(rows, null));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        transposedMatrix[j][i] = matrix[i][j];
      }
    }

    return transposedMatrix;
  }

  List<List<String?>> parseData(List<NotNullCellCoordSelection?> selections) {
    final List<List<String>> parsedData = [];
    for (final selection in selections) {
      if (selection == null) {
        parsedData.add([]);
      } else {
        parsedData.add(_getParsedData(selection));
      }
    }
    final transposedMatrix = transposeMatrix(parsedData);
    return transposedMatrix;
  }

  void saveFile(List<List<dynamic>?>? data) async {
    String csvData = const ListToCsvConverter().convert(data, fieldDelimiter: ";");
    final String path = (await getApplicationSupportDirectory()).path;
    // final filePath = "$path/excel2maxcut-${DateTime.now()}.csv";
    final filePath = "$path/export.csv";
    print(filePath);
    final File file = File(filePath);
    await file.writeAsString(csvData);
  }

  @override
  Widget build(BuildContext context) {
    final isNameCoordsValid = nameCoords.start != null && nameCoords.limit != null;
    final isQuantityCoordsValid = quantityCoords.start != null && quantityCoords.limit != null;
    final isHeightCoordsValid = heightCoords.start != null && heightCoords.limit != null;
    final isWidthCoordsValid = widthCoords.start != null && widthCoords.limit != null;
    //
    final nameParsed = isNameCoordsValid ? NotNullCellCoordSelection(nameCoords.start!, nameCoords.limit!) : null;
    final quantityParsed = isQuantityCoordsValid ? NotNullCellCoordSelection(quantityCoords.start!, quantityCoords.limit!) : null;
    final heightParsed = isHeightCoordsValid ? NotNullCellCoordSelection(heightCoords.start!, heightCoords.limit!) : null;
    final widthParsed = isWidthCoordsValid ? NotNullCellCoordSelection(widthCoords.start!, widthCoords.limit!) : null;
    //
    final dataList = parseData([nameParsed, quantityParsed, heightParsed, widthParsed]);
    if (dataList.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () => saveFile(dataList),
          child: const Text("Export"),
        ),
        SingleChildScrollView(
          child: Row(
            children: List.generate(
              dataList.first.length, // They should be all equal thanks to the transposition
              (rowIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: List.generate(
                      dataList.length + 1,
                      (colIndex) {
                        if (colIndex == 0) {
                          if (rowIndex == 0) return const Text("Name", style: TextStyle(fontWeight: FontWeight.bold));
                          if (rowIndex == 1) return const Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold));
                          if (rowIndex == 2) return const Text("Height", style: TextStyle(fontWeight: FontWeight.bold));
                          if (rowIndex == 3) return const Text("Width", style: TextStyle(fontWeight: FontWeight.bold));
                        }
                        final fixedColIndex = colIndex - 1;
                        String? data = dataList[fixedColIndex][rowIndex];
                        return Text(data ?? "/");
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

//! CellCoordData
class _CellCoordData extends StatelessWidget {
  final String name;
  final CellCoordSelection? coordSelection;
  final bool Function(DataType type) isSelected;
  final Function(DataType type) setSelectedData;
  final (DataType, DataType) typeTuple;
  const _CellCoordData({
    required this.name,
    required this.coordSelection,
    required this.isSelected,
    required this.setSelectedData,
    required this.typeTuple,
  });

  String formatData(CellCoord? coord) => coord == null ? "/" : coord.toString();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name),
            Row(
              children: [
                ChoiceChip(
                  label: Text(formatData(coordSelection?.start)),
                  selected: isSelected(typeTuple.$1),
                  onSelected: (_) => setSelectedData(typeTuple.$1),
                ),
                const SizedBox(width: 5),
                ChoiceChip(
                  label: Text(formatData(coordSelection?.limit)),
                  selected: isSelected(typeTuple.$2),
                  onSelected: (_) => setSelectedData(typeTuple.$2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//! CellContent
class _CellContent extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  const _CellContent({required this.child, required this.onTap});

  @override
  State<_CellContent> createState() => __CellContentState();
}

class __CellContentState extends State<_CellContent> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          color: isHovered ? Colors.green.shade900.withOpacity(0.3) : Colors.transparent,
          child: SizedBox.expand(
            child: Center(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

//! LoadingWidget
class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

//! PickFileWidget
class _PickFileWidget extends StatelessWidget {
  final VoidCallback callback;
  const _PickFileWidget(this.callback);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: callback,
        child: const Text('Select File'),
      ),
    );
  }
}
