import 'package:shared_preferences/shared_preferences.dart';

import '../../core/database/constants.dart';
import '../entity/datatype_config_entity.dart';

const _baseField = "${databasePrefix}_datatype_config";

class DataTypeConfigDataSource {
  final Future<SharedPreferences> _db;

  DataTypeConfigDataSource(Future<SharedPreferences> isarDB) : _db = isarDB;

  String _getDbKey(DataTypeConfigField field, DataTypeConfigEntityKey key) {
    switch (field) {
      case DataTypeConfigField.defaultValues:
        return "${_baseField}_default_values_$key";
    }
  }

  Future<DataTypeConfigDefaultValues?> getDefaultValues(DataTypeConfigEntityKey key) async {
    final prefs = await _db;
    const field = DataTypeConfigField.defaultValues;
    final dbKey = _getDbKey(field, key);
    final DataTypeConfigDefaultValues? defaultValues = prefs.getStringList(dbKey);
    return defaultValues;
  }

  Future<bool> setDefaultValues(DataTypeConfigEntityKey key, DataTypeConfigDefaultValues defaultValues) async {
    final prefs = await _db;
    const field = DataTypeConfigField.defaultValues;
    final dbKey = _getDbKey(field, key);    
    final bool response = await prefs.setStringList(dbKey, defaultValues);
    return response;
  }
}
