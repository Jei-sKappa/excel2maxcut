import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/loading_widget.dart';
import '../viewmodel/skeleton_viewmodel.dart';
import 'main_view.dart';

class SkeletonView extends ConsumerWidget {
  const SkeletonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excel Table'),
        elevation: 1,
      ),
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final viewModel = ref.read(skeletonViewModelProvider.notifier);
          return ref.watch(skeletonViewModelProvider).maybeWhen(
                loading: () => const LoadingWidget(),
                success: (excel) => MainView(excel),
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
