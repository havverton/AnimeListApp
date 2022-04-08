abstract class Runner {
  const Runner();

  Future<void> init() async {
    await initDependencies();

    run();
  }

  Future<void> call() => init();

  void run();

  Future<void> initDependencies();
}
