import 'package:shared_preferences/shared_preferences.dart';

class PrefsDataSource {
  static final _prefs = SharedPreferences.getInstance();
  //
  static const _prefix = "exel2maxcut";
  //
  static const _nameField = "${_prefix}_name";
  static const _quantityField = "${_prefix}_quantity";
  static const _heightField = "${_prefix}_height";
  static const _widthField = "${_prefix}_width";
  //
  static const _nameFieldRow = "${_nameField}_row";
  static const _nameFieldCol = "${_nameField}_column";
  static const _quantityFieldRow = "${_quantityField}_row";
  static const _quantityFieldCol = "${_quantityField}_column";
  static const _heightFieldRow = "${_heightField}_row";
  static const _heightFieldCol = "${_heightField}_column";
  static const _widthFieldRow = "${_widthField}_row";
  static const _widthFieldCol = "${_widthField}_column";
  //
  static const _nameFieldRowLimit = "${_nameFieldRow}_limit";
  static const _nameFieldColLimit = "${_nameFieldCol}_limit";
  static const _quantityFieldRowLimit = "${_quantityFieldRow}_limit";
  static const _quantityFieldColLimit = "${_quantityFieldCol}_limit";
  static const _heightFieldRowLimit = "${_heightFieldRow}_limit";
  static const _heightFieldColLimit = "${_heightFieldCol}_limit";
  static const _widthFieldRowLimit = "${_widthFieldRow}_limit";
  static const _widthFieldColLimit = "${_widthFieldCol}_limit";

  Future<int?> getNameCellRowIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_nameFieldRow);
    return index;
  }

  Future<bool> setNameCellRowIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_nameFieldRow, index);
    return response;
  }

  Future<int?> getNameCellColIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_nameFieldCol);
    return index;
  }

  Future<bool> setNameCellColIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_nameFieldCol, index);
    return response;
  }

  Future<int?> getQuantityCellRowIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_quantityFieldRow);
    return index;
  }

  Future<bool> setQuantityCellRowIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_quantityFieldRow, index);
    return response;
  }

  Future<int?> getQuantityCellColIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_quantityFieldCol);
    return index;
  }

  Future<bool> setQuantityCellColIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_quantityFieldCol, index);
    return response;
  }

  Future<int?> getHeightCellRowIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_heightFieldRow);
    return index;
  }

  Future<bool> setHeightCellRowIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_heightFieldRow, index);
    return response;
  }

  Future<int?> getHeightCellColIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_heightFieldCol);
    return index;
  }

  Future<bool> setHeightCellColIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_heightFieldCol, index);
    return response;
  }

  Future<int?> getWidthCellRowIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_widthFieldRow);
    return index;
  }

  Future<bool> setWidthCellRowIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_widthFieldRow, index);
    return response;
  }

  Future<int?> getWidthCellColIndex() async {
    final db = await _prefs;
    final int? index = db.getInt(_widthFieldCol);
    return index;
  }

  Future<bool> setWidthCellColIndex(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_widthFieldCol, index);
    return response;
  }

  Future<int?> getNameCellRowIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_nameFieldRowLimit);
    return index;
  }

  Future<bool> setNameCellRowIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_nameFieldRowLimit, index);
    return response;
  }

  Future<int?> getNameCellColIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_nameFieldColLimit);
    return index;
  }

  Future<bool> setNameCellColIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_nameFieldColLimit, index);
    return response;
  }

  Future<int?> getQuantityCellRowIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_quantityFieldRowLimit);
    return index;
  }

  Future<bool> setQuantityCellRowIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_quantityFieldRowLimit, index);
    return response;
  }

  Future<int?> getQuantityCellColIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_quantityFieldColLimit);
    return index;
  }

  Future<bool> setQuantityCellColIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_quantityFieldColLimit, index);
    return response;
  }

  Future<int?> getHeightCellRowIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_heightFieldRowLimit);
    return index;
  }

  Future<bool> setHeightCellRowIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_heightFieldRowLimit, index);
    return response;
  }

  Future<int?> getHeightCellColIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_heightFieldColLimit);
    return index;
  }

  Future<bool> setHeightCellColIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_heightFieldColLimit, index);
    return response;
  }

  Future<int?> getWidthCellRowIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_widthFieldRowLimit);
    return index;
  }

  Future<bool> setWidthCellRowIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_widthFieldRowLimit, index);
    return response;
  }

  Future<int?> getWidthCellColIndexLimit() async {
    final db = await _prefs;
    final int? index = db.getInt(_widthFieldColLimit);
    return index;
  }

  Future<bool> setWidthCellColIndexLimit(int index) async {
    final db = await _prefs;
    final bool response = await db.setInt(_widthFieldColLimit, index);
    return response;
  }
}