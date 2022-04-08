import 'package:injectable/injectable.dart';

import '../../../core/classes/use_case.dart';
import '../../../modules/counter/counter_repository.dart';

@injectable
abstract class ResetUsecase implements Usecase<int, void> {
  @factoryMethod
  factory ResetUsecase(CounterRepository repository) = _ResetUsecaseImpl;
}

class _ResetUsecaseImpl implements ResetUsecase {
  const _ResetUsecaseImpl(this.repository);
  final CounterRepository repository;

  @override
  Future<int> call([void parameter]) async {
    await repository.updateCounter(0);

    return 0;
  }
}
