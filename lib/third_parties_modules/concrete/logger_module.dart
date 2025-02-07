import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:herogram/third_parties_modules/abstract/i_logger_module.dart';

@Singleton(as: ILoggerModule)
class LoggerModule extends ILoggerModule {

  LoggerModule();

  @override
  Future<void> init() async {
  }

  @override
  void logCritical(
      {required final Object exception,
      required final StackTrace stackTrace})  {

      print(' error log $exception $stackTrace');
  }


  @override
  void debugLog(final String content) {
    print(' $content');
  }
}
