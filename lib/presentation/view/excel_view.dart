import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/sheet_viewmodel.dart';
import '../widgets/sheet_view.dart';

class ExcelView extends StatelessWidget {
  final Excel excel;
  const ExcelView(this.excel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ExcelTablesBar(excel.tables),
        const Flexible(
          fit: FlexFit.tight,
          child: SheetView(),
        ),
      ],
    );
  }
}

class _ExcelTablesBar extends ConsumerStatefulWidget {
  final Map<String, Sheet> tables;
  const _ExcelTablesBar(this.tables);

  @override
  ConsumerState<_ExcelTablesBar> createState() => _ExcelTablesBarState();
}

class _ExcelTablesBarState extends ConsumerState<_ExcelTablesBar> with TickerProviderStateMixin {
  late TabController _tabController;
  late final SheetViewModel sheetViewModel;
  late final Iterable<String> tableNames;

  @override
  void initState() {
    tableNames = widget.tables.keys;
    _tabController = TabController(length: widget.tables.length, vsync: this);
    _tabController.addListener(tabListener);
    sheetViewModel = ref.read(sheetViewModelProvider.notifier);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(tabListener);
    _tabController.dispose();
    super.dispose();
  }

  void tabListener() {
    final tableIndex = _tabController.index;
    final sheet = widget.tables[tableNames.elementAt(tableIndex)]!;
    sheetViewModel.set(sheet);
  }

  void setSheet(int index) {
    final sheet = widget.tables[tableNames.elementAt(index)]!;
    sheetViewModel.set(sheet);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setSheet(_tabController.index);
    });    
    return TabBar(
      controller: _tabController,
      onTap: setSheet,
      tabs: List.generate(
        widget.tables.keys.length,
        (index) => Tab(text: tableNames.elementAt(index)),
      ),
      isScrollable: true,
    );
  }
}
