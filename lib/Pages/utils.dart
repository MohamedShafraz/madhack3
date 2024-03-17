enum ParamType { String, Int, Double, Bool }

dynamic serializeParam(dynamic value, ParamType type) {
  switch (type) {
    case ParamType.String:
      return value.toString();
    case ParamType.Int:
      return int.tryParse(value.toString());
    case ParamType.Double:
      return double.tryParse(value.toString());
    case ParamType.Bool:
      return value.toString().toLowerCase() == 'true';
    default:
      throw ArgumentError('Unsupported param type: $type');
  }
}
