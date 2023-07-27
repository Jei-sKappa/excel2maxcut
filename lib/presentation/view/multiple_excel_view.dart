import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/loading_widget.dart';
import '../viewmodel/multiple_excel_viewmodel.dart';
import 'excel_view.dart';

class MultipleExcelView extends ConsumerStatefulWidget {
  const MultipleExcelView({super.key});

  @override
  ConsumerState<MultipleExcelView> createState() => _MultipleExcelViewState();
}

class _MultipleExcelViewState extends ConsumerState<MultipleExcelView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(multipleExcelViewModelProvider.notifier).getFile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final viewModel = ref.read(multipleExcelViewModelProvider.notifier);
      return ref.watch(multipleExcelViewModelProvider).maybeWhen(
            success: (excel) => ExcelView(excel),
            loading: () => const LoadingWidget(),
            orElse: () => _PickExcelFileWidget(viewModel.getFile),
          );
    });
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
