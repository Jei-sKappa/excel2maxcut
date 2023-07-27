import 'package:flutter/material.dart';
import '../widgets/save_file_button.dart';
import 'main_view.dart';

class SkeletonView extends StatelessWidget {
  const SkeletonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excel Table'),
        elevation: 1,
        actions: const [SaveFileButton()],
      ),
      body: const SafeArea(
        child: MainView(),
      ),
    );
  }
}
