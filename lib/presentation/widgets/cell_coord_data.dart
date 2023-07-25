import 'package:flutter/material.dart';

import '../../domain/cell_coord.dart';
import '../../domain/cell_coord_selection.dart';
import '../../domain/data_type.dart';

class CellCoordData extends StatelessWidget {
  final String name;
  final CellCoordSelection? coordSelection;
  final bool Function(DataType type) isSelected;
  final Function(DataType type) setSelectedData;
  final (DataType, DataType) typeTuple;
  const CellCoordData({
    super.key,
    required this.name,
    required this.coordSelection,
    required this.isSelected,
    required this.setSelectedData,
    required this.typeTuple,
  });

  String formatData(CellCoord? coord) => coord == null ? "/" : coord.toString();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name),
            Row(
              children: [
                ChoiceChip(
                  label: Text(formatData(coordSelection?.start)),
                  selected: isSelected(typeTuple.$1),
                  onSelected: (_) => setSelectedData(typeTuple.$1),
                ),
                const SizedBox(width: 5),
                ChoiceChip(
                  label: Text(formatData(coordSelection?.limit)),
                  selected: isSelected(typeTuple.$2),
                  onSelected: (_) => setSelectedData(typeTuple.$2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
