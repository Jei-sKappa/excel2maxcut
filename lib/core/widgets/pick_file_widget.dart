import 'package:flutter/material.dart';

class PickFileWidget extends StatelessWidget {
  final VoidCallback callback;
  const PickFileWidget(this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: callback,
        child: const Text('Select File'),
      ),
    );
  }
}
