import 'package:flutter/material.dart';

class CellContent extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  const CellContent({super.key, required this.child, required this.onTap});

  @override
  State<CellContent> createState() => _CellContentState();
}

class _CellContentState extends State<CellContent> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          color: isHovered ? Colors.green.shade900.withOpacity(0.3) : Colors.transparent,
          child: SizedBox.expand(
            child: Center(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
