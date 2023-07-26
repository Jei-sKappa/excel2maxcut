import 'package:excel/excel.dart';
import 'package:excel2maxcut/domain/cell_coord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/cell_content_viewmodel.dart';

class CellContent extends StatefulWidget {
  final CellCoord coord;
  final Data? data;
  const CellContent({
    required this.coord,
    required this.data,
    super.key,
  });

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
      child: Consumer(
        builder: (context, ref, child) {
          final cellViewModel = ref.read(cellContentViewModelProvider.notifier);
          return GestureDetector(
            onTap: () => cellViewModel.tapHanlder(widget.coord),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              color: isHovered ? Colors.purple.shade900.withOpacity(0.3) : Colors.transparent,
              child: child,
            ),
          );
        },
        child: SizedBox.expand(
          child: Center(
            child: Builder(
              builder: (context) {
                if (widget.data == null) {
                  return const SizedBox.shrink();
                }

                final text = widget.data!.value.toString();
                CellStyle? cellStyle = widget.data!.cellStyle;
                // final textColor = cellStyle?.fontColor;
                // final fontSize = cellStyle?.fontSize;
                final fontWeight = cellStyle?.isBold == true ? FontWeight.bold : null;
                final fontStyle = cellStyle?.isItalic == true ? FontStyle.italic : null;
                return Text(
                  text,
                  style: TextStyle(
                    fontWeight: fontWeight,
                    fontStyle: fontStyle,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
