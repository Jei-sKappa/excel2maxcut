import 'package:shared_preferences/shared_preferences.dart';

import '../../core/database/constants.dart';

const _nameField = "${databasePrefix}_name";
const _quantityField = "${databasePrefix}_quantity";
const _heightField = "${databasePrefix}_height";
const _widthField = "${databasePrefix}_width";
const _nameFieldRow = "${_nameField}_row";
const _nameFieldCol = "${_nameField}_column";
const _quantityFieldRow = "${_quantityField}_row";
const _quantityFieldCol = "${_quantityField}_column";
const _heightFieldRow = "${_heightField}_row";
const _heightFieldCol = "${_heightField}_column";
const _widthFieldRow = "${_widthField}_row";
const _widthFieldCol = "${_widthField}_column";
const _nameFieldRowLimit = "${_nameFieldRow}_limit";
const _nameFieldColLimit = "${_nameFieldCol}_limit";
const _quantityFieldRowLimit = "${_quantityFieldRow}_limit";
const _quantityFieldColLimit = "${_quantityFieldCol}_limit";
const _heightFieldRowLimit = "${_heightFieldRow}_limit";
const _heightFieldColLimit = "${_heightFieldCol}_limit";
const _widthFieldRowLimit = "${_widthFieldRow}_limit";
const _widthFieldColLimit = "${_widthFieldCol}_limit";

class CellCoordsDataSource {
  final Future<SharedPreferences> _db;

  CellCoordsDataSource(Future<SharedPreferences> isarDB) : _db = isarDB;

  Future<int?> getNameCellRowIndex() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_nameFieldRow);
    return index;
  }

  Future<bool> setNameCellRowIndex(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_nameFieldRow, index);
    return response;
  }

  Future<int?> getNameCellColIndex() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_nameFieldCol);
    return index;
  }

  Future<bool> setNameCellColIndex(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_nameFieldCol, index);
    return response;
  }

  Future<int?> getQuantityCellRowIndex() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_quantityFieldRow);
    return index;
  }

  Future<bool> setQuantityCellRowIndex(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_quantityFieldRow, index);
    return response;
  }

  Future<int?> getQuantityCellColIndex() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_quantityFieldCol);
    return index;
  }

  Future<bool> setQuantityCellColIndex(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_quantityFieldCol, index);
    return response;
  }

  Future<int?> getHeightCellRowIndex() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_heightFieldRow);
    return index;
  }

  Future<bool> setHeightCellRowIndex(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_heightFieldRow, index);
    return response;
  }

  Future<int?> getHeightCellColIndex() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_heightFieldCol);
    return index;
  }

  Future<bool> setHeightCellColIndex(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_heightFieldCol, index);
    return response;
  }

  Future<int?> getWidthCellRowIndex() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_widthFieldRow);
    return index;
  }

  Future<bool> setWidthCellRowIndex(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_widthFieldRow, index);
    return response;
  }

  Future<int?> getWidthCellColIndex() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_widthFieldCol);
    return index;
  }

  Future<bool> setWidthCellColIndex(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_widthFieldCol, index);
    return response;
  }

  Future<int?> getNameCellRowIndexLimit() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_nameFieldRowLimit);
    return index;
  }

  Future<bool> setNameCellRowIndexLimit(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_nameFieldRowLimit, index);
    return response;
  }

  Future<int?> getNameCellColIndexLimit() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_nameFieldColLimit);
    return index;
  }

  Future<bool> setNameCellColIndexLimit(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_nameFieldColLimit, index);
    return response;
  }

  Future<int?> getQuantityCellRowIndexLimit() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_quantityFieldRowLimit);
    return index;
  }

  Future<bool> setQuantityCellRowIndexLimit(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_quantityFieldRowLimit, index);
    return response;
  }

  Future<int?> getQuantityCellColIndexLimit() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_quantityFieldColLimit);
    return index;
  }

  Future<bool> setQuantityCellColIndexLimit(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_quantityFieldColLimit, index);
    return response;
  }

  Future<int?> getHeightCellRowIndexLimit() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_heightFieldRowLimit);
    return index;
  }

  Future<bool> setHeightCellRowIndexLimit(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_heightFieldRowLimit, index);
    return response;
  }

  Future<int?> getHeightCellColIndexLimit() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_heightFieldColLimit);
    return index;
  }

  Future<bool> setHeightCellColIndexLimit(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_heightFieldColLimit, index);
    return response;
  }

  Future<int?> getWidthCellRowIndexLimit() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_widthFieldRowLimit);
    return index;
  }

  Future<bool> setWidthCellRowIndexLimit(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_widthFieldRowLimit, index);
    return response;
  }

  Future<int?> getWidthCellColIndexLimit() async {
    final prefs = await _db;
    final int? index = prefs.getInt(_widthFieldColLimit);
    return index;
  }

  Future<bool> setWidthCellColIndexLimit(int index) async {
    final prefs = await _db;
    final bool response = await prefs.setInt(_widthFieldColLimit, index);
    return response;
  }
}
