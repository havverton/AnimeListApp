import 'package:injectable/injectable.dart';

import '../../../core/classes/use_case.dart';
import '../../../modules/counter/counter_repository.dart';

@injectable
abstract class IncrementUsecase implements Usecase<int, void> {
  @factoryMethod
  factory IncrementUsecase(CounterRepository repository) =
      _IncrementUsecaseImpl;
}

class _IncrementUsecaseImpl implements IncrementUsecase {
  const _IncrementUsecaseImpl(this.repository);

  final CounterRepository repository;

  @override
  Future<int> call([void parameter]) async {
    final counter = await repository.getCounter();

    final result = counter + 1;

    await repository.updateCounter(result);

    return result;
  }
}
