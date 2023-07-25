import 'package:data_table_2/data_table_2.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

import '../../core/extension/number_to_aphabet.dart';
import '../../data/datasource/prefs_datasource.dart';
import '../../data/repository/prefs_repository.dart';
import '../../domain/cell_coord.dart';
import '../../domain/data_type.dart';
import '../../domain/excel_row.dart';
import 'cell_content.dart';
import 'data_list_selector.dart';

class ExcelTable extends StatefulWidget {
  final Sheet sheet;
  const ExcelTable(this.sheet, {super.key});

  @override
  State<ExcelTable> createState() => _ExcelTableState();
}

class _ExcelTableState extends State<ExcelTable> {
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
        DataListSelector(
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
              CellContent(
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
            CellContent(
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
