import 'package:injectable/injectable.dart';
import '../../utils/runtime_storage.dart';

@injectable
abstract class CounterRepository {
  @factoryMethod
  factory CounterRepository(RuntimeStorage storage) = _CounterRepositoryImpl;

  Future<int> getCounter();
  Future<void> updateCounter(int counter);
}

class _CounterRepositoryImpl implements CounterRepository {
  _CounterRepositoryImpl(this.storage);

  final RuntimeStorage storage;
  static const String _key = 'counter';

  @override
  Future<int> getCounter() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    return storage.get(_key) ?? 0;
  }

  @override
  Future<void> updateCounter(int counter) async {
    storage.put(_key, counter);
  }
}
