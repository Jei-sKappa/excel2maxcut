import 'dart:io';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:excel2maxcut/domain/cell_coord.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/extension/transpose_matrix_extension.dart';
import '../../data/data_module.dart';
import '../../domain/cell_selection.dart';
import '../../domain/app_data.dart';
import '../state/state.dart';
import 'config_type_viewmodel.dart';
import 'sheet_viewmodel.dart';

part 'app_data_viewmodel.g.dart';

@riverpod
class AppDataViewModel extends _$AppDataViewModel {
  @override
  State<List<AppData>> build() {
    _parse();
    return const State.loading();
  }

  /// {"CoordTitle": ("CoordStart", "CoordLimit"), ...}
  Future<List<ConfigTypeActionTuple<CellCoord?>>> _getCoordsTuple() async {
    final repository = ref.read(prefsRepositoryProvider);
    //TODO: Refactor this
    final responses = await ConfigTypeAction.actionAllFuture((configType) async => await repository.get(configType));
    return responses;
  }

  List<NamedCellSelection> _convertActionTupleToCellSelection(List<ConfigTypeActionTuple<CellCoord?>> actionTuples) {
    final cellSelections = <NamedCellSelection>[];
    for (final actionTuple in actionTuples) {
      final start = actionTuple.tuple.$1;
      final limit = actionTuple.tuple.$2;
      if (start == null || limit == null) {
        cellSelections.add(NamedCellSelection(actionTuple.name));
        //TODO: Show a warning
        continue;
      }

      final cellSelection = CellSelection.fromCellCoords(start: start, limit: limit);
      if (cellSelection == null) {
        //TODO: Show a warning
      }
      cellSelections.add(NamedCellSelection(actionTuple.name, cellSelection));
    }

    return cellSelections;
  }

  Future _parse() async {
    //TODO: Handle Exception (for example in repository inside _getCoordsTuple)
    final sheet = ref.watch(sheetViewModelProvider);
    print("Parsing sheet ${sheet?.sheetName}...");
    if (sheet == null) {
      const State.init();
      return;
    }

    state = const State.loading();
    await Future.delayed(const Duration(seconds: 1));

    final coordsTuple = await _getCoordsTuple();
    final selections = _convertActionTupleToCellSelection(coordsTuple);
    final parsedData = _parseAllAppData(sheet, selections);
    final appDataList = _adjustData(parsedData);

    state = State.success(appDataList);
  }

  List<AppDataValue> _parseAppData(Sheet sheet, CellSelection cellSelection) {
    final parsedData = <AppDataValue>[];
    final sheetRows = sheet.rows;

    final fixedIndex = cellSelection.fixed; // Fixed index: the common index from the coords

    for (int movingIndex = cellSelection.from; movingIndex <= cellSelection.to; movingIndex++) {
      late final Data? cell;
      if (cellSelection.isVertical) {
        cell = sheetRows[movingIndex][fixedIndex];
      } else {
        cell = sheetRows[fixedIndex][movingIndex];
      }

      if (cell == null || cell.isFormula) continue;
      // final coord = CellCoord.fromCellIndex(cell.cellIndex);
      // print("Coord: $coord | Value: ${cell.value}");
      parsedData.add("${cell.value}");
    }

    return parsedData;
  }

  List<AppData> _parseAllAppData(Sheet sheet, List<NamedCellSelection> namedSelections) {
    final parsedData = <AppData>[];
    final names = <String>[];

    for (final namedSelection in namedSelections) {
      names.add(namedSelection.name);

      final selection = namedSelection.value;
      if (selection == null) {
        parsedData.add([]);
      } else {
        parsedData.add(_parseAppData(sheet, selection));
      }
    }

    return parsedData;
  }

  List<AppData> _adjustData(List<AppData> dataList) => dataList.transpose();

  void saveFile(List<List<dynamic>?>? data) async {
    String csvData = const ListToCsvConverter().convert(data, fieldDelimiter: ";");
    final String path = (await getApplicationSupportDirectory()).path;
    // final filePath = "$path/excel2maxcut-${DateTime.now()}.csv";
    final filePath = "$path/export.csv";
    print(filePath);
    final File file = File(filePath);
    await file.writeAsString(csvData);
  }
}
