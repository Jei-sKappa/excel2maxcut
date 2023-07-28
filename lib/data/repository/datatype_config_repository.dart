import '../../domain/datatype_config.dart';
import '../datasource/datatype_config_datasource.dart';
import '../entity/datatype_config_entity.dart';
import '../mapper/datatype_config_mapper.dart';

class DataTypeConfigRepository {
  final DataTypeConfigDataSource _dataSource;

  DataTypeConfigRepository(this._dataSource);

  Future<DataTypeConfig> getConfig(DataTypeConfigKey key) async {
    final defaultValues = await _dataSource.getDefaultValues(key);
    final dataSourceEntity = DataTypeConfigEntity(key: key, defaultValues: defaultValues);
    final model = DataTypeConfigMapper.toModel(dataSourceEntity);
    return model;
  }

  Future<bool> setConfig(DataTypeConfig config) async {
    final entity = DataTypeConfigMapper.toEntity(config);
    if (entity.defaultValues == null) {
      return false;
    }

    final response = await _dataSource.setDefaultValues(entity.key, entity.defaultValues!);
    return response;
  }
}
