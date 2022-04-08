import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvironmentService {
  Future<void> load();
  String get(String name);
  String? maybeGet(String name);

  factory EnvironmentService() = _EnvironmentService;
}

class _EnvironmentService implements EnvironmentService {
  const _EnvironmentService();

  @override
  Future<void> load() => dotenv.load();

  @override
  String get(String name) => dotenv.get(name);

  @override
  String? maybeGet(String name) => dotenv.maybeGet(name);
}
