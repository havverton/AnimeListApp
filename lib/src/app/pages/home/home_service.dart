import 'package:injectable/injectable.dart';

import '../../../modules/counter/use_cases/decrement_usecase.dart';
import '../../../modules/counter/use_cases/increment_usecase.dart';
import '../../../modules/counter/use_cases/reset_usecase.dart';

@injectable
abstract class HomeService {
  @factoryMethod
  factory HomeService(
    IncrementUsecase incrementUsecase,
    DecrementUsecase decrementUsecase,
    ResetUsecase resetUsecase,
  ) = _HomeServiceImpl;

  Future<int> increment();
  Future<int> decrement();
  Future<int> reset();
  Future<int> getCounter();
}

class _HomeServiceImpl implements HomeService {
  const _HomeServiceImpl(
    this.incrementUsecase,
    this.decrementUsecase,
    this.resetUsecase,
  );

  final IncrementUsecase incrementUsecase;
  final DecrementUsecase decrementUsecase;
  final ResetUsecase resetUsecase;

  @override
  Future<int> increment() {
    void _;
    return incrementUsecase(_);
  }

  @override
  Future<int> decrement() {
    void _;
    return decrementUsecase(_);
  }

  @override
  Future<int> getCounter() async {
    return 0;
  }

  @override
  Future<int> reset() {
    void _;
    return resetUsecase(_);
  }
}
