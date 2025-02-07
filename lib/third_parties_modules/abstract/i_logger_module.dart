abstract class ILoggerModule {
  Future<void> init();
  void logCritical(
      {required final Object exception,
      required final StackTrace stackTrace});
  void debugLog(final String content);
}
