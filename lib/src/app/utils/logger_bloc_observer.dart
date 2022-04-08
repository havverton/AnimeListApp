import 'package:bloc/bloc.dart';

import '../../core/core.dart';

class LoggerBlocObserver extends BlocObserver {
  final Logger _logger;

  LoggerBlocObserver(this._logger);

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _logger.debug('onEvent $bloc - $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _logger.error('onError $bloc', error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    _logger.debug('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logger.debug('onTransition to state ${transition.nextState}');
  }
}
