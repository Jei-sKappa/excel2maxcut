import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/loading_widget.dart';
import '../viewmodel/skeleton_viewmodel.dart';
import '../widgets/save_file_button.dart';
import 'main_view.dart';

class SkeletonView extends ConsumerStatefulWidget {
  const SkeletonView({Key? key}) : super(key: key);

  @override
  ConsumerState<SkeletonView> createState() => _SkeletonViewState();
}

class _SkeletonViewState extends ConsumerState<SkeletonView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(skeletonViewModelProvider.notifier).getFile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excel Table'),
        elevation: 1,
        actions: const [SaveFileButton()],
      ),
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final viewModel = ref.read(skeletonViewModelProvider.notifier);
          return ref.watch(skeletonViewModelProvider).maybeWhen(
                success: (excel) => MainView(excel),
                loading: () => const LoadingWidget(),
                orElse: () => _PickFileWidget(viewModel.getFile),
              );
        }),
      ),
    );
  }
}

class _PickFileWidget extends StatelessWidget {
  final VoidCallback onPicked;
  const _PickFileWidget(this.onPicked);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPicked,
        child: const Text('Select File'),
      ),
    );
  }
}
