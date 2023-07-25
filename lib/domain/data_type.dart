enum DataType {
  name,
  nameLimit,
  quantity,
  quantityLimit,
  height,
  heightLimit,
  width,
  widthLimit,
}

class GetTupleDataType {
  static (DataType, DataType) get nameTuple => (DataType.name, DataType.nameLimit);
  static (DataType, DataType) get quantityTuple => (DataType.quantity, DataType.quantityLimit);
  static (DataType, DataType) get heightTuple => (DataType.height, DataType.heightLimit);
  static (DataType, DataType) get widthTuple => (DataType.width, DataType.widthLimit);
}
