import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/loading_widget.dart';
import '../viewmodel/excel_viewmodel.dart';
import '../viewmodel/sheet_viewmodel.dart';
import '../widgets/maxcut_data_view.dart';
import '../widgets/sheet_view.dart';

class ExcelView extends StatelessWidget {
  /// The index of the ExcelFile to be displayed from all the ExcelFiles Opened
  final int index;

  const ExcelView(
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final viewModel = ref.read(excelViewModelProvider(index).notifier);
        return ref.watch(excelViewModelProvider(index)).maybeWhen(
              loading: () => const LoadingWidget(),
              orElse: () => _PickExcelFileWidget(viewModel.getFile),
              success: (excel) {
                return Column(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: MaxCutDataView(index),
                    ),
                    const Divider(),
                    _ExcelTablesBar(excel.tables, index: index),
                    Flexible(
                      fit: FlexFit.tight,
                      child: SheetView(index),
                    ),
                  ],
                );
              },
            );
      },
    );
  }
}

class _ExcelTablesBar extends ConsumerStatefulWidget {
  final Map<String, Sheet> tables;
  final int index;
  const _ExcelTablesBar(this.tables, {required this.index});

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
    sheetViewModel = ref.read(sheetViewModelProvider(widget.index).notifier);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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

class _PickExcelFileWidget extends StatelessWidget {
  final VoidCallback onPicked;
  const _PickExcelFileWidget(this.onPicked);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPicked,
        child: const Text('Select Excel File'),
      ),
    );
  }
}
