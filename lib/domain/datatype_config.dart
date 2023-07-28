typedef DataTypeConfigKey = String;

class DataTypeConfig {
  final DataTypeConfigKey key;
  final List<String>? defaultValues;

  DataTypeConfig({
    required this.key,
    this.defaultValues,
  });

  DataTypeConfig copyWith({
    DataTypeConfigKey? key,
    List<String>? defaultValues,
  }) {
    return DataTypeConfig(
      key: key ?? this.key,
      defaultValues: defaultValues ?? this.defaultValues,
    );
  }
}
