bool? coerceBoolean(dynamic value) {
  if (value == null) {
    return null;
  }

  if (value is String) {
    return value.toLowerCase() == 'true';
  }

  if (value is num) {
    return value > 0;
  }

  if (value is! bool) {
    return true;
  }

  return value;
}

dynamic skipEmptyObject(Map<dynamic, dynamic> json, String key) {
  final result = json[key];

  if (result is Map && result.isEmpty) {
    return null;
  }

  return result;
}
