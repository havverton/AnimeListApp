import 'package:injectable/injectable.dart';

@lazySingleton
abstract class RuntimeStorage {
  @factoryMethod
  factory RuntimeStorage() = _RuntimeStorageImpl;

  void put<T>(Object key, T value);
  T? get<T>(Object key);
}

class _RuntimeStorageImpl implements RuntimeStorage {
  _RuntimeStorageImpl() {
    _data = <Object, dynamic>{};
  }

  late Map<Object, dynamic> _data;

  @override
  void put<T>(Object key, T value) {
    _data[key] = value;
  }

  @override
  T? get<T>(Object key) => _data[key] as T?;
}
