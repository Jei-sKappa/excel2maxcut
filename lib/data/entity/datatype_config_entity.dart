typedef DataTypeConfigEntityKey = String;
typedef DataTypeConfigDefaultValues = List<String>;

enum DataTypeConfigField {
  defaultValues,
}

class DataTypeConfigEntity {
  final DataTypeConfigEntityKey key;
  final DataTypeConfigDefaultValues? defaultValues;

  DataTypeConfigEntity({
    required this.key,
    required this.defaultValues,
  });
}
