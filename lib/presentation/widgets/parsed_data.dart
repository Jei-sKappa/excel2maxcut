//! ParsedData
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/cell_coord.dart';
import '../../domain/cell_coord_selection.dart';
import '../../domain/excel_row.dart';

class ParsedData extends StatelessWidget {
  final Sheet sheet;
  final CellCoordSelection nameCoords;
  final CellCoordSelection quantityCoords;
  final CellCoordSelection heightCoords;
  final CellCoordSelection widthCoords;
  const ParsedData({
    super.key,
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
