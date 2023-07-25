import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

import '../widgets/excel_table.dart';

class ExcelView extends StatelessWidget {
  final Excel excel;
  const ExcelView(this.excel, {super.key});

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
                return ExcelTable(excel.tables[tableNames.elementAt(index)]!);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
