import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/extension/number_to_aphabet_extension.dart';
import '../../domain/cell_coord.dart';
import '../../domain/excel_row.dart';
import '../viewmodel/sheet_viewmodel.dart';
import 'cell_content.dart';

class SheetView extends StatefulWidget {
  const SheetView({super.key});

  @override
  State<SheetView> createState() => _SheetViewState();
}

class _SheetViewState extends State<SheetView> {
  //TODO Check if they are needed
  late ScrollController vScrollController;
  late ScrollController hScrollController;

  @override
  void initState() {
    vScrollController = ScrollController();
    hScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    vScrollController.dispose();
    hScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light; //TODO Create ThemeProvider
    final staticCellsColor = isLightTheme ? Colors.grey.shade200 : Colors.grey.shade800;
    final firstStaticCellColor = isLightTheme ? Colors.grey.shade400 : Colors.grey.shade900;
    return Consumer(
      builder: (context, ref, _) {
        final sheet = ref.watch(sheetViewModelProvider);
        if (sheet == null) return const Text("No sheet selected");

        return DataTable2(
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
          columns: _getCols(sheet.maxCols),
          rows: _getRows(sheet.rows),
        );
      },
    );
  }

  List<DataColumn> _getCols(int cols) {
    return List.generate(
      cols + 1,
      (index) => DataColumn(
        label: Center(
          child: Text(index.toAlphabet()),
        ),
      ),
    );
  }

  List<DataRow> _getRows(List<ExcelRow> rows) {
    return List.generate(rows.length, (rowIndex) {
      final ExcelRow row = rows[rowIndex];
      return DataRow(
        cells: List.generate(row.length + 1, (columnIndex) {
          // final fixedRowIndex = rowIndex + 1;
          final fixedColumnIndex = columnIndex - 1;
          if (columnIndex == 0) return DataCell(Center(child: Text('${rowIndex + 1}')));

          final Data? cell = row[fixedColumnIndex];
          final CellCoord cellCoord = CellCoord(rowIndex, fixedColumnIndex);
          return DataCell(
            CellContent(
              coord: cellCoord,
              data: cell,
            ),
          );
        }),
      );
    });
  }
}
