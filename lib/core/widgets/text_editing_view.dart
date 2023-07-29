import 'package:flutter/material.dart';

class TextEditingView extends StatefulWidget {
  final String text;
  final bool showPrevious;
  final void Function(String) onSubmitted;
  final void Function(String) onSetPreset;
  const TextEditingView(
    this.text, {
    this.showPrevious = true,
    required this.onSubmitted,
    required this.onSetPreset,
    super.key,
  });

  @override
  State<TextEditingView> createState() => _TextEditingViewState();
}

class _TextEditingViewState extends State<TextEditingView> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Edit Text",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (widget.showPrevious && widget.text != "")
              Text(
                'Previous: "${widget.text}"',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        Expanded(
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    onEditingComplete: () => widget.onSubmitted(controller.text.trim()),
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      labelText: 'Enter new value',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => widget.onSubmitted(controller.text.trim()),
                  icon: const Icon(Icons.send_rounded),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () => widget.onSetPreset(controller.text.trim()),
            child: const Text("Save and Add to Presets"),
          ),
        ),
      ],
    );
  }
}
