import 'package:excel/excel.dart';
import 'package:excel2maxcut/presentation/view/excel_view.dart';
import 'package:flutter/material.dart';

import '../widgets/app_data_view.dart';
import '../widgets/config_interactor.dart';

class MainView extends StatelessWidget {
  final Excel excel;
  const MainView(this.excel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
          child: ConfigInteractor(),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: const AppDataView(),
        ),
        const Divider(),
        Flexible(
          fit: FlexFit.tight,
          child: ExcelView(excel),
        ),
      ],
    );
  }
}
