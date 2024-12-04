import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

mixin Log {
  static final logger = Logger(printer: PrettyPrinter(), level: Level.all);

  /// Optional configuration
  ///
  /// [minimumLogLevel] - minimum level that should be printed. Notice that
  /// [LogLevel].error will be always printed.
  static void setup({
    bool flutterErrors = true,
    bool platformErrors = true,
    bool isolateErrors = true,
  }) {
    if (flutterErrors) {
      registerFlutterError();
    }
    if (platformErrors) {
      registerPlatformError();
    }
    if (isolateErrors) {
      registerIsolateError();
    }
  }

  static void registerFlutterError() {
    FlutterError.onError = (details) {
      logger.t(
        'Flutter error: $details',
        // In debugMode stackTrace will be printed as part of exception
        stackTrace: kDebugMode ? null : details.stack,
      );
    };
  }

  static void registerPlatformError() {
    PlatformDispatcher.instance.onError = (error, stack) {
      logger.t(
        'Platform error: $error',
        stackTrace: stack,
      );
      return true;
    };
  }

  static void registerIsolateError() {
    Isolate.current.addErrorListener(
      RawReceivePort((pair) async {
        if (pair case [final Object error, final String stackTraceString]) {
          logger.t(
            'Isolate error: $error',
            stackTrace: StackTrace.fromString(stackTraceString),
          );
        }
      }).sendPort,
    );
  }
}
