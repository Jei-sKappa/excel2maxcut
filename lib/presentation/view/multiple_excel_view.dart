import 'package:excel2maxcut/presentation/viewmodel/multiple_excel_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'excel_view.dart';

class MultipleExcelView extends ConsumerStatefulWidget {
  const MultipleExcelView({super.key});

  @override
  ConsumerState<MultipleExcelView> createState() => _MultipleExcelViewState();
}

class _MultipleExcelViewState extends ConsumerState<MultipleExcelView> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final multipleExcelViewModel = ref.read(multipleExcelViewModelProvider.notifier);
    final excelFilesCount = ref.watch(multipleExcelViewModelProvider.select((state) => state.count));
    ref.listen(multipleExcelViewModelProvider, (previous, next) {
      final selectedPage = next.selectedPage;
      if (previous?.selectedPage != selectedPage) {
        pageController.animateToPage(
          selectedPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
    return Column(
      children: [
        SizedBox(
          height: 55,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: multipleExcelViewModel.add,
              ),
              if (excelFilesCount > 1)
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: multipleExcelViewModel.remove,
                ),
              if (excelFilesCount > 1)
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: excelFilesCount,
                    itemBuilder: (context, index) {
                      return Consumer(
                        builder: (context, ref, child) {
                          ref.watch(multipleExcelViewModelProvider);
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ChoiceChip(
                              onSelected: (_) => multipleExcelViewModel.selectPage(index),
                              selected: multipleExcelViewModel.isSelected(index),
                              label: Text('Excel ${index + 1}'),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            children: List.generate(
              excelFilesCount,
              (index) => ExcelView(index),
            ),
          ),
        ),
      ],
    );
  }
}
