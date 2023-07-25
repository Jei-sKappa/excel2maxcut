import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/loading_widget.dart';
import '../../data/repository/prefs_repository.dart';
import '../../domain/cell_coord_selection.dart';
import '../../domain/data_type.dart';
import 'cell_coord_data.dart';
import 'parsed_data.dart';

class DataListSelector extends StatefulWidget {
  final Sheet sheet;
  final PrefsRepository repository;
  final void Function(DataType? type) onSelectedType;
  const DataListSelector({
    super.key,
    required this.sheet,
    required this.repository,
    required this.onSelectedType,
  });

  @override
  State<DataListSelector> createState() => _DataListSelectorState();
}

class _DataListSelectorState extends State<DataListSelector> {
  bool isDataLoaded = false;
  CellCoordSelection? nameCoords;
  CellCoordSelection? quantityCoords;
  CellCoordSelection? heightCoords;
  CellCoordSelection? widthCoords;
  DataType? dataSelected;

  Future loadData({bool shouldSetLoadState = false}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (shouldSetLoadState && isDataLoaded) {
      setState(() {
        isDataLoaded = false;
      });
    }
    nameCoords = await widget.repository.getNameCellIndex();
    quantityCoords = await widget.repository.getQuantityCellIndex();
    heightCoords = await widget.repository.getHeightCellIndex();
    widthCoords = await widget.repository.getWidthCellIndex();
    setState(() {
      isDataLoaded = true;
    });
  }

  void _setSelectedData(DataType type) {
    DataType? newType = type;
    if (dataSelected == type) newType = null;

    setState(() {
      dataSelected = newType;
    });
    widget.onSelectedType(newType);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void didUpdateWidget(DataListSelector oldWidget) {
    loadData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (!isDataLoaded) return const LoadingWidget();

      return Column(
        children: [
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CellCoordData(
                  name: "Name",
                  coordSelection: nameCoords,
                  isSelected: (type) => dataSelected == type,
                  setSelectedData: _setSelectedData,
                  typeTuple: GetTupleDataType.nameTuple,
                ),
                CellCoordData(
                  name: "Quantity",
                  coordSelection: quantityCoords,
                  isSelected: (type) => dataSelected == type,
                  setSelectedData: _setSelectedData,
                  typeTuple: GetTupleDataType.quantityTuple,
                ),
                CellCoordData(
                  name: "Height",
                  coordSelection: heightCoords,
                  isSelected: (type) => dataSelected == type,
                  setSelectedData: _setSelectedData,
                  typeTuple: GetTupleDataType.heightTuple,
                ),
                CellCoordData(
                  name: "Width",
                  coordSelection: widthCoords,
                  isSelected: (type) => dataSelected == type,
                  setSelectedData: _setSelectedData,
                  typeTuple: GetTupleDataType.widthTuple,
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: ParsedData(
              sheet: widget.sheet,
              nameCoords: nameCoords!,
              quantityCoords: quantityCoords!,
              heightCoords: heightCoords!,
              widthCoords: widthCoords!,
            ),
          ),
        ],
      );
    });
  }
}