import 'package:flutter/material.dart';

import '../widgets/config_interactor.dart';
import 'multiple_excel_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 80,
          child: ConfigInteractor(),
        ),
        Divider(),
        Flexible(
          fit: FlexFit.tight,
          child: MultipleExcelView(),
        ),
      ],
    );
  }
}
