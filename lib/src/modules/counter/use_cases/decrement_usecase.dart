import 'package:injectable/injectable.dart';

import '../../../core/classes/use_case.dart';
import '../../../modules/counter/counter_repository.dart';

@injectable
abstract class DecrementUsecase implements Usecase<int, void> {
  @factoryMethod
  factory DecrementUsecase(CounterRepository repository) =
      _DecrementUsecaseImpl;
}

class _DecrementUsecaseImpl implements DecrementUsecase {
  const _DecrementUsecaseImpl(this.repository);

  final CounterRepository repository;

  @override
  Future<int> call([void parameter]) async {
    final counter = await repository.getCounter();

    final result = counter - 1;

    await repository.updateCounter(result);

    return result;
  }
}
