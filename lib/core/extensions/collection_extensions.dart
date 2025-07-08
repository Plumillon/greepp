
extension IterableExtensions<T> on Iterable<T> {
  bool isEqual(Iterable iterable) {
    if (length != iterable.length) {
      return false;
    }

    for (var item in iterable) {
      if (!contains(item)) {
        return false;
      }
    }

    return true;
  }

  T? getOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }

    return null;
  }
}

extension MapExtensions on Map {
  T get<T>(String key) {
    if (containsKey(key)) {
      return this[key] as T;
    }

    throw StateError('Key $key not found');
  }

  T? getOrNull<T>(String key) {
    return getOr(key, null);
  }

  T getOr<T>(String key, T defaultValue) {
    if (containsKey(key)) {
      return this[key] as T;
    }

    return defaultValue;
  }
}

dynamic deepParse<T, L>(dynamic data) {
  if (data is Map) {
    return Map<T, L>.fromEntries(
      data.entries.map(
        (e) => MapEntry(
          e.key,
          deepParse(e.value),
        ),
      ),
    );
  }
  if (data is List) {
    return List.from(
      data.map(
        (e) => deepParse(e),
      ),
    );
  }

  return data;
}
