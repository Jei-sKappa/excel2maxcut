import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'multiple_excel_viewmodel.g.dart';

class MultipleExcelState{
  final int count;
  final int selectedPage;

  const MultipleExcelState({
    required this.count,
    this.selectedPage = 0,
  });

  MultipleExcelState copyWith({
    int? count,
    int? selectedPage,
  }) {
    return MultipleExcelState(
      count: count ?? this.count,
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }
}

@riverpod
class MultipleExcelViewModel extends _$MultipleExcelViewModel {
  @override
  MultipleExcelState build() => const MultipleExcelState(count: 1);

  void add() {
    state = state.copyWith(count: state.count + 1);
  }

  void remove() {
    if (state.count == 1) return;

    int? selectedPage;
    if (state.selectedPage == state.count-1){
      selectedPage = state.selectedPage - 1;
    }
    state = state.copyWith(count: state.count - 1, selectedPage: selectedPage);
  }

  void selectPage(int index) {
    state = state.copyWith(selectedPage: index);
  }

  bool isSelected(int index) => index == state.selectedPage;
}
