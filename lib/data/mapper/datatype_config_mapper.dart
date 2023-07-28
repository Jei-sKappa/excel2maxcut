import '../../domain/datatype_config.dart';
import '../entity/datatype_config_entity.dart';

class DataTypeConfigMapper {
  static DataTypeConfigEntity toEntity(DataTypeConfig model) {
    return DataTypeConfigEntity(
      key: model.key,
      defaultValues: model.defaultValues,
    );
  }

  static DataTypeConfig toModel(DataTypeConfigEntity entity) {
    return DataTypeConfig(
      key: entity.key,
      defaultValues: entity.defaultValues ?? [],
    );
  }
}
