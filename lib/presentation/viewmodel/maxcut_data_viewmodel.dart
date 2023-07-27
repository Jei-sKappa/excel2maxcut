import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_module.dart';
import '../../domain/cell_coord.dart';
import '../../domain/cell_selection.dart';
import '../../domain/maxcutdata.dart';
import '../state/state.dart';
import 'config_type_viewmodel.dart';
import 'sheet_viewmodel.dart';

part 'maxcut_data_viewmodel.g.dart';

/// Represents a selection of cells in a grid.
/// Es: Type Name, A3 -> A7
typedef _TypedCellSelection = (MaxCutDataType, CellSelection?);

/// Represents the data founded in a selection of cells in a grid.
/// Es: Type Name, [Name1, Name2, Name3]
typedef _TypedCellSelectionValueList = (MaxCutDataType, List<String>);

@Riverpod(keepAlive: true)
class MaxCutDataViewModel extends _$MaxCutDataViewModel {
  @override
  State<MaxCutResult> build(int index) {
    _parse();
    return const State.init();
  }

  Future _parse() async {
    final sheet = ref.watch(sheetViewModelProvider(index));
    debugPrint("Try Parsing...");

    //TODO: Handle Exception (for example in repository inside _getCoordsTuple)
    // final sheet = ref.watch(sheetViewModelProvider);
    if (sheet == null) {
      debugPrint("Undo Parsing: Sheet is null");
      const State.init();
      return;
    }

    debugPrint("Parsing sheet ${sheet.sheetName}...");
    state = const State.loading();
    await Future.delayed(const Duration(seconds: 1));

    final coordsTuple = await _getCoordsTuple();
    final selections = _convertActionTupleToCellSelection(coordsTuple);
    final parsedData = _parseAllAppData(sheet, selections);
    final maxCutObjects = _convertToMaxCut(parsedData);
    final MaxCutResult result = MaxCutResult(maxCutObjects);

    // print("Parsed data: ${result.dump()}");
    state = State.success(result);
  }

  Future<bool> saveFile() async {
    final result = state.data;
    if (result == null) {
      return false;
    }

    String csvData = result.dump();
    debugPrint(csvData);
    final String path = (await getApplicationSupportDirectory()).path;
    // final filePath = "$path/excel2maxcut-${DateTime.now()}.csv";
    final filePath = "$path/export.csv";
    debugPrint(filePath);
    final File file = File(filePath);
    final savedFile = await file.writeAsString(csvData);
    if (!(await savedFile.exists())) {
      return false;
    }

    return true;
  }

  bool customizeData(MaxCutData newData, MaxCutDataType dataType, int objectIndex) {
    final result = state.data;
    if (result == null) {
      return false;
    }

    if (objectIndex < 0 || objectIndex >= result.objects.length) {
      return false;
    }

    result.objects[objectIndex][dataType] = newData;
    state = State.success(result);

    return true;
  }

  /// {"CoordTitle": ("CoordStart", "CoordLimit"), ...}
  Future<List<ConfigTypeActionTuple<CellCoord?>>> _getCoordsTuple() async {
    final repository = ref.read(prefsRepositoryProvider);
    //TODO: Refactor this
    final responses = await ConfigTypeAction.actionAllFuture((configType) async => await repository.get(configType));
    return responses;
  }

  List<_TypedCellSelection> _convertActionTupleToCellSelection(List<ConfigTypeActionTuple<CellCoord?>> actionTuples) {
    final cellSelections = <_TypedCellSelection>[];
    for (final actionTuple in actionTuples) {
      final start = actionTuple.tuple.$1;
      final limit = actionTuple.tuple.$2;
      if (start == null || limit == null) {
        cellSelections.add((actionTuple.name, null));
        //TODO: Show a warning
        continue;
      }

      final cellSelection = CellSelection.fromCellCoords(start: start, limit: limit);
      if (cellSelection == null) {
        // CoordsTuple are not valid togheter
        //TODO: Show a warning
      }
      cellSelections.add((actionTuple.name, cellSelection));
    }

    return cellSelections;
  }

  /// Input: ExcelSheet, CellSelection
  ///
  /// Output: List<String>
  ///
  /// Es:
  ///
  /// A3 -> A7
  ///
  /// [Name1, Name2, Name3]
  List<String> _parseAppData(Sheet sheet, CellSelection cellSelection) {
    final parsedData = <String>[];
    final sheetRows = sheet.rows;

    final fixedIndex = cellSelection.fixed; // Fixed index: the common index from the coords

    for (int movingIndex = cellSelection.from; movingIndex <= cellSelection.to; movingIndex++) {
      late final Data? cell;
      try {
        if (cellSelection.isVertical) {
          cell = sheetRows[movingIndex][fixedIndex];
        } else {
          cell = sheetRows[fixedIndex][movingIndex];
        }
      } on RangeError catch (e) {
        debugPrint("Caught RangeError: $e");
        continue;
      }

      if (cell == null || cell.isFormula) continue;
      // final coord = CellCoord.fromCellIndex(cell.cellIndex);
      // print("Coord: $coord | Value: ${cell.value}");
      parsedData.add("${cell.value}");
    }

    return parsedData;
  }

  /// Input: ExcelSheet, List<CellSelection>
  ///
  /// Output: Maxtrix<String>>
  ///
  /// Es:
  ///
  /// [ A3 -> A7, B3 -> B7]
  ///
  /// [(Name, [Name1, Name2, Name3]), (Quantity,[Quantity1, Quantity2, Quantity3]) ]
  List<_TypedCellSelectionValueList> _parseAllAppData(Sheet sheet, List<_TypedCellSelection> typedSelections) {
    final parsedAllTypesData = <_TypedCellSelectionValueList>[];

    for (final typedSelection in typedSelections) {
      final type = typedSelection.$1;
      final selection = typedSelection.$2;
      if (selection == null) {
        parsedAllTypesData.add((type, []));
      } else {
        final parsedDasta = _parseAppData(sheet, selection);
        parsedAllTypesData.add((type, parsedDasta));
      }
    }

    return parsedAllTypesData;
  }

  /// Convert a list of typed datas to a list of MaxCutObjects
  ///
  /// Es:
  ///
  /// Input:
  ///
  /// (Red,    [ Red1,    Red2,   Red3                                   ])
  ///
  /// Blue,    [ Blue1,   Blue2,  Blue3,  Blue4                          ])
  ///
  /// (Green,  [ Green1,  Green2, Green3, Green4, Green5, Green6, Green7 ])
  ///
  /// (Yellow, [ Yellow1, Yellow2                                        ])
  ///
  /// (Pink,   [ Pink1,   Pink2,  Pink3,  Pink4                          ])
  ///
  ///
  /// Output:
  ///
  /// MaxCutObject{ Red: Red1, Blue: Blue1, Green: Green1, Yellow: Yellow1, Pink: Pink1 }
  ///
  /// MaxCutObject{ Red: Red2, Blue: Blue2, Green: Green2, Yellow: Yellow2, Pink: Pink2 }
  ///
  /// MaxCutObject{ Red: Red3, Blue: Blue3, Green: Green3,                , Pink: Pink3 }
  ///
  /// MaxCutObject{            Blue: Blue4, Green: Green4,                , Pink: Pink4 }
  ///
  /// MaxCutObject{                         Green: Green5                               }
  ///
  /// MaxCutObject{                         Green: Green6                               }
  ///
  /// MaxCutObject{                         Green: Green7                               }
  List<MaxCutObject> _convertToMaxCut(List<_TypedCellSelectionValueList> typedDatas) {
    int maxCellValuesCount = 0; // The max number of values in a cellselection
    for (int i = 0; i < typedDatas.length; i++) {
      final cellSelectionValuesCount = typedDatas[i].$2.length;
      if (cellSelectionValuesCount > maxCellValuesCount) {
        maxCellValuesCount = cellSelectionValuesCount;
      }
    }

    final objects = List.generate(maxCellValuesCount, (_) => <MaxCutDataType, String>{});

    for (final typedData in typedDatas) {
      final type = typedData.$1;
      final cellValues = typedData.$2;
      for (int i = 0; i < cellValues.length; i++) {
        final cellValue = cellValues[i];

        objects[i][type] = cellValue;
      }
    }

    return objects;
  }
}
