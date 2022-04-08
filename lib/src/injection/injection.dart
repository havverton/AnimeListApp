import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

export 'injectable_names.dart';

final sl = GetIt.instance;

@injectableInit
Future<void> initInjection() async {
  await $initGetIt(sl);
}
